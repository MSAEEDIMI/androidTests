import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wether_/componentes/detalsWeget.dart';
import 'package:wether_/componentes/errore_masage.dart';
import 'package:wether_/componentes/loadingWeget.dart';
import 'package:wether_/models/wetherModel.dart';
import 'package:wether_/serveses/location.dart';
import 'package:wether_/serveses/networkHelper.dart';
import 'package:wether_/serveses/wether.dart';

import 'package:wether_/utilites/constants.dart';
import 'package:wether_/utilites/wetherIcons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  GeolocatorPlatform geolocatorPlatform=GeolocatorPlatform.instance;
  Wether wether=Wether();
  var wetherData;
  LocationPermission? permission;
  double? latetude,longtetude;
  bool dataIsLoaded=false;
  bool isErroeOcerd=false;
  WetherModel? wetherModel;
  int icon_code=0;
  Color iconColor=textColor;
  String? titel,mesage;




  void getPermision() async{
    permission=await geolocatorPlatform.checkPermission();
    if(permission==LocationPermission.denied){
      print('permission dinid');
      permission= await geolocatorPlatform.requestPermission();
      if(permission!=LocationPermission.denied){
        if(permission==LocationPermission.deniedForever){
          print("permission perminently dinide pleas proveide perimssion to the app from sitteing");
          setState(() {
            dataIsLoaded=true;
            isErroeOcerd=true;
            titel='Permision permenently dinide';
            mesage='please provide permisino to the app from divise siting';
          });
        }else{
          print('permiaion granted');
          updateUi();
        }

      }else{
        print("User dinde the requst");
        updateUi(cityName: 'tehran');
      }
    }else {
      updateUi();
    }
  }

  void getColor(){
    if (getIconPrefix(icon_code)=='wi-day-'){
      iconColor=partsColor3;
    }
  }

  void updateUi({String? cityName}) async {
    wetherData=null;
    if(cityName==null || cityName==''){
      if(!await geolocatorPlatform.isLocationServiceEnabled()){
        setState(() {
          isErroeOcerd=true;
          dataIsLoaded=true;
          titel='Location is turned off';
          mesage='Please enable the location server to see wether conditon for your location ';
          return;
        });
      }
      wetherData=await wether.getLocation();
    }else{
      wetherData=await wether.getWetherCityName(cityName);
    };
    if (wetherData==null){
      setState(() {
        titel='City name not found';
        mesage='Please ensure you have entered the righ city name';
        dataIsLoaded=true;
        isErroeOcerd=true;
        return;
      });
    }

    icon_code=wetherData['weather'][0]['id'];
    getColor();
    wetherModel=WetherModel(
      description: wetherData['weather'][0]['description'],
      location: wetherData['name']+' , '+wetherData['sys']['country'],
      temp: wetherData['main']['temp'],
      feelslike: wetherData['main']['feels_like'],
      humidity: wetherData['main']['humidity'],
      wind: wetherData['wind']['speed'],
      icon: 'images/wetherIcon/${getIconPrefix(icon_code)}${wetherIcon[icon_code.toString()]!['icon']}.svg'
    );
    setState(() {
      dataIsLoaded=true;
      isErroeOcerd=false;
    });

  }



  @override
  void initState() {
    super.initState();
    getPermision();
  }

  @override
  Widget build(BuildContext context) {

    if(dataIsLoaded==false){
      return Loadingweget();
    }else{
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: textFeldDecoration,
                          onSubmitted: (String value) {
                            setState(() {
                              dataIsLoaded=false;
                              updateUi(cityName: value);
                            });
                          },
                        ),
                      ),
                    ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            dataIsLoaded=false;
                            getPermision();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Color(0x3b331af5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        child: Container(
                          height: 57,
                          child: Row(children: [Icon(Icons.gps_fixed_outlined,color:textColor,),SizedBox(width: 10,),Text('My Location',style: TextStyle(color: textColor,fontWeight: FontWeight.bold),)],),),
                      ),
                    ),
                  ),
                ],
                ),
                isErroeOcerd? errore_Masage(title: titel!, massage: mesage!):
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.location_city_outlined,color: textColor,),SizedBox(width: 5,),Text(wetherModel!.location!,style: cityNameTextStyle,)],),
                      SizedBox(height: 20,),
                      SvgPicture.asset(
                          wetherModel!.icon!,
                          height: 300,
                          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn)

                      ),
                      SizedBox(height:20,),
                      Text('${wetherModel!.temp!}°',style: degerrTextStyle,),
                      Text('${wetherModel!.description!.toUpperCase()}',style: degerrDiscrptionTextStyle,),
                      SizedBox(height:20,),
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        color: partsColor2,
                        child: Container(height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            card_Style(temp: "${wetherModel!.feelslike!}°",discription: 'FEELS_LIKE',),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: VerticalDivider(thickness: 1,),
                            ),
                            card_Style(temp: "${wetherModel!.humidity!}%",discription: 'HUMIDITY',),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: VerticalDivider(thickness: 1,),
                            ),
                            card_Style(temp: "${wetherModel!.wind!}",discription: 'WIND',),
                          ],),),
                      )
                              
                    ],
                  ),
                )
              ],
            ),
        ),
      );
    }
  }
}


