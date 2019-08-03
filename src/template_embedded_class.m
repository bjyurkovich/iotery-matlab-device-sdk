classdef IoteryDevice < handle
%     IoteryDevice is a wrapper for the Iotery.io Embedded SDK REST API.  
%     For more information on the funtions,  see:
%     https://iotery.io/v1/docs/embedded
%       Available methods:
%###DOCS###
    
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
        
        %###METHODS###
        
        
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