# Flutter Weather Api Demo

用 Dio 來 demo flutter 的 api request

## Plugin
透過 Dio 取得的 Request 可以是 Json 格式, 透過 Plugin : FlutterJsonBeanFactory 可以將 Json 轉換為 Bean

Step 1: 安裝 Plugin
![image](https://github.com/katelin013/flutter_api_request_sample/blob/master/1.png)

Step 2: 專案裡新增
![image](https://github.com/katelin013/flutter_api_request_sample/blob/master/2.png)

Step 3: 用 Postman 等工具將 Response 貼上
![image](https://github.com/katelin013/flutter_api_request_sample/blob/master/3.png)

Step 4: 就會產生出相對應的檔案  
![image](https://github.com/katelin013/flutter_api_request_sample/blob/master/4.png)

Step 5: 使用
此範例使用的方法為 :
var weatherResult = WeatherResultEntity().fromJson(res);


## 用到的 dependencies
ApiRequest : https://s0pub0dev.icopy.site/packages/dio
