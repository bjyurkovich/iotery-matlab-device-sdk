classdef IoteryAccountManager < handle
%     IoteryAccountManager is a wrapper for the Iotery.io Account Manager SDK REST API.  
%     For more information on the funtions,  see:
%     https://iotery.io/v1/docs/account-manager
%		getHealthCheckResult( )
%		createAccountManager( data)
%		getAccountManager(userUuid)
%		updateAccountManager(userUuiddata)
%		deleteAccountManager(userUuid)
%		createConsumer( data)
%		getConsumerList( )
%		getConsumer(consumerUuid)
%		updateConsumer(consumerUuiddata)
%		deleteConsumer(consumerUuid)
%		linkConsumerToDevice(consumerUuiddata)
%		unlinkConsumerFromDevice(consumerUuid, deviceUuid)
%		linkConsumerToNetwork(consumerUuiddata)
%		unlinkConsumerFromNetwork(consumerUuid, networkUuid)
%		createConsumerSecret(consumerUuiddata)
%		deleteConsumerSecretList(consumerUuid)
%		createDeviceType( data)
%		getDeviceTypeList( )
%		getDeviceType(deviceTypeUuid)
%		updateDeviceType(deviceTypeUuiddata)
%		deleteDeviceType(deviceTypeUuid)
%		createSettingType( data)
%		getSettingTypeList( )
%		getSettingType(settingTypeUuid)
%		updateSettingType(settingTypeUuiddata)
%		deleteSettingType(settingTypeUuid)
%		createDefaultSetting( data)
%		getDefaultSettingList( )
%		getDefaultSetting(defaultSettingUuid)
%		updateDefaultSetting(defaultSettingUuiddata)
%		deleteDefaultSetting(defaultSettingUuid)
%		createDataType( data)
%		getDataTypeList( )
%		getDataType(dataTypeUuid)
%		updateDataType(dataTypeUuiddata)
%		deleteDataType(dataTypeUuid)
%		getCommandInstanceList( )
%		getCommandInstance(commandInstanceUuid)
%		updateCommandInstance(commandInstanceUuiddata)
%		createDevice( data)
%		getDeviceList( )
%		createBatchedCommandInstances( data)
%		getDevice(deviceUuid)
%		updateDevice(deviceUuiddata)
%		deleteDevice(deviceUuid)
%		clearUnexecutedDeviceCommandInstances(deviceUuiddata)
%		createDeviceCommandInstance(deviceUuiddata)
%		getDeviceDataList(deviceUuid)
%		getDeviceEventList(deviceUuid)
%		getDeviceIsppConfiguration(deviceUuid)
%		updateDeviceIsppConfiguration(deviceUuid)
%		createDeviceNotificationInstance(deviceUuiddata)
%		getDeviceNotificationInstanceList(deviceUuid)
%		createSetting(deviceUuiddata)
%		getDeviceSettingList(deviceUuid)
%		getDeviceSystemEventList(deviceUuid)
%		getNotificationInstance(notificationInstanceUuid)
%		updateNotificationInstance(notificationInstanceUuiddata)
%		deleteNotificationInstance(notificationInstanceUuid)
%		getSetting(settingUuid)
%		updateSetting(settingUuiddata)
%		deleteSetting(settingUuid)
%		createFirmwareRecord( data)
%		getFirmwareRecordList( )
%		getFirmwareRecord(firmwareUuid)
%		updateFirmwareRecord(firmwareUuiddata)
%		deleteFirmwareRecord(firmwareUuid)
%		createSeverityType( data)
%		getSeverityTypeList( )
%		getSeverityType(severityTypeUuid)
%		updateSeverityType(severityTypeUuiddata)
%		deleteSeverityType(severityTypeUuid)
%		createNotificationType( data)
%		getNotificationTypeList( )
%		getNotificationType(notificationTypeUuid)
%		updateNotificationType(notificationTypeUuiddata)
%		deleteNotificationType(notificationTypeUuid)
%		createNotificationField( data)
%		getNotificationFieldList( )
%		getNotificationField(notificationFieldUuid)
%		updateNotificationField(notificationFieldUuiddata)
%		deleteNotificationField(notificationFieldUuid)
%		createPriorityType( data)
%		getPriorityTypeList( )
%		getPriorityType(priorityTypeUuid)
%		updatePriorityType(priorityTypeUuiddata)
%		deletePriorityType(priorityTypeUuid)
%		createCommandType( data)
%		getCommandTypeList( )
%		getCommandType(commandTypeUuid)
%		updateCommandType(commandTypeUuiddata)
%		deleteCommandType(commandTypeUuid)
%		createCommandField( data)
%		getCommandFieldList( )
%		getCommandField(commandFieldUuid)
%		updateCommandField(commandFieldUuiddata)
%		deleteCommandField(commandFieldUuid)
%		createEventType( data)
%		getEventTypeList( )
%		getEventType(eventTypeUuid)
%		updateEventType(eventTypeUuiddata)
%		deleteEventType(eventTypeUuid)
%		createEvent( data)
%		getEventList( )
%		getEvent(eventUuid)
%		updateEvent(eventUuiddata)
%		deleteEvent(eventUuid)
%		createGroupingType( data)
%		getGroupingTypeList( )
%		getGroupingType(groupingTypeUuid)
%		updateGroupingType(groupingTypeUuiddata)
%		deleteGroupingType(groupingTypeUuid)
%		createTeam( data)
%		getTeamList( )
%		getTeam(teamUuid)
%		updateTeam(teamUuiddata)
%		deleteTeam(teamUuid)
%		linkAccountManagerToTeam(userUuiddata)
%		unlinkAccountManagerFromTeam(userUuid)
%		resetTeam(teamUuiddata)
%		getGrouping(groupingUuid)
%		updateGrouping(groupingUuiddata)
%		deleteGrouping(groupingUuid)
%		getChildGroupingList(groupingUuid)
%		createGroupingBatchedCommands(groupingUuiddata)
%		getDeviceListForGrouping(groupingUuid)
%		moveDeviceToGrouping(groupingUuiddata)
%		updateNetworkLocation(networkLocationUuiddata)
%		createNetwork( data)
%		getNetworkList( )
%		getNetwork(networkUuid)
%		updateNetwork(networkUuiddata)
%		deleteNetwork(networkUuid)
%		createNetworkBatchedCommands(networkUuiddata)
%		getNetworkDeviceList(networkUuid)
%		getNetworkGroupingList(networkUuid)
%		createGrouping(networkUuiddata)
%		getNetworkGrouping(networkUuid, groupingUuid)
%		updateNetworkGrouping(networkUuid, groupingUuiddata)
%		deleteNetworkGrouping(networkUuid, groupingUuid)
%		addChildGrouping(networkUuid, groupingUuiddata)
%		removeDeviceFromGrouping(networkUuid, groupingUuid, deviceUuid)
%		getNetworkLocationList(networkUuid)
%		createNetworkLocation(networkUuiddata)
%		getNetworkLocation(networkUuid, networkLocationUuid)
%		updateNetworkNetworkLocation(networkUuid, networkLocationUuiddata)
%		deleteNetworkLocation(networkUuid, networkLocationUuid)
%		getNetworkScheduleList(networkUuid)
%		createSchedule(networkUuiddata)
%		getNetworkSchedule(networkUuid, scheduleUuid)
%		updateNetworkSchedule(networkUuid, scheduleUuiddata)
%		deleteNetworkSchedule(networkUuid, scheduleUuid)
%		executeNetworkSchedule(networkUuid, scheduleUuiddata)
%		deprovisionNetwork(networkUuiddata)
%		provisionNetwork( data)
%		provisionDevice(networkUuid, deviceUuiddata)
%		deprovisionDevice(networkUuid, deviceUuiddata)
%		getSchedule(scheduleUuid)
%		updateSchedule(scheduleUuiddata)
%		deleteSchedule(scheduleUuid)
%		executeSchedule(scheduleUuiddata)
%		createGroupingDevice( data)
%		getGroupingDeviceList( )
%		getGroupingDevice(groupingDeviceUuid)
%		updateGroupingDevice(groupingDeviceUuiddata)
%		deleteGroupingDevice(groupingDeviceUuid)
%		createGroupingLink( data)
%		getGroupingLinkList( )
%		getGroupingLink(groupingLinkUuid)
%		updateGroupingLink(groupingLinkUuiddata)
%		deleteGroupingLink(groupingLinkUuid)
%		createWebhookAction( data)
%		getWebhookActionList( )
%		getWebhookAction(webhookActionUuid)
%		updateWebhookAction(webhookActionUuiddata)
%		deleteWebhookAction(webhookActionUuid)
%		getWebhookActionTypeList( )
%		getWebhookActionType(webhookActionTypeUuid)
%		createQrCode( data)
%		getQrCodeList( )
%		getQrCode(qrCodeUuid)
%		updateQrCode(qrCodeUuiddata)
%		deleteQrCode(qrCodeUuid)

    
    properties
        token = '';
        base_url = 'https://api.iotery.io/v1'
    end
    
    methods
        function obj = IoteryAccountManager(token)
            obj.token = token;
            options = weboptions('HeaderFields',{'Content-Type' 'application/json'; 'X-API-Key' token});
%             try
                webread([obj.base_url '/device-types'], options);
%             catch
%                 error('Check your internet connection and verify your token is correct.  You can retrieve your token from the dashboard at https://iotery.io/system')
%             end
        end
        
        
        function res = getHealthCheckResult(obj,  varargin)
% getHealthCheckResult - Get the result of a server health check.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Iotery-Health-Check/paths/~1health-check/get
	res = obj.httpGetWithAuth([ '/'  'health-check' '/']);
end

function res = createAccountManager(obj,  data)
% createAccountManager - Create an account manager.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Accout-Managers/paths/~1account-managers/post
	res = obj.httpPostWithAuth([ '/'  'account-managers' '/'], data);
end

function res = getAccountManager(obj, userUuid,  varargin)
% getAccountManager - Get an account manager by uuid.
% Input: userUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Accout-Managers/paths/~1account-managers~1:userUuid/get
	res = obj.httpGetWithAuth([ '/'  'account-managers' '/' userUuid '/']);
end

function res = updateAccountManager(obj, userUuid,  data)
% updateAccountManager - Update an account manager by uuid.
% Input: userUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Accout-Managers/paths/~1account-managers~1:userUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'account-managers' '/' userUuid '/'], data);
end

function res = deleteAccountManager(obj, userUuid,  varargin)
% deleteAccountManager - Delete an account manager by uuid.
% Input: userUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Accout-Managers/paths/~1account-managers~1:userUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'account-managers' '/' userUuid '/']);
end

function res = createConsumer(obj,  data)
% createConsumer - Create a consumer.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Consumers/paths/~1consumers/post
	res = obj.httpPostWithAuth([ '/'  'consumers' '/'], data);
end

function res = getConsumerList(obj,  varargin)
% getConsumerList - Get a list of available consumers.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Consumers/paths/~1consumers/get
	res = obj.httpGetWithAuth([ '/'  'consumers' '/']);
end

function res = getConsumer(obj, consumerUuid,  varargin)
% getConsumer - Get a consumer by uuid.
% Input: consumerUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Consumers/paths/~1consumers~1:consumerUuid/get
	res = obj.httpGetWithAuth([ '/'  'consumers' '/' consumerUuid '/']);
end

function res = updateConsumer(obj, consumerUuid,  data)
% updateConsumer - Update a consumer by uuid.
% Input: consumerUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Consumers/paths/~1consumers~1:consumerUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'consumers' '/' consumerUuid '/'], data);
end

function res = deleteConsumer(obj, consumerUuid,  varargin)
% deleteConsumer - Delete a consumer by uuid.
% Input: consumerUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Consumers/paths/~1consumers~1:consumerUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'consumers' '/' consumerUuid '/']);
end

function res = linkConsumerToDevice(obj, consumerUuid,  data)
% linkConsumerToDevice - Link a consumer to a device.
% Input: consumerUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Consumers/paths/~1consumers~1:consumerUuid~1devices/post
	res = obj.httpPostWithAuth([ '/'  'consumers' '/' consumerUuid '/' 'devices' '/'], data);
end

function res = unlinkConsumerFromDevice(obj, consumerUuid, deviceUuid,  varargin)
% unlinkConsumerFromDevice - Unlink a consumer from a device.
% Input: consumerUuid, deviceUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Consumers/paths/~1consumers~1:consumerUuid~1devices~1:deviceUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'consumers' '/' consumerUuid '/' 'devices' '/' deviceUuid '/']);
end

function res = linkConsumerToNetwork(obj, consumerUuid,  data)
% linkConsumerToNetwork - Link a consumer to a network.
% Input: consumerUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Consumers/paths/~1consumers~1:consumerUuid~1networks/post
	res = obj.httpPostWithAuth([ '/'  'consumers' '/' consumerUuid '/' 'networks' '/'], data);
end

function res = unlinkConsumerFromNetwork(obj, consumerUuid, networkUuid,  varargin)
% unlinkConsumerFromNetwork - Unlink a consumer from a network.
% Input: consumerUuid, networkUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Consumers/paths/~1consumers~1:consumerUuid~1networks~1:networkUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'consumers' '/' consumerUuid '/' 'networks' '/' networkUuid '/']);
end

function res = createConsumerSecret(obj, consumerUuid,  data)
% createConsumerSecret - Create a consumer secret for authentication.
% Input: consumerUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Consumers/paths/~1consumers~1:consumerUuid~1secrets/post
	res = obj.httpPostWithAuth([ '/'  'consumers' '/' consumerUuid '/' 'secrets' '/'], data);
end

function res = deleteConsumerSecretList(obj, consumerUuid,  varargin)
% deleteConsumerSecretList - Delete all stored consumer secrets.
% Input: consumerUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Consumers/paths/~1consumers~1:consumerUuid~1secrets/delete
	res = obj.httpDeleteWithAuth([ '/'  'consumers' '/' consumerUuid '/' 'secrets' '/']);
end

function res = createDeviceType(obj,  data)
% createDeviceType - Create a device type.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Device-Types/paths/~1device-types/post
	res = obj.httpPostWithAuth([ '/'  'device-types' '/'], data);
end

function res = getDeviceTypeList(obj,  varargin)
% getDeviceTypeList - Get a list of available device types.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Device-Types/paths/~1device-types/get
	res = obj.httpGetWithAuth([ '/'  'device-types' '/']);
end

function res = getDeviceType(obj, deviceTypeUuid,  varargin)
% getDeviceType - Get a device type by uuid.
% Input: deviceTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Device-Types/paths/~1device-types~1:deviceTypeUuid/get
	res = obj.httpGetWithAuth([ '/'  'device-types' '/' deviceTypeUuid '/']);
end

function res = updateDeviceType(obj, deviceTypeUuid,  data)
% updateDeviceType - Update a device type by uuid.
% Input: deviceTypeUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Device-Types/paths/~1device-types~1:deviceTypeUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'device-types' '/' deviceTypeUuid '/'], data);
end

function res = deleteDeviceType(obj, deviceTypeUuid,  varargin)
% deleteDeviceType - Delete a device type by uuid.
% Input: deviceTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Device-Types/paths/~1device-types~1:deviceTypeUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'device-types' '/' deviceTypeUuid '/']);
end

function res = createSettingType(obj,  data)
% createSettingType - Create a setting type.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Device-Setting-Types/paths/~1setting-types/post
	res = obj.httpPostWithAuth([ '/'  'setting-types' '/'], data);
end

function res = getSettingTypeList(obj,  varargin)
% getSettingTypeList - Get a list of available setting types.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Device-Setting-Types/paths/~1setting-types/get
	res = obj.httpGetWithAuth([ '/'  'setting-types' '/']);
end

function res = getSettingType(obj, settingTypeUuid,  varargin)
% getSettingType - Get a setting type by uuid.
% Input: settingTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Device-Setting-Types/paths/~1setting-types~1:settingTypeUuid/get
	res = obj.httpGetWithAuth([ '/'  'setting-types' '/' settingTypeUuid '/']);
end

function res = updateSettingType(obj, settingTypeUuid,  data)
% updateSettingType - Update a setting type by uuid.
% Input: settingTypeUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Device-Setting-Types/paths/~1setting-types~1:settingTypeUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'setting-types' '/' settingTypeUuid '/'], data);
end

function res = deleteSettingType(obj, settingTypeUuid,  varargin)
% deleteSettingType - Delete a setting type by uuid.
% Input: settingTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Device-Setting-Types/paths/~1setting-types~1:settingTypeUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'setting-types' '/' settingTypeUuid '/']);
end

function res = createDefaultSetting(obj,  data)
% createDefaultSetting - Create a default setting.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Device-Default-Settings/paths/~1default-settings/post
	res = obj.httpPostWithAuth([ '/'  'default-settings' '/'], data);
end

function res = getDefaultSettingList(obj,  varargin)
% getDefaultSettingList - Get a list of default settings.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Device-Default-Settings/paths/~1default-settings/get
	res = obj.httpGetWithAuth([ '/'  'default-settings' '/']);
end

function res = getDefaultSetting(obj, defaultSettingUuid,  varargin)
% getDefaultSetting - Get a default setting by uuid.
% Input: defaultSettingUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Device-Default-Settings/paths/~1default-settings~1:defaultSettingUuid/get
	res = obj.httpGetWithAuth([ '/'  'default-settings' '/' defaultSettingUuid '/']);
end

function res = updateDefaultSetting(obj, defaultSettingUuid,  data)
% updateDefaultSetting - Update a default setting by uuid.
% Input: defaultSettingUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Device-Default-Settings/paths/~1default-settings~1:defaultSettingUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'default-settings' '/' defaultSettingUuid '/'], data);
end

function res = deleteDefaultSetting(obj, defaultSettingUuid,  varargin)
% deleteDefaultSetting - Delete a default setting by uuid.
% Input: defaultSettingUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Device-Default-Settings/paths/~1default-settings~1:defaultSettingUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'default-settings' '/' defaultSettingUuid '/']);
end

function res = createDataType(obj,  data)
% createDataType - Create a data type.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Data-Types/paths/~1data-types/post
	res = obj.httpPostWithAuth([ '/'  'data-types' '/'], data);
end

function res = getDataTypeList(obj,  varargin)
% getDataTypeList - Get a list of available data types.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Data-Types/paths/~1data-types/get
	res = obj.httpGetWithAuth([ '/'  'data-types' '/']);
end

function res = getDataType(obj, dataTypeUuid,  varargin)
% getDataType - Get a data type by uuid.
% Input: dataTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Data-Types/paths/~1data-types~1:dataTypeUuid/get
	res = obj.httpGetWithAuth([ '/'  'data-types' '/' dataTypeUuid '/']);
end

function res = updateDataType(obj, dataTypeUuid,  data)
% updateDataType - Update a data type by uuid.
% Input: dataTypeUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Data-Types/paths/~1data-types~1:dataTypeUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'data-types' '/' dataTypeUuid '/'], data);
end

function res = deleteDataType(obj, dataTypeUuid,  varargin)
% deleteDataType - Delete a data type by uuid.
% Input: dataTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Data-Types/paths/~1data-types~1:dataTypeUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'data-types' '/' dataTypeUuid '/']);
end

function res = getCommandInstanceList(obj,  varargin)
% getCommandInstanceList - Get a list of command instances.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1command-instances/get
	res = obj.httpGetWithAuth([ '/'  'command-instances' '/']);
end

function res = getCommandInstance(obj, commandInstanceUuid,  varargin)
% getCommandInstance - Get a command instance by uuid.
% Input: commandInstanceUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1command-instances~1:commandInstanceUuid/get
	res = obj.httpGetWithAuth([ '/'  'command-instances' '/' commandInstanceUuid '/']);
end

function res = updateCommandInstance(obj, commandInstanceUuid,  data)
% updateCommandInstance - Update a command instance by uuid.
% Input: commandInstanceUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1command-instances~1:commandInstanceUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'command-instances' '/' commandInstanceUuid '/'], data);
end

function res = createDevice(obj,  data)
% createDevice - Create a device.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1devices/post
	res = obj.httpPostWithAuth([ '/'  'devices' '/'], data);
end

function res = getDeviceList(obj,  varargin)
% getDeviceList - Get a list of devices.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1devices/get
	res = obj.httpGetWithAuth([ '/'  'devices' '/']);
end

function res = createBatchedCommandInstances(obj,  data)
% createBatchedCommandInstances - Create a set of batched command instances.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1devices~1command-instances/post
	res = obj.httpPostWithAuth([ '/'  'devices' '/' 'command-instances' '/'], data);
end

function res = getDevice(obj, deviceUuid,  varargin)
% getDevice - Get a device by uuid.
% Input: deviceUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1devices~1:deviceUuid/get
	res = obj.httpGetWithAuth([ '/'  'devices' '/' deviceUuid '/']);
end

function res = updateDevice(obj, deviceUuid,  data)
% updateDevice - Update a device by uuid.
% Input: deviceUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1devices~1:deviceUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'devices' '/' deviceUuid '/'], data);
end

function res = deleteDevice(obj, deviceUuid,  varargin)
% deleteDevice - Delete a device by uuid.
% Input: deviceUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1devices~1:deviceUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'devices' '/' deviceUuid '/']);
end

function res = clearUnexecutedDeviceCommandInstances(obj, deviceUuid,  data)
% clearUnexecutedDeviceCommandInstances - Clear all unexecuted command instance for a device.
% Input: deviceUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1devices~1:deviceUuid~1clear-unexecuted-command-instances/post
	res = obj.httpPostWithAuth([ '/'  'devices' '/' deviceUuid '/' 'clear-unexecuted-command-instances' '/'], data);
end

function res = createDeviceCommandInstance(obj, deviceUuid,  data)
% createDeviceCommandInstance - Create a command instance for a device.
% Input: deviceUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1devices~1:deviceUuid~1command-instances/post
	res = obj.httpPostWithAuth([ '/'  'devices' '/' deviceUuid '/' 'command-instances' '/'], data);
end

function res = getDeviceDataList(obj, deviceUuid,  varargin)
% getDeviceDataList - Get a list of data for a device.
% Input: deviceUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1devices~1:deviceUuid~1data/get
	res = obj.httpGetWithAuth([ '/'  'devices' '/' deviceUuid '/' 'data' '/']);
end

function res = getDeviceEventList(obj, deviceUuid,  varargin)
% getDeviceEventList - Get a list of events for a device.
% Input: deviceUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1devices~1:deviceUuid~1events/get
	res = obj.httpGetWithAuth([ '/'  'devices' '/' deviceUuid '/' 'events' '/']);
end

function res = getDeviceIsppConfiguration(obj, deviceUuid,  varargin)
% getDeviceIsppConfiguration - Get an ISPP configuration for a device.
% Input: deviceUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1devices~1:deviceUuid~1ispp-configuration/get
	res = obj.httpGetWithAuth([ '/'  'devices' '/' deviceUuid '/' 'ispp-configuration' '/']);
end

function res = updateDeviceIsppConfiguration(obj, deviceUuid,  varargin)
% updateDeviceIsppConfiguration - Update the ISPP configuration for a device.
% Input: deviceUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1devices~1:deviceUuid~1ispp-configuration/put
	res = obj.([ '/'  'devices' '/' deviceUuid '/' 'ispp-configuration' '/']);
end

function res = createDeviceNotificationInstance(obj, deviceUuid,  data)
% createDeviceNotificationInstance - Create a notification instance for a device.
% Input: deviceUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1devices~1:deviceUuid~1notification-instances/post
	res = obj.httpPostWithAuth([ '/'  'devices' '/' deviceUuid '/' 'notification-instances' '/'], data);
end

function res = getDeviceNotificationInstanceList(obj, deviceUuid,  varargin)
% getDeviceNotificationInstanceList - Get a list of notification instances for a device.
% Input: deviceUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1devices~1:deviceUuid~1notification-instances/get
	res = obj.httpGetWithAuth([ '/'  'devices' '/' deviceUuid '/' 'notification-instances' '/']);
end

function res = createSetting(obj, deviceUuid,  data)
% createSetting - Create a setting for a device.
% Input: deviceUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1devices~1:deviceUuid~1settings/post
	res = obj.httpPostWithAuth([ '/'  'devices' '/' deviceUuid '/' 'settings' '/'], data);
end

function res = getDeviceSettingList(obj, deviceUuid,  varargin)
% getDeviceSettingList - Get a list of settings for a device.
% Input: deviceUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1devices~1:deviceUuid~1settings/get
	res = obj.httpGetWithAuth([ '/'  'devices' '/' deviceUuid '/' 'settings' '/']);
end

function res = getDeviceSystemEventList(obj, deviceUuid,  varargin)
% getDeviceSystemEventList - Get a list of system events for a device.
% Input: deviceUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1devices~1:deviceUuid~1system-events/get
	res = obj.httpGetWithAuth([ '/'  'devices' '/' deviceUuid '/' 'system-events' '/']);
end

function res = getNotificationInstance(obj, notificationInstanceUuid,  varargin)
% getNotificationInstance - Get a notification instance by uuid.
% Input: notificationInstanceUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1notification-instances~1:notificationInstanceUuid/get
	res = obj.httpGetWithAuth([ '/'  'notification-instances' '/' notificationInstanceUuid '/']);
end

function res = updateNotificationInstance(obj, notificationInstanceUuid,  data)
% updateNotificationInstance - Update a notification instance.
% Input: notificationInstanceUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1notification-instances~1:notificationInstanceUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'notification-instances' '/' notificationInstanceUuid '/'], data);
end

function res = deleteNotificationInstance(obj, notificationInstanceUuid,  varargin)
% deleteNotificationInstance - Delete a notification instance by uuid.
% Input: notificationInstanceUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1notification-instances~1:notificationInstanceUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'notification-instances' '/' notificationInstanceUuid '/']);
end

function res = getSetting(obj, settingUuid,  varargin)
% getSetting - Get a setting by uuid.
% Input: settingUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1settings~1:settingUuid/get
	res = obj.httpGetWithAuth([ '/'  'settings' '/' settingUuid '/']);
end

function res = updateSetting(obj, settingUuid,  data)
% updateSetting - Update a setting.
% Input: settingUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1settings~1:settingUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'settings' '/' settingUuid '/'], data);
end

function res = deleteSetting(obj, settingUuid,  varargin)
% deleteSetting - Delete a setting by uuid.
% Input: settingUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Devices/paths/~1settings~1:settingUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'settings' '/' settingUuid '/']);
end

function res = createFirmwareRecord(obj,  data)
% createFirmwareRecord - Create a firmware record.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Firmware/paths/~1firmware/post
	res = obj.httpPostWithAuth([ '/'  'firmware' '/'], data);
end

function res = getFirmwareRecordList(obj,  varargin)
% getFirmwareRecordList - Get a list of firmware records.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Firmware/paths/~1firmware/get
	res = obj.httpGetWithAuth([ '/'  'firmware' '/']);
end

function res = getFirmwareRecord(obj, firmwareUuid,  varargin)
% getFirmwareRecord - Get a firmware record by uuid.
% Input: firmwareUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Firmware/paths/~1firmware~1:firmwareUuid/get
	res = obj.httpGetWithAuth([ '/'  'firmware' '/' firmwareUuid '/']);
end

function res = updateFirmwareRecord(obj, firmwareUuid,  data)
% updateFirmwareRecord - Update a firmware record by uuid.
% Input: firmwareUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Firmware/paths/~1firmware~1:firmwareUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'firmware' '/' firmwareUuid '/'], data);
end

function res = deleteFirmwareRecord(obj, firmwareUuid,  varargin)
% deleteFirmwareRecord - Delete a firmware record by uuid.
% Input: firmwareUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Firmware/paths/~1firmware~1:firmwareUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'firmware' '/' firmwareUuid '/']);
end

function res = createSeverityType(obj,  data)
% createSeverityType - Create a severity type.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Notification-Severity-Types/paths/~1severity-types/post
	res = obj.httpPostWithAuth([ '/'  'severity-types' '/'], data);
end

function res = getSeverityTypeList(obj,  varargin)
% getSeverityTypeList - Get a list of available severity types.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Notification-Severity-Types/paths/~1severity-types/get
	res = obj.httpGetWithAuth([ '/'  'severity-types' '/']);
end

function res = getSeverityType(obj, severityTypeUuid,  varargin)
% getSeverityType - Delete a severity type by uuid.
% Input: severityTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Notification-Severity-Types/paths/~1severity-types~1:severityTypeUuid/get
	res = obj.httpGetWithAuth([ '/'  'severity-types' '/' severityTypeUuid '/']);
end

function res = updateSeverityType(obj, severityTypeUuid,  data)
% updateSeverityType - Update a severity type by uuid.
% Input: severityTypeUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Notification-Severity-Types/paths/~1severity-types~1:severityTypeUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'severity-types' '/' severityTypeUuid '/'], data);
end

function res = deleteSeverityType(obj, severityTypeUuid,  varargin)
% deleteSeverityType - Delete a severity type by uuid.
% Input: severityTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Notification-Severity-Types/paths/~1severity-types~1:severityTypeUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'severity-types' '/' severityTypeUuid '/']);
end

function res = createNotificationType(obj,  data)
% createNotificationType - Create a notification type.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Notification-Types/paths/~1notification-types/post
	res = obj.httpPostWithAuth([ '/'  'notification-types' '/'], data);
end

function res = getNotificationTypeList(obj,  varargin)
% getNotificationTypeList - Get a list of available notification types.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Notification-Types/paths/~1notification-types/get
	res = obj.httpGetWithAuth([ '/'  'notification-types' '/']);
end

function res = getNotificationType(obj, notificationTypeUuid,  varargin)
% getNotificationType - Get a notification type by uuid.
% Input: notificationTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Notification-Types/paths/~1notification-types~1:notificationTypeUuid/get
	res = obj.httpGetWithAuth([ '/'  'notification-types' '/' notificationTypeUuid '/']);
end

function res = updateNotificationType(obj, notificationTypeUuid,  data)
% updateNotificationType - Update a notification type by uuid.
% Input: notificationTypeUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Notification-Types/paths/~1notification-types~1:notificationTypeUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'notification-types' '/' notificationTypeUuid '/'], data);
end

function res = deleteNotificationType(obj, notificationTypeUuid,  varargin)
% deleteNotificationType - Delete a notification type by uuid.
% Input: notificationTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Notification-Types/paths/~1notification-types~1:notificationTypeUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'notification-types' '/' notificationTypeUuid '/']);
end

function res = createNotificationField(obj,  data)
% createNotificationField - Create a notification field.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Notification-Fields/paths/~1notification-fields/post
	res = obj.httpPostWithAuth([ '/'  'notification-fields' '/'], data);
end

function res = getNotificationFieldList(obj,  varargin)
% getNotificationFieldList - Get a list of available notification fields.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Notification-Fields/paths/~1notification-fields/get
	res = obj.httpGetWithAuth([ '/'  'notification-fields' '/']);
end

function res = getNotificationField(obj, notificationFieldUuid,  varargin)
% getNotificationField - Get a notification field by uuid.
% Input: notificationFieldUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Notification-Fields/paths/~1notification-fields~1:notificationFieldUuid/get
	res = obj.httpGetWithAuth([ '/'  'notification-fields' '/' notificationFieldUuid '/']);
end

function res = updateNotificationField(obj, notificationFieldUuid,  data)
% updateNotificationField - Update a notification field by uuid.
% Input: notificationFieldUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Notification-Fields/paths/~1notification-fields~1:notificationFieldUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'notification-fields' '/' notificationFieldUuid '/'], data);
end

function res = deleteNotificationField(obj, notificationFieldUuid,  varargin)
% deleteNotificationField - Delete a notification field by uuid.
% Input: notificationFieldUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Notification-Fields/paths/~1notification-fields~1:notificationFieldUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'notification-fields' '/' notificationFieldUuid '/']);
end

function res = createPriorityType(obj,  data)
% createPriorityType - Create a priority type.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Command-Priority-Types/paths/~1priority-types/post
	res = obj.httpPostWithAuth([ '/'  'priority-types' '/'], data);
end

function res = getPriorityTypeList(obj,  varargin)
% getPriorityTypeList - Get a list of available priority types.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Command-Priority-Types/paths/~1priority-types/get
	res = obj.httpGetWithAuth([ '/'  'priority-types' '/']);
end

function res = getPriorityType(obj, priorityTypeUuid,  varargin)
% getPriorityType - Get a priority type by uuid.
% Input: priorityTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Command-Priority-Types/paths/~1priority-types~1:priorityTypeUuid/get
	res = obj.httpGetWithAuth([ '/'  'priority-types' '/' priorityTypeUuid '/']);
end

function res = updatePriorityType(obj, priorityTypeUuid,  data)
% updatePriorityType - Update a priority type by uuid.
% Input: priorityTypeUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Command-Priority-Types/paths/~1priority-types~1:priorityTypeUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'priority-types' '/' priorityTypeUuid '/'], data);
end

function res = deletePriorityType(obj, priorityTypeUuid,  varargin)
% deletePriorityType - Delete a priority type by uuid.
% Input: priorityTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Command-Priority-Types/paths/~1priority-types~1:priorityTypeUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'priority-types' '/' priorityTypeUuid '/']);
end

function res = createCommandType(obj,  data)
% createCommandType - Create a command type.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Command-Types/paths/~1command-types/post
	res = obj.httpPostWithAuth([ '/'  'command-types' '/'], data);
end

function res = getCommandTypeList(obj,  varargin)
% getCommandTypeList - Get a list of available command types.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Command-Types/paths/~1command-types/get
	res = obj.httpGetWithAuth([ '/'  'command-types' '/']);
end

function res = getCommandType(obj, commandTypeUuid,  varargin)
% getCommandType - Get a command type by uuid.
% Input: commandTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Command-Types/paths/~1command-types~1:commandTypeUuid/get
	res = obj.httpGetWithAuth([ '/'  'command-types' '/' commandTypeUuid '/']);
end

function res = updateCommandType(obj, commandTypeUuid,  data)
% updateCommandType - Update a command type by uuid.
% Input: commandTypeUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Command-Types/paths/~1command-types~1:commandTypeUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'command-types' '/' commandTypeUuid '/'], data);
end

function res = deleteCommandType(obj, commandTypeUuid,  varargin)
% deleteCommandType - Delete a command type by uuid.
% Input: commandTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Command-Types/paths/~1command-types~1:commandTypeUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'command-types' '/' commandTypeUuid '/']);
end

function res = createCommandField(obj,  data)
% createCommandField - Create a command field.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Command-Fields/paths/~1command-fields/post
	res = obj.httpPostWithAuth([ '/'  'command-fields' '/'], data);
end

function res = getCommandFieldList(obj,  varargin)
% getCommandFieldList - Get a list of available command fields.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Command-Fields/paths/~1command-fields/get
	res = obj.httpGetWithAuth([ '/'  'command-fields' '/']);
end

function res = getCommandField(obj, commandFieldUuid,  varargin)
% getCommandField - Get a command field by uuid.
% Input: commandFieldUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Command-Fields/paths/~1command-fields~1:commandFieldUuid/get
	res = obj.httpGetWithAuth([ '/'  'command-fields' '/' commandFieldUuid '/']);
end

function res = updateCommandField(obj, commandFieldUuid,  data)
% updateCommandField - Update a command field by uuid.
% Input: commandFieldUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Command-Fields/paths/~1command-fields~1:commandFieldUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'command-fields' '/' commandFieldUuid '/'], data);
end

function res = deleteCommandField(obj, commandFieldUuid,  varargin)
% deleteCommandField - Delete a command field by uuid.
% Input: commandFieldUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Command-Fields/paths/~1command-fields~1:commandFieldUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'command-fields' '/' commandFieldUuid '/']);
end

function res = createEventType(obj,  data)
% createEventType - Create an event type.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Event-Types/paths/~1event-types/post
	res = obj.httpPostWithAuth([ '/'  'event-types' '/'], data);
end

function res = getEventTypeList(obj,  varargin)
% getEventTypeList - Get a list of available event types.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Event-Types/paths/~1event-types/get
	res = obj.httpGetWithAuth([ '/'  'event-types' '/']);
end

function res = getEventType(obj, eventTypeUuid,  varargin)
% getEventType - Get an event type by uuid.
% Input: eventTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Event-Types/paths/~1event-types~1:eventTypeUuid/get
	res = obj.httpGetWithAuth([ '/'  'event-types' '/' eventTypeUuid '/']);
end

function res = updateEventType(obj, eventTypeUuid,  data)
% updateEventType - Update an event type by uuid.
% Input: eventTypeUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Event-Types/paths/~1event-types~1:eventTypeUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'event-types' '/' eventTypeUuid '/'], data);
end

function res = deleteEventType(obj, eventTypeUuid,  varargin)
% deleteEventType - Delete an event type by uuid.
% Input: eventTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Event-Types/paths/~1event-types~1:eventTypeUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'event-types' '/' eventTypeUuid '/']);
end

function res = createEvent(obj,  data)
% createEvent - Create an event.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Events/paths/~1events/post
	res = obj.httpPostWithAuth([ '/'  'events' '/'], data);
end

function res = getEventList(obj,  varargin)
% getEventList - Get a list of events.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Events/paths/~1events/get
	res = obj.httpGetWithAuth([ '/'  'events' '/']);
end

function res = getEvent(obj, eventUuid,  varargin)
% getEvent - Get an event by uuid.
% Input: eventUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Events/paths/~1events~1:eventUuid/get
	res = obj.httpGetWithAuth([ '/'  'events' '/' eventUuid '/']);
end

function res = updateEvent(obj, eventUuid,  data)
% updateEvent - Update an event by uuid.
% Input: eventUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Events/paths/~1events~1:eventUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'events' '/' eventUuid '/'], data);
end

function res = deleteEvent(obj, eventUuid,  varargin)
% deleteEvent - Delete an event by uuid.
% Input: eventUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Events/paths/~1events~1:eventUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'events' '/' eventUuid '/']);
end

function res = createGroupingType(obj,  data)
% createGroupingType - Create a grouping type.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Grouping-Types/paths/~1grouping-types/post
	res = obj.httpPostWithAuth([ '/'  'grouping-types' '/'], data);
end

function res = getGroupingTypeList(obj,  varargin)
% getGroupingTypeList - Get a list of available grouping types.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Grouping-Types/paths/~1grouping-types/get
	res = obj.httpGetWithAuth([ '/'  'grouping-types' '/']);
end

function res = getGroupingType(obj, groupingTypeUuid,  varargin)
% getGroupingType - Get a grouping type by uuid.
% Input: groupingTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Grouping-Types/paths/~1grouping-types~1:groupingTypeUuid/get
	res = obj.httpGetWithAuth([ '/'  'grouping-types' '/' groupingTypeUuid '/']);
end

function res = updateGroupingType(obj, groupingTypeUuid,  data)
% updateGroupingType - Update a grouping type by uuid.
% Input: groupingTypeUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Grouping-Types/paths/~1grouping-types~1:groupingTypeUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'grouping-types' '/' groupingTypeUuid '/'], data);
end

function res = deleteGroupingType(obj, groupingTypeUuid,  varargin)
% deleteGroupingType - Delete a grouping type by uuid.
% Input: groupingTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Grouping-Types/paths/~1grouping-types~1:groupingTypeUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'grouping-types' '/' groupingTypeUuid '/']);
end

function res = createTeam(obj,  data)
% createTeam - Create a team.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Teams/paths/~1teams/post
	res = obj.httpPostWithAuth([ '/'  'teams' '/'], data);
end

function res = getTeamList(obj,  varargin)
% getTeamList - Get a list of available teams.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Teams/paths/~1teams/get
	res = obj.httpGetWithAuth([ '/'  'teams' '/']);
end

function res = getTeam(obj, teamUuid,  varargin)
% getTeam - Get a team by uuid.
% Input: teamUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Teams/paths/~1teams~1:teamUuid/get
	res = obj.httpGetWithAuth([ '/'  'teams' '/' teamUuid '/']);
end

function res = updateTeam(obj, teamUuid,  data)
% updateTeam - Update a team by uuid.
% Input: teamUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Teams/paths/~1teams~1:teamUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'teams' '/' teamUuid '/'], data);
end

function res = deleteTeam(obj, teamUuid,  varargin)
% deleteTeam - Delete a team by uuid.
% Input: teamUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Teams/paths/~1teams~1:teamUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'teams' '/' teamUuid '/']);
end

function res = linkAccountManagerToTeam(obj, userUuid,  data)
% linkAccountManagerToTeam - Link account manager to a team.
% Input: userUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Teams/paths/~1teams~1users~1:userUuid/post
	res = obj.httpPostWithAuth([ '/'  'teams' '/' 'users' '/' userUuid '/'], data);
end

function res = unlinkAccountManagerFromTeam(obj, userUuid,  varargin)
% unlinkAccountManagerFromTeam - Unlink account manager from a team.
% Input: userUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Teams/paths/~1teams~1users~1:userUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'teams' '/' 'users' '/' userUuid '/']);
end

function res = resetTeam(obj, teamUuid,  data)
% resetTeam - Reset a team by uuid.
% Input: teamUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Teams/paths/~1teams~1:teamUuid~1reset/post
	res = obj.httpPostWithAuth([ '/'  'teams' '/' teamUuid '/' 'reset' '/'], data);
end

function res = getGrouping(obj, groupingUuid,  varargin)
% getGrouping - Get a grouping by uuid.
% Input: groupingUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1groupings~1:groupingUuid/get
	res = obj.httpGetWithAuth([ '/'  'groupings' '/' groupingUuid '/']);
end

function res = updateGrouping(obj, groupingUuid,  data)
% updateGrouping - Update a grouping.
% Input: groupingUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1groupings~1:groupingUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'groupings' '/' groupingUuid '/'], data);
end

function res = deleteGrouping(obj, groupingUuid,  varargin)
% deleteGrouping - Delete a grouping by uuid.
% Input: groupingUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1groupings~1:groupingUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'groupings' '/' groupingUuid '/']);
end

function res = getChildGroupingList(obj, groupingUuid,  varargin)
% getChildGroupingList - Get a list of child groupings for a grouping.
% Input: groupingUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1groupings~1:groupingUuid~1child-groupings/get
	res = obj.httpGetWithAuth([ '/'  'groupings' '/' groupingUuid '/' 'child-groupings' '/']);
end

function res = createGroupingBatchedCommands(obj, groupingUuid,  data)
% createGroupingBatchedCommands - Create a set of batched commands for a grouping and all child grouping devices.
% Input: groupingUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1groupings~1:groupingUuid~1command-instances/post
	res = obj.httpPostWithAuth([ '/'  'groupings' '/' groupingUuid '/' 'command-instances' '/'], data);
end

function res = getDeviceListForGrouping(obj, groupingUuid,  varargin)
% getDeviceListForGrouping - Get a list of devices for a grouping.
% Input: groupingUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1groupings~1:groupingUuid~1devices/get
	res = obj.httpGetWithAuth([ '/'  'groupings' '/' groupingUuid '/' 'devices' '/']);
end

function res = moveDeviceToGrouping(obj, groupingUuid,  data)
% moveDeviceToGrouping - Move a device to a grouping.
% Input: groupingUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1groupings~1:groupingUuid~1devices/post
	res = obj.httpPostWithAuth([ '/'  'groupings' '/' groupingUuid '/' 'devices' '/'], data);
end

function res = updateNetworkLocation(obj, networkLocationUuid,  data)
% updateNetworkLocation - Update a network location by uuid.
% Input: networkLocationUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1network-locations~1:networkLocationUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'network-locations' '/' networkLocationUuid '/'], data);
end

function res = createNetwork(obj,  data)
% createNetwork - Create a network.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks/post
	res = obj.httpPostWithAuth([ '/'  'networks' '/'], data);
end

function res = getNetworkList(obj,  varargin)
% getNetworkList - Get a list of networks.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks/get
	res = obj.httpGetWithAuth([ '/'  'networks' '/']);
end

function res = getNetwork(obj, networkUuid,  varargin)
% getNetwork - Get a network by uuid.
% Input: networkUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid/get
	res = obj.httpGetWithAuth([ '/'  'networks' '/' networkUuid '/']);
end

function res = updateNetwork(obj, networkUuid,  data)
% updateNetwork - Update a network by uuid.
% Input: networkUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'networks' '/' networkUuid '/'], data);
end

function res = deleteNetwork(obj, networkUuid,  varargin)
% deleteNetwork - Delete a network by uuid.
% Input: networkUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'networks' '/' networkUuid '/']);
end

function res = createNetworkBatchedCommands(obj, networkUuid,  data)
% createNetworkBatchedCommands - Create a set of batched commands for a network's devices.
% Input: networkUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1command-instances/post
	res = obj.httpPostWithAuth([ '/'  'networks' '/' networkUuid '/' 'command-instances' '/'], data);
end

function res = getNetworkDeviceList(obj, networkUuid,  varargin)
% getNetworkDeviceList - Get a network's devices.
% Input: networkUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1devices/get
	res = obj.httpGetWithAuth([ '/'  'networks' '/' networkUuid '/' 'devices' '/']);
end

function res = getNetworkGroupingList(obj, networkUuid,  varargin)
% getNetworkGroupingList - Get a network's groupings.
% Input: networkUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1groupings/get
	res = obj.httpGetWithAuth([ '/'  'networks' '/' networkUuid '/' 'groupings' '/']);
end

function res = createGrouping(obj, networkUuid,  data)
% createGrouping - Create a network grouping.
% Input: networkUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1groupings/post
	res = obj.httpPostWithAuth([ '/'  'networks' '/' networkUuid '/' 'groupings' '/'], data);
end

function res = getNetworkGrouping(obj, networkUuid, groupingUuid,  varargin)
% getNetworkGrouping - Get a network's grouping by uuid.
% Input: networkUuid, groupingUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1groupings~1:groupingUuid/get
	res = obj.httpGetWithAuth([ '/'  'networks' '/' networkUuid '/' 'groupings' '/' groupingUuid '/']);
end

function res = updateNetworkGrouping(obj, networkUuid, groupingUuid,  data)
% updateNetworkGrouping - Update a network grouping.
% Input: networkUuid, groupingUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1groupings~1:groupingUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'networks' '/' networkUuid '/' 'groupings' '/' groupingUuid '/'], data);
end

function res = deleteNetworkGrouping(obj, networkUuid, groupingUuid,  varargin)
% deleteNetworkGrouping - Delete a network's grouping by uuid.
% Input: networkUuid, groupingUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1groupings~1:groupingUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'networks' '/' networkUuid '/' 'groupings' '/' groupingUuid '/']);
end

function res = addChildGrouping(obj, networkUuid, groupingUuid,  data)
% addChildGrouping - Add a child grouping.
% Input: networkUuid, groupingUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1groupings~1:groupingUuid~1child-groupings/post
	res = obj.httpPostWithAuth([ '/'  'networks' '/' networkUuid '/' 'groupings' '/' groupingUuid '/' 'child-groupings' '/'], data);
end

function res = removeDeviceFromGrouping(obj, networkUuid, groupingUuid, deviceUuid,  varargin)
% removeDeviceFromGrouping - remove a device from a grouping
% Input: networkUuid, groupingUuid, deviceUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1groupings~1:groupingUuid~1devices~1:deviceUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'networks' '/' networkUuid '/' 'groupings' '/' groupingUuid '/' 'devices' '/' deviceUuid '/']);
end

function res = getNetworkLocationList(obj, networkUuid,  varargin)
% getNetworkLocationList - Get a network's locations.
% Input: networkUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1network-locations/get
	res = obj.httpGetWithAuth([ '/'  'networks' '/' networkUuid '/' 'network-locations' '/']);
end

function res = createNetworkLocation(obj, networkUuid,  data)
% createNetworkLocation - Create a network location.
% Input: networkUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1network-locations/post
	res = obj.httpPostWithAuth([ '/'  'networks' '/' networkUuid '/' 'network-locations' '/'], data);
end

function res = getNetworkLocation(obj, networkUuid, networkLocationUuid,  varargin)
% getNetworkLocation - Get a network location by uuid.
% Input: networkUuid, networkLocationUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1network-locations~1:networkLocationUuid/get
	res = obj.httpGetWithAuth([ '/'  'networks' '/' networkUuid '/' 'network-locations' '/' networkLocationUuid '/']);
end

function res = updateNetworkNetworkLocation(obj, networkUuid, networkLocationUuid,  data)
% updateNetworkNetworkLocation - Update a network location.
% Input: networkUuid, networkLocationUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1network-locations~1:networkLocationUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'networks' '/' networkUuid '/' 'network-locations' '/' networkLocationUuid '/'], data);
end

function res = deleteNetworkLocation(obj, networkUuid, networkLocationUuid,  varargin)
% deleteNetworkLocation - Delete a network location by uuid.
% Input: networkUuid, networkLocationUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1network-locations~1:networkLocationUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'networks' '/' networkUuid '/' 'network-locations' '/' networkLocationUuid '/']);
end

function res = getNetworkScheduleList(obj, networkUuid,  varargin)
% getNetworkScheduleList - Get a list of a network's schedules.
% Input: networkUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1schedules/get
	res = obj.httpGetWithAuth([ '/'  'networks' '/' networkUuid '/' 'schedules' '/']);
end

function res = createSchedule(obj, networkUuid,  data)
% createSchedule - Create a schedule.
% Input: networkUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1schedules/post
	res = obj.httpPostWithAuth([ '/'  'networks' '/' networkUuid '/' 'schedules' '/'], data);
end

function res = getNetworkSchedule(obj, networkUuid, scheduleUuid,  varargin)
% getNetworkSchedule - Get a schedule by uuid.
% Input: networkUuid, scheduleUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1schedules~1:scheduleUuid/get
	res = obj.httpGetWithAuth([ '/'  'networks' '/' networkUuid '/' 'schedules' '/' scheduleUuid '/']);
end

function res = updateNetworkSchedule(obj, networkUuid, scheduleUuid,  data)
% updateNetworkSchedule - Update a schedule.
% Input: networkUuid, scheduleUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1schedules~1:scheduleUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'networks' '/' networkUuid '/' 'schedules' '/' scheduleUuid '/'], data);
end

function res = deleteNetworkSchedule(obj, networkUuid, scheduleUuid,  varargin)
% deleteNetworkSchedule - Delete a schedule by uuid.
% Input: networkUuid, scheduleUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1schedules~1:scheduleUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'networks' '/' networkUuid '/' 'schedules' '/' scheduleUuid '/']);
end

function res = executeNetworkSchedule(obj, networkUuid, scheduleUuid,  data)
% executeNetworkSchedule - Execute a schedule.
% Input: networkUuid, scheduleUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1networks~1:networkUuid~1schedules~1:scheduleUuid~1execute/post
	res = obj.httpPostWithAuth([ '/'  'networks' '/' networkUuid '/' 'schedules' '/' scheduleUuid '/' 'execute' '/'], data);
end

function res = deprovisionNetwork(obj, networkUuid,  data)
% deprovisionNetwork - Deprovision a network.
% Input: networkUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1deprovision-network~1networks~1:networkUuid/post
	res = obj.httpPostWithAuth([ '/'  'deprovision-network' '/' 'networks' '/' networkUuid '/'], data);
end

function res = provisionNetwork(obj,  data)
% provisionNetwork - Provision a network.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1provision-network/post
	res = obj.httpPostWithAuth([ '/'  'provision-network' '/'], data);
end

function res = provisionDevice(obj, networkUuid, deviceUuid,  data)
% provisionDevice - Provision a device.
% Input: networkUuid, deviceUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1provision-device~1networks~1:networkUuid~1devices~1:deviceUuid/post
	res = obj.httpPostWithAuth([ '/'  'provision-device' '/' 'networks' '/' networkUuid '/' 'devices' '/' deviceUuid '/'], data);
end

function res = deprovisionDevice(obj, networkUuid, deviceUuid,  data)
% deprovisionDevice - Deprovision a device.
% Input: networkUuid, deviceUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1deprovision-device~1networks~1:networkUuid~1devices~1:deviceUuid/post
	res = obj.httpPostWithAuth([ '/'  'deprovision-device' '/' 'networks' '/' networkUuid '/' 'devices' '/' deviceUuid '/'], data);
end

function res = getSchedule(obj, scheduleUuid,  varargin)
% getSchedule - Get a schedule by uuid.
% Input: scheduleUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1schedules~1:scheduleUuid/get
	res = obj.httpGetWithAuth([ '/'  'schedules' '/' scheduleUuid '/']);
end

function res = updateSchedule(obj, scheduleUuid,  data)
% updateSchedule - Update a schedule.
% Input: scheduleUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1schedules~1:scheduleUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'schedules' '/' scheduleUuid '/'], data);
end

function res = deleteSchedule(obj, scheduleUuid,  varargin)
% deleteSchedule - Delete a schedule by uuid.
% Input: scheduleUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1schedules~1:scheduleUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'schedules' '/' scheduleUuid '/']);
end

function res = executeSchedule(obj, scheduleUuid,  data)
% executeSchedule - Execute a schedule.
% Input: scheduleUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Networks/paths/~1schedules~1:scheduleUuid~1execute/post
	res = obj.httpPostWithAuth([ '/'  'schedules' '/' scheduleUuid '/' 'execute' '/'], data);
end

function res = createGroupingDevice(obj,  data)
% createGroupingDevice - Create a GroupingDevice link.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Links/paths/~1grouping-devices/post
	res = obj.httpPostWithAuth([ '/'  'grouping-devices' '/'], data);
end

function res = getGroupingDeviceList(obj,  varargin)
% getGroupingDeviceList - Get a list of GroupingDevice links.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Links/paths/~1grouping-devices/get
	res = obj.httpGetWithAuth([ '/'  'grouping-devices' '/']);
end

function res = getGroupingDevice(obj, groupingDeviceUuid,  varargin)
% getGroupingDevice - Get a GroupingDevice link by uuid.
% Input: groupingDeviceUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Links/paths/~1grouping-devices~1:groupingDeviceUuid/get
	res = obj.httpGetWithAuth([ '/'  'grouping-devices' '/' groupingDeviceUuid '/']);
end

function res = updateGroupingDevice(obj, groupingDeviceUuid,  data)
% updateGroupingDevice - Update a GroupingDevice link by uuid.
% Input: groupingDeviceUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Links/paths/~1grouping-devices~1:groupingDeviceUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'grouping-devices' '/' groupingDeviceUuid '/'], data);
end

function res = deleteGroupingDevice(obj, groupingDeviceUuid,  varargin)
% deleteGroupingDevice - Delete a GroupingDevice link by uuid.
% Input: groupingDeviceUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Links/paths/~1grouping-devices~1:groupingDeviceUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'grouping-devices' '/' groupingDeviceUuid '/']);
end

function res = createGroupingLink(obj,  data)
% createGroupingLink - Create a GroupingLink.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Links/paths/~1grouping-links/post
	res = obj.httpPostWithAuth([ '/'  'grouping-links' '/'], data);
end

function res = getGroupingLinkList(obj,  varargin)
% getGroupingLinkList - Get a list of GroupingLinks.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Links/paths/~1grouping-links/get
	res = obj.httpGetWithAuth([ '/'  'grouping-links' '/']);
end

function res = getGroupingLink(obj, groupingLinkUuid,  varargin)
% getGroupingLink - Get a GroupingLink by uuid.
% Input: groupingLinkUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Links/paths/~1grouping-links~1:groupingLinkUuid/get
	res = obj.httpGetWithAuth([ '/'  'grouping-links' '/' groupingLinkUuid '/']);
end

function res = updateGroupingLink(obj, groupingLinkUuid,  data)
% updateGroupingLink - Update a GroupingLink by uuid.
% Input: groupingLinkUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Links/paths/~1grouping-links~1:groupingLinkUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'grouping-links' '/' groupingLinkUuid '/'], data);
end

function res = deleteGroupingLink(obj, groupingLinkUuid,  varargin)
% deleteGroupingLink - Delete a GroupingLink by uuid.
% Input: groupingLinkUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Links/paths/~1grouping-links~1:groupingLinkUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'grouping-links' '/' groupingLinkUuid '/']);
end

function res = createWebhookAction(obj,  data)
% createWebhookAction - Create a webhook action.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/Webhooks/paths/~1webhook-actions/post
	res = obj.httpPostWithAuth([ '/'  'webhook-actions' '/'], data);
end

function res = getWebhookActionList(obj,  varargin)
% getWebhookActionList - Get a list of webhook actions.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Webhooks/paths/~1webhook-actions/get
	res = obj.httpGetWithAuth([ '/'  'webhook-actions' '/']);
end

function res = getWebhookAction(obj, webhookActionUuid,  varargin)
% getWebhookAction - Get a webhook action by uuid.
% Input: webhookActionUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Webhooks/paths/~1webhook-actions~1:webhookActionUuid/get
	res = obj.httpGetWithAuth([ '/'  'webhook-actions' '/' webhookActionUuid '/']);
end

function res = updateWebhookAction(obj, webhookActionUuid,  data)
% updateWebhookAction - Update a webhook action by uuid.
% Input: webhookActionUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/Webhooks/paths/~1webhook-actions~1:webhookActionUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'webhook-actions' '/' webhookActionUuid '/'], data);
end

function res = deleteWebhookAction(obj, webhookActionUuid,  varargin)
% deleteWebhookAction - Delete a webhook action type by uuid.
% Input: webhookActionUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Webhooks/paths/~1webhook-actions~1:webhookActionUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'webhook-actions' '/' webhookActionUuid '/']);
end

function res = getWebhookActionTypeList(obj,  varargin)
% getWebhookActionTypeList - Get a list of webhook action types.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/Webhooks/paths/~1webhook-action-types/get
	res = obj.httpGetWithAuth([ '/'  'webhook-action-types' '/']);
end

function res = getWebhookActionType(obj, webhookActionTypeUuid,  varargin)
% getWebhookActionType - Get a webhook action type by uuid.
% Input: webhookActionTypeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/Webhooks/paths/~1webhook-action-types~1:webhookActionTypeUuid/get
	res = obj.httpGetWithAuth([ '/'  'webhook-action-types' '/' webhookActionTypeUuid '/']);
end

function res = createQrCode(obj,  data)
% createQrCode - Create a QR code.
% Input:  data
% Link: https://iotery.io/docs/account-manager#tag/QR-Codes/paths/~1qr-codes/post
	res = obj.httpPostWithAuth([ '/'  'qr-codes' '/'], data);
end

function res = getQrCodeList(obj,  varargin)
% getQrCodeList - Get a list of QR codes.
% Input: 
% Link: https://iotery.io/docs/account-manager#tag/QR-Codes/paths/~1qr-codes/get
	res = obj.httpGetWithAuth([ '/'  'qr-codes' '/']);
end

function res = getQrCode(obj, qrCodeUuid,  varargin)
% getQrCode - Get a QR code by uuid.
% Input: qrCodeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/QR-Codes/paths/~1qr-codes~1:qrCodeUuid/get
	res = obj.httpGetWithAuth([ '/'  'qr-codes' '/' qrCodeUuid '/']);
end

function res = updateQrCode(obj, qrCodeUuid,  data)
% updateQrCode - Update a QR code by uuid.
% Input: qrCodeUuid,  data
% Link: https://iotery.io/docs/account-manager#tag/QR-Codes/paths/~1qr-codes~1:qrCodeUuid/patch
	res = obj.httpPatchWithAuth([ '/'  'qr-codes' '/' qrCodeUuid '/'], data);
end

function res = deleteQrCode(obj, qrCodeUuid,  varargin)
% deleteQrCode - Delete a QR code by uuid.
% Input: qrCodeUuid, 
% Link: https://iotery.io/docs/account-manager#tag/QR-Codes/paths/~1qr-codes~1:qrCodeUuid/delete
	res = obj.httpDeleteWithAuth([ '/'  'qr-codes' '/' qrCodeUuid '/']);
end


        
        
        function res = httpGetWithAuth(obj, route)
           options = weboptions('HeaderFields', {'X-API-Key' obj.token});
           res = webread([obj.base_url route], options);
        end
        
        function res = httpPost(obj, route, data)
            options = weboptions('HeaderFields', {'Content-Type' 'application/json'});
            res = webwrite([obj.base_url route], data, options);
        end
        
        function res = httpPatchWithAuth(obj, route, data)
            options = weboptions('HeaderFields', {'Content-Type' 'application/json'; 'X-API-Key' obj.token}, 'RequestMethod', 'patch');
            res = webwrite([obj.base_url route], data, options);
        end
        
        function res = httpPostWithAuth(obj, route, data)
            options = weboptions('HeaderFields',{'Content-Type' 'application/json'; 'X-API-Key' obj.token});
            res = webwrite([obj.base_url route], data, options);
        end
        
        function res = httpDeleteWithAuth(obj, route)
            options = weboptions('HeaderFields',{'Content-Type' 'application/json'; 'X-API-Key' obj.token}, 'RequestMethod', 'delete');
            res = webwrite([obj.base_url route], options);
        end
        
    end
end