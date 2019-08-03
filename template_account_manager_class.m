classdef IoteryAccountManager < handle
%     IoteryAccountManager is a wrapper for the Iotery.io Account Manager SDK REST API.  
%     For more information on the funtions,  see:
%     https://iotery.io/v1/docs/account-manager
%###DOCS###
    
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
        
        
        %###METHODS###
        
        
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