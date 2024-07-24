import 'package:wether_/serveses/location.dart';
import 'package:wether_/serveses/networkHelper.dart';
import 'package:wether_/utilites/constants.dart';

class Wether{

  Future<dynamic> getLocation()async{
    Location location=Location();
    await location.getCurrentPosition();
    Networkhelper networkhelper= Networkhelper(url: '$adressOfWetherMap?units=metric&lat=${location.latitude}&lon=${location.langitude}&appid=$apiKey');
    var wetherData=await networkhelper.getData();
    return wetherData;
  }

  Future<dynamic> getWetherCityName(String cityName)async{
    Networkhelper networkhelper=Networkhelper(url: "$adressOfWetherMap?q=$cityName&units=metric&appid=$apiKey");
    var wethrData=await networkhelper.getData();
    return wethrData;
  }
}