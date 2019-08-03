# Iotery MATLAB Device (Embedded) SDK

The Iotery Embedded MATLAB SDK is a light REST wrapper for the [Iotery REST API](https://iotery.io/docs/embedded) designed to help
the MATLAB user emulate a device in MATLAB and interact with the cloud as if it was a real device.

## Using the SDK in MATLAB

Download the included file `IoteryDevice.m` and place it in your current directory.

## Example

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
data.timestamp = current_time;
data.deviceUuid = device.uuid;
data.deviceTypeUuid = device.deviceTypeUuid;
data.data.vehicle_speed = 20.1;
data.data.route_edge = 'main_road';
data_out.packets = [data];
```

## Updating the SDK

If there are new API calls available on iotery.io and `IoteryDevice.m` has not been updated, then you can simple run `generator.m` and it will automatically generate an updated IoteryDevice.m file. Careful, it will overwrite your current file!