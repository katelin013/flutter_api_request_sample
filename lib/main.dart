import 'package:flutter/material.dart';
import 'package:flutterweathersample/utils/config.dart';
import 'package:flutterweathersample/utils/http_utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //透過 Provider.of 來獲取資料
    final data = Provider.of<TextChangeNotifier>(context);
    return new Scaffold(
        appBar: AppBar(
          title: Text('GetWeatherData'),
        ),
        body: Column(
          children: <Widget>[
            Text(
                data.text
            ),
            new RaisedButton(
              child: Text('Get Weather data'),
              onPressed: () async {
                var map = Map();
                map["path"] = "F-C0032-001";
                map["token"] = weatherToken;
                var res = await HttpUtils.get("/:path?Authorization=:token", map);
                Provider.of<TextChangeNotifier>(context, listen: false)
                    .setData(res.toString());
              },
            )
          ],
        )
    );
  }
}

// get weather data
void getWeather(BuildContext context) async {
  var map = Map();
  map["path"] = "F-C0032-001";
  map["token"] = weatherToken;
  var res = await HttpUtils.get("/:path?Authorization=:token", map);
  Provider.of<TextChangeNotifier>(context, listen: false)
      .setData(res.toString());
//    var weatherResult = WeatherResultEntity().fromJson(res);  // 將 json 轉成一個 bean
}

class TextChangeNotifier with ChangeNotifier {
  String _text = "";
  String get text => _text;
  setData(String data){
    _text = data;
    print("setdata : $_text");
    notifyListeners();
  }
}