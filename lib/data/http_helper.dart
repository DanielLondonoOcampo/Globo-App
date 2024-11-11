import "package:globo_fitness/data/weather.dart";
import "package:http/http.dart" as http;
import "dart:convert";

class HttpHelper {
  // https://api.openweathermap.org/data/2.5/weather?q=London&appid=eda54c77c8eaf253a04fde571a6a3b15

  final String domain = "api.openweathermap.org";
  final String path = "data/2.5/weather";
  final String apiKey = "eda54c77c8eaf253a04fde571a6a3b15";

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {"q": location, "appId": apiKey};
    Uri uri = Uri.https(domain, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);

    return weather;
  }
}
