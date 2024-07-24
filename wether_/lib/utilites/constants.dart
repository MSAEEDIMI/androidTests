import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


const apiKey='b90e46575d34891236069ad7bb0d1c91';
const adressOfWetherMap='https://api.openweathermap.org/data/2.5/weather';


const partsColor1=Color(0x3b331af5);
const partsColor2=Color(0x3a331af5);
const partsColor3=Colors.yellowAccent;
const textColor=Color(0xff231946);




const kTextStayle=TextStyle(
  color: textColor,
  fontWeight: FontWeight.bold
);

var degerrTextStyle=GoogleFonts.oswald(
  color: textColor,
  fontSize: 100,
  fontWeight: FontWeight.bold
);

var degerrDiscrptionTextStyle=GoogleFonts.oswald(
    color: textColor,
    fontSize: 20,
    fontWeight: FontWeight.bold
);

var cityNameTextStyle=GoogleFonts.oswald(
    color: textColor,
    fontSize: 18,
    fontWeight: FontWeight.bold
);

var tempDetaleTextStyle=GoogleFonts.oswald(
    color: textColor,
    fontSize: 25,
    fontWeight: FontWeight.bold
);

var tempDetaleTiteleTextStyle=GoogleFonts.oswald(
  color: textColor,
  fontSize: 18,
);




const textFeldDecoration=InputDecoration(
  fillColor: Color(0x3b331af5),
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10),),
      borderSide: BorderSide.none
        ),
    hintText: 'Enter city name',
    hintStyle:kTextStayle ,
    prefixIcon: Icon(Icons.search_rounded,color: textColor,),
);