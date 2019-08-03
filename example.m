% 2019 Iotery Device Examples
clear all;
close all;
clc;

% Instantiate the Device Communication Class (IoteryDevice).
% This assumes you have created `traffic_vehicle` in the Iotery Dashboard.
% The last argument is the team ID (uuid), retrieved at https://iotery.io/system
device_comm = IoteryDevice('traffic_vehicle', 'traffic_vehicle', 'traffic_vehicle', '9ad3ac24-b2e9-11e9-80f6-d283610663ec');

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
