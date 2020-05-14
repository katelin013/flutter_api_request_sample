import 'package:dio/dio.dart';

class HttpUtils {
    static const BASE_URL = "https://opendata.cwb.gov.tw/api/v1/rest/datastore";
    static const CONNECT_TIMEOUT = 5000;
    static const RECEIVE_TIMEOUT = 3000;
    static Dio dio;

    /// 生成 Dio Instance
    static Dio getInstance() {
        if (dio == null) {
            // 透過傳一個 BaseOptions 來建立 Dio
            var options =
            BaseOptions(
                baseUrl: BASE_URL,
                connectTimeout: CONNECT_TIMEOUT,
                receiveTimeout: RECEIVE_TIMEOUT);
            dio = new Dio(options);
        }
        return dio;
    }

    /// 請求api
    static Future<Map> request(String url, {data, method}) async {
        data = data ?? {};
        method = method ?? "get";
        data.forEach((key, value) {
            if (url.indexOf(key) != -1) {
                url = url.replaceAll(':$key', value.toString());
            }
        });
        // 印出 request 的訊息 : url, method, params :
        print("Url : $url");
        print("type : $method");
        print("params : $data");

        var dio = getInstance();
        var res;
        if (method == "get") {
            // get
            var response = await dio.get(url);
            res = response.data;
        } else {
            // post
            var response = await dio.post(url, data: data);
            res = response.data;
        }
        return res;
    }

    /// get
    static Future<Map> get(url, data) => request(url, data: data);

    /// post
    static Future<Map> post(url, data) =>
        request(url, data: data, method: "post");
}