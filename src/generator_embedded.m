api = webread(['https://raw.githubusercontent.com/bjyurkovich/iotery-embedded-python-sdk/master/spec/api.json']);

% function res = updateDevice(obj, deviceUuid, data)
%      res = obj.httpPatchWithAuth(['/devices/' deviceUuid], data);
% end        

api = jsondecode(api);
routes = api.routes;

template = fileread('template_embedded_class.m');

functions = '';
docMethods = {};

for i=1:length(routes)
    path = routes(i).path;
    pathParts = split(path, '/');
        
    params = {};
    nonParams = {};
    hydratedUrlArray = {'[ ''/'' '};
    for p=1:length(pathParts)
       if ~isempty(strfind(pathParts{p}, ':'))
           varName = split(pathParts{p}, ':');
           params{end+1} = varName{end};
           hydratedUrlArray{end+1} = ' ';
           hydratedUrlArray{end+1} = varName{end};
           hydratedUrlArray{end+1} = ' ''/''';
           
       else
          if strcmp(pathParts{p}, '')
              continue
          end
          nonParams{end+1} = pathParts{p};
%           hydratedUrlArray = {hydratedUrlArray, {" '"}, {pathParts{p}}, {" '/'"}};
          hydratedUrlArray{end+1} = ' ''';
          hydratedUrlArray{end+1} = strtrim(pathParts{p});
          hydratedUrlArray{end+1} = ''' ''/''';
          
%           hydratedUrlArray = cat(1, hydratedUrlArray{:});
       end
    end
    hydratedUrlArray{end+1} = ']';
    hydratedUrlArray = strjoin(hydratedUrlArray, '');
    
    paramList = '';
    for pl=1:length(params)
       paramList = [paramList params{pl} ', '];
    end
        
    
    if strcmp(routes(i).method, 'POST') || strcmp(routes(i).method, 'PATCH')
        fcnLine = 'function res = %s(obj, %s data)\n';
    else
        fcnLine = 'function res = %s(obj, %s varargin)\n';
    end
    
    docLine1 = '%% %s - %s\n';
    
     if strcmp(routes(i).method, 'POST') || strcmp(routes(i).method, 'PATCH')
       docLine2 = '%% Input: %s data\n';
     else
       docLine2 = '%% Input: %s\n';
    end
    
    docLine3 = '%% Link: %s\n';
    
    if strcmp(routes(i).method, 'POST') || strcmp(routes(i).method, 'PATCH')
        body =    '\tres = obj.%s(%s, data);\n';
    else
        body =    '\tres = obj.%s(%s);\n';
    end
    
    endLine = sprintf('end\n\n');
    
    httpFcn = '';
    switch routes(i).method
        case 'GET'
            httpFcn = 'httpGetWithAuth';
            
        case 'POST'
            httpFcn = 'httpPostWithAuth';
            
        case 'PATCH'
            httpFcn = 'httpPatchWithAuth';
           
        case 'DELETE'
            httpFcn = 'httpDeleteWithAuth';
           
    end
    
   
    fncLineHydrated = sprintf(fcnLine, routes(i).name, paramList);
    
    docMethods{end+1} = sprintf(['%%\t\t' fcnLine], routes(i).name, paramList);
    docMethods{end} = strrep(docMethods{end}, 'obj, ', '');
    docMethods{end} = strrep(docMethods{end}, 'function res = ', '');
    docMethods{end} = strrep(docMethods{end}, 'varargin', '');
    
   
    bodyHydrated = sprintf(body, httpFcn, string(hydratedUrlArray));
    
     
    docLine1Hydrated = sprintf(docLine1, routes(i).name, routes(i).description);
    docLine2Hydrated = sprintf(docLine2, paramList);
    docLine3Hydrated = sprintf(docLine3, routes(i).link);

%     disp(fncLineHydrated)
%     disp(docLine1Hydrated)
%     disp(docLine2Hydrated)
%     disp(docLine3Hydrated)
%     disp(bodyHydrated)
%     disp(endLine)
%     
    functions = [functions  fncLineHydrated];
    functions = [functions docLine1Hydrated];
    functions = [functions  docLine2Hydrated];
    functions = [functions  docLine3Hydrated];
    functions = [functions  bodyHydrated];
    functions = [functions  endLine];
    
    out = strrep(template, '%###METHODS###', functions);
    out = strrep(out, '%###DOCS###', strjoin(docMethods, ''));
%     disp(out)
    f = fopen('IoteryDevice.m', 'w');
    fwrite(f, out);
    fclose(f);
    
    
end

