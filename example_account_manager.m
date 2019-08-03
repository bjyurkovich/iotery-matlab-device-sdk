% 2019 Iotery Account Manager Examples
clear all;
close all;
clc;

% Instantiate the Iotery Communication class for Account Manager.
% The argument is the token, retrieved at https://iotery.io/system
iotery = IoteryAccountManager('ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SnpkV0lpT2lJNVlXUXpZV015TkMxaU1tVTVMVEV4WlRrdE9EQm1OaTFrTWpnek5qRXdOall6WldNaUxDSnBZWFFpT2pFMU5qUTFNRFV5TURBc0ltVjRjQ0k2TkRjeU1ESTJOVEl3TUgwLmdZV2NQUW1ZY1ZhaktmTEJPaXR2b2piaE96S3JaTW55RHlZTXdTckxnN3c=');

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
