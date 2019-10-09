classdef IoteryDevice < handle
%     IoteryDevice is a wrapper for the Iotery.io Embedded SDK REST API.  
%     For more information on the funtions,  see:
%     https://iotery.io/v1/docs/embedded
%       Available methods:
%		getDeviceTokenBasic( data)
%		setBatchedCommandInstancesAsExecuted(batchReferenceUuid,  data)
%		getBrokerAddress( )
%		reportAlreadyExecutedCommands( data)
%		setCommandInstanceAsExecuted(commandInstanceUuid,  data)
%		getCommandTypeList( )
%		getCurrentTimestamp( )
%		getDataTypeList( )
%		updateDeviceChannel(deviceUuid, channelId,  data)
%		createDeviceCommandInstance(deviceUuid, commandTypeUuid,  data)
%		postData(deviceUuid,  data)
%		upsertDeviceSettings(deviceUuid,  data)
%		getDeviceSettingList(deviceUuid,  )
%		getDeviceUnexecutedCommandInstanceList(deviceUuid,  )
%		uploadDeviceLogs(deviceUuid,  data)
%		getDeviceTypeFirmwareRecord(deviceTypeUuid, version,  )
%		getPublicCloudKey( )
%		getMe( )
%		getNotificationTypeList( )
%		setNotificationInstanceInactive(notificationInstanceUuid,  data)
%		getSettingTypeList( )
%		getDeviceTokenAsymmetric( data)

    
    properties
        serial = '';
        key = '';
        secret = '';
        teamUuid = '';
        token = '';
        base_url = 'https://api.iotery.io/v1'
    end
    
    methods
        function obj = IoteryDevice(serial, key, secret, teamUuid)
            obj.serial = serial;
            obj.key = key;
            obj.secret = secret;
            obj.teamUuid = teamUuid;
            
            %              data = struct('serial',obj.serial,'field1',data);
        end
        
        function obj = getToken(obj)
            data = struct('serial', obj.serial);
            data.key = obj.key;
            data.secret = obj.secret;
            data.teamUuid = obj.teamUuid;
            res = obj.httpPost('/embedded/basic/get-token', data);
            obj.token = res.token;
            
        end
        
        function res = updateDevice(obj, deviceUuid, data)
            res = obj.httpPatchWithAuth(['/devices/' deviceUuid], data);
        end
        
        function res = getDeviceTokenBasic(obj,  data)
% getDeviceTokenBasic - Get token for device via key, serial, and secret.
% Input:  data
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1basic~1get-token/post
	res = obj.httpPostWithAuth([ '/'  'embedded' '/' 'basic' '/' 'get-token' '/'], data);
end

function res = setBatchedCommandInstancesAsExecuted(obj, batchReferenceUuid,  data)
% setBatchedCommandInstancesAsExecuted - Set a collection of batched command instances as executed.
% Input: batchReferenceUuid,  data
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1batch-command-instances~1:batchReferenceUuid~1executed/patch
	res = obj.httpPatchWithAuth([ '/'  'embedded' '/' 'batch-command-instances' '/' batchReferenceUuid '/' 'executed' '/'], data);
end

function res = getBrokerAddress(obj,  varargin)
% getBrokerAddress - Get the MQTT broker address.
% Input: 
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1broker-address/get
	res = obj.httpGetWithAuth([ '/'  'embedded' '/' 'broker-address' '/']);
end

function res = reportAlreadyExecutedCommands(obj,  data)
% reportAlreadyExecutedCommands - Report an already executed set of commands to the server.
% Input:  data
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1command-instances~1executed/post
	res = obj.httpPostWithAuth([ '/'  'embedded' '/' 'command-instances' '/' 'executed' '/'], data);
end

function res = setCommandInstanceAsExecuted(obj, commandInstanceUuid,  data)
% setCommandInstanceAsExecuted - Report that a command has been executed to the server.
% Input: commandInstanceUuid,  data
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1command-instances~1:commandInstanceUuid~1executed/patch
	res = obj.httpPatchWithAuth([ '/'  'embedded' '/' 'command-instances' '/' commandInstanceUuid '/' 'executed' '/'], data);
end

function res = getCommandTypeList(obj,  varargin)
% getCommandTypeList - Get a list of available command types.
% Input: 
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1command-types/get
	res = obj.httpGetWithAuth([ '/'  'embedded' '/' 'command-types' '/']);
end

function res = getCurrentTimestamp(obj,  varargin)
% getCurrentTimestamp - Get the current server time in epoch (unix) time.
% Input: 
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1current-timestamp/get
	res = obj.httpGetWithAuth([ '/'  'embedded' '/' 'current-timestamp' '/']);
end

function res = getDataTypeList(obj,  varargin)
% getDataTypeList - Get a list of available data types.
% Input: 
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1data-types/get
	res = obj.httpGetWithAuth([ '/'  'embedded' '/' 'data-types' '/']);
end

function res = updateDeviceChannel(obj, deviceUuid, channelId,  data)
% updateDeviceChannel - Update device channel.
% Input: deviceUuid, channelId,  data
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1devices~1:deviceUuid~1channelId~1:channelId/patch
	res = obj.httpPatchWithAuth([ '/'  'embedded' '/' 'devices' '/' deviceUuid '/' 'channelId' '/' channelId '/'], data);
end

function res = createDeviceCommandInstance(obj, deviceUuid, commandTypeUuid,  data)
% createDeviceCommandInstance - Create a command instance via a device.
% Input: deviceUuid, commandTypeUuid,  data
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1devices~1:deviceUuid~1command-types~1:commandTypeUuid/post
	res = obj.httpPostWithAuth([ '/'  'embedded' '/' 'devices' '/' deviceUuid '/' 'command-types' '/' commandTypeUuid '/'], data);
end

function res = postData(obj, deviceUuid,  data)
% postData - Post data to the cloud.
% Input: deviceUuid,  data
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1devices~1:deviceUuid~1data/post
	res = obj.httpPostWithAuth([ '/'  'embedded' '/' 'devices' '/' deviceUuid '/' 'data' '/'], data);
end

function res = upsertDeviceSettings(obj, deviceUuid,  data)
% upsertDeviceSettings - Upsert settings for a device.
% Input: deviceUuid,  data
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1devices~1:deviceUuid~1settings/post
	res = obj.httpPostWithAuth([ '/'  'embedded' '/' 'devices' '/' deviceUuid '/' 'settings' '/'], data);
end

function res = getDeviceSettingList(obj, deviceUuid,  varargin)
% getDeviceSettingList - Get a list of settings for a device.
% Input: deviceUuid, 
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1devices~1:deviceUuid~1settings/get
	res = obj.httpGetWithAuth([ '/'  'embedded' '/' 'devices' '/' deviceUuid '/' 'settings' '/']);
end

function res = getDeviceUnexecutedCommandInstanceList(obj, deviceUuid,  varargin)
% getDeviceUnexecutedCommandInstanceList - Get a list of unexecuted command instances for a device.
% Input: deviceUuid, 
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1devices~1:deviceUuid~1unexecuted-commands/get
	res = obj.httpGetWithAuth([ '/'  'embedded' '/' 'devices' '/' deviceUuid '/' 'unexecuted-commands' '/']);
end

function res = uploadDeviceLogs(obj, deviceUuid,  data)
% uploadDeviceLogs - Upload zip file of device logs.
% Input: deviceUuid,  data
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1devices~1:deviceUuid~1upload-log-file/post
	res = obj.httpPostWithAuth([ '/'  'embedded' '/' 'devices' '/' deviceUuid '/' 'upload-log-file' '/'], data);
end

function res = getDeviceTypeFirmwareRecord(obj, deviceTypeUuid, version,  varargin)
% getDeviceTypeFirmwareRecord - Get a desired version of a firmware record for a given device type.
% Input: deviceTypeUuid, version, 
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1firmware~1:deviceTypeUuid~1:version/get
	res = obj.httpGetWithAuth([ '/'  'embedded' '/' 'firmware' '/' deviceTypeUuid '/' version '/']);
end

function res = getPublicCloudKey(obj,  varargin)
% getPublicCloudKey - Get base64 encoded public key from the server for use in RSA scheme.
% Input: 
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1key/get
	res = obj.httpGetWithAuth([ '/'  'embedded' '/' 'key' '/']);
end

function res = getMe(obj,  varargin)
% getMe - Get information about the device.
% Input: 
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1me/get
	res = obj.httpGetWithAuth([ '/'  'embedded' '/' 'me' '/']);
end

function res = getNotificationTypeList(obj,  varargin)
% getNotificationTypeList - Get a list of available notifications.
% Input: 
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1notification-types/get
	res = obj.httpGetWithAuth([ '/'  'embedded' '/' 'notification-types' '/']);
end

function res = setNotificationInstanceInactive(obj, notificationInstanceUuid,  data)
% setNotificationInstanceInactive - Set notification instance inactive.
% Input: notificationInstanceUuid,  data
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1notification-instances~1:notificationInstanceUuid~1inactive/patch
	res = obj.httpPatchWithAuth([ '/'  'embedded' '/' 'notification-instances' '/' notificationInstanceUuid '/' 'inactive' '/'], data);
end

function res = getSettingTypeList(obj,  varargin)
% getSettingTypeList - Get a list of available setting types.
% Input: 
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1setting-types/get
	res = obj.httpGetWithAuth([ '/'  'embedded' '/' 'setting-types' '/']);
end

function res = getDeviceTokenAsymmetric(obj,  data)
% getDeviceTokenAsymmetric - Get device token based on encrypted credentials.
% Input:  data
% Link: https://iotery.io/docs/embedded#tag/Embedded/paths/~1embedded~1token~1asymmetric/post
	res = obj.httpPostWithAuth([ '/'  'embedded' '/' 'token' '/' 'asymmetric' '/'], data);
end


        
        
        function res = httpGetWithAuth(obj, route)
           options = weboptions('HeaderFields', {'Authorization' ['Bearer ' obj.token]});
           res = webread([obj.base_url route], options);
        end
        
        function res = httpPost(obj, route, data)
            options = weboptions('HeaderFields', {'Content-Type' 'application/json'});
            res = webwrite([obj.base_url route], data, options);
        end
        
        function res = httpPatchWithAuth(obj, route, data)
            options = weboptions('HeaderFields', {'Content-Type' 'application/json'; 'Authorization' ['Bearer ' obj.token]}, 'RequestMethod', 'patch');
            res = webwrite([obj.base_url route], data, options);
        end
        
        function res = httpPostWithAuth(obj, route, data)
            options = weboptions('HeaderFields',{'Content-Type' 'application/json'; 'Authorization' ['Bearer ' obj.token]});
            res = webwrite([obj.base_url route], data, options);
        end
        
    end
end