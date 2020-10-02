
import 'package:http/http.dart';
import 'dart:convert';

class callapi{
   calldata(String city) async {
    Response response = await get('https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=${city}',
        headers: {
          'authorization': 'apikey 4p4yISZJjYbH5Rk5SWNuG4:5xKLyCCNQBInu9IqBYnocN',
          'content-type': 'application/json'
        });

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData;

    }


  }
}