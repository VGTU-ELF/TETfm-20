curl 'https://wrprod01-prod-useast1.mathworks.com/messageservice/json/secure?routingkey=10.97.32.165:8024' \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'Content-Type: application/json' \
  -H 'Accept: */*' \
  -H 'Origin: https://wrprod01-prod-useast1.mathworks.com' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Dest: empty' \
  --data-binary '
  {
    "uuid":"05367410",
    "messages":
    {
      "ListVersion":
      [
        {
          "path":"/MATLAB Drive/Published/RESTfull.m",
          "uuid":"C8A155BD"
        }
      ]
    },
    "computeToken":
      {
        "computeSessionId":"cc42751e-96f9-4363-a51b-611dbae7e617",
        "serviceUrl":"unset",
        "computeResourceAddress":"10.97.32.165:8024"
      }
  }' \
  --compressed
