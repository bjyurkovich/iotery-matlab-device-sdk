# Iotery MATLAB SDKs

Iotery is a managed IoT cloud service.

The Iotery Embedded and Account Manager MATLAB SDKs are a light REST wrappers for the [Iotery REST API](https://iotery.io/docs) designed to help
the MATLAB user emulate a device in MATLAB or manage their IoT deployment (Iotery Account).

## Using the SDKs in MATLAB

To use the Embedded SDK, download the included file `IoteryDevice.m` and place it in your current directory.

To use the Account Manager SDK, download the included file `IoteryAccountManager.m` and place it in your current directory.

## Example - Embedded

The following example assumes that you have created a device type, device, and data types in Iotery via the dashboard or API.

```matlab
clear all;
close all;
clc;

% Instantiate the Device Communication Class (IoteryDevice).
% This assumes you have created `traffic_vehicle` in the Iotery Dashboard.
% The last argument is the team ID (uuid), retrieved at https://iotery.io/system
device_comm = IoteryDevice('traffic_vehicle_serial', 'traffic_vehicle_key', 'traffic_vehicle_secret', '1ad3ad24-b2e9-21e9-80f6-d283610663ed');

% Get the token (security step).  This is basic security.  You will want to
% review keyed security if you are interested in implementing
% cryptographically signed authentication (more secure).
device_comm.getToken();

% Get information about the device
device = device_comm.getMe();

% Get the current time from Iotery
current_time = device_comm.getCurrentTimestamp();

% Assumes you have created some data types (VEHICLE_SPEED, and ROUTE_EDGE) in the iotery dashboard
data_types = device_comm.getDataTypeList();

% Construct the data packet to send to the iotery
data_out = struct();
data_out.packets = [];

data.timestamp = current_time;
data.deviceUuid = device.uuid;
data.deviceTypeUuid = device.deviceTypeUuid;
data.data.vehicle_speed = 20.1;
data.data.route_edge = 'main_road';
data_out.packets = [data];

% Send the data to Iotery
device_comm.postData(device.uuid, data_out)

% Retrieve the data as a CSV on the Iotery dashboard, or check out the
% Server API at https://iotery.io/docs/account-manager

```

## Example - Account Manager

The following is an example of retrieving data from Iotery for an Iotery IoT device.

```matlab
% 2019 Iotery Account Manager Examples
clear all;
close all;
clc;

% Instantiate the Iotery Communication class for Account Manager.
% The argument is the token, retrieved at https://iotery.io/system
iotery = IoteryAccountManager('IOTERY-API-TOKEN-GOES-HERE');

% Retrieve all the team's device types and devices
device_types = iotery.getDeviceTypeList().results;
devices = iotery.getDeviceList().results;

% The following example assumes you have created a vehicle device with data
% type 'VEHICLE_SPEED' on the Iotery dashboard (or through the
% IoteryAccountManager API) and posted some data using the Embedded API
% (using IoteryDevice.m)
data = iotery.getDeviceDataList(devices(1).uuid).results;

% Plot data for vehicle speed
unit = {};
timestamp = [];
vehicle_speed = [];
for i=1:length(data)
    if strcmp(data(i).dataType.enum, 'VEHICLE_SPEED')
        unit{end+1} = data(i).dataType.units;
        timestamp(end+1) = data(i).timestamp;
        vehicle_speed(end+1) = data(i).value;
    end
end

figure()
plot(timestamp, vehicle_speed, '--.', 'LineWidth', 2, 'MarkerSize', 25)
xlabel('Unix Timestamp')
ylabel(['Vehicle Speed (' unit{1} ')'])
grid on;

```

## How do I know what to pass in as data?

For information regarding the `data` arguments, refer to the [Iotery REST API](https://iotery.io/docs/embedded) documentation.

Every `data` parameter in the SDK (ex. `iotery.updateDevice(deviceUuid, data)`) maps to a JSON object.

For example, a `POST` JSON payload that looks like:

```json
{
  "packets": [
    {
      "timestamp": 1564609195,
      "fractionalSeconds": 0.33,
      "deviceUuid": "ba90ac1a-b3db-11e9-aa6f-79fb808c3f95",
      "deviceTypeUuid": "ba6764e0-b3db-11e9-aa6f-79fb808c3f95",
      "data": {
        "voltage": 14,
        "device_message": "info",
        "temperature": 100
      }
    }
  ]
}
```

would be built like so:

```matlab
data_out = struct();
data_out.packets = [];

t1 = datetime();
format longG
data.timestamp = posixtime(t1);
data.fractionalSeconds = 0.33;

data.deviceUuid = 'ba90ac1a-b3db-11e9-aa6f-79fb808c3f95';
data.deviceTypeUuid = 'ba6764e0-b3db-11e9-aa6f-79fb808c3f95';
data.data.voltage = 14;
data.data.device_message = 'info';
data.data.temperature = 100;
data_out.packets = [data];
```

## Updating the SDK

If there are new API calls available on iotery.io and `IoteryDevice.m` or `IoteryAccountManager.m` has not been updated, then you can simple run `src/generator.m` and it will automatically generate an updated `IoteryDevice.m` and `IoteryAccountManager.m` files. Careful, it will overwrite your current files!
