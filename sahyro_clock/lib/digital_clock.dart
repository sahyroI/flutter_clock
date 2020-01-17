// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:animated_background/particles.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import 'glow_sec.dart';
import 'sec_background.dart';

Color paintSky(Canvas canvas, Rect rect) {
  var gradient = RadialGradient(
    center: const Alignment(0.7, -0.6), // near the top right
    radius: 0.2,
    colors: [
      const Color(0xFFFFFF00), // yellow sun
      const Color(0xFF0099FF), // blue sky
    ],
    stops: [0.4, 1.0],
  );
  // rect is the area we are painting over
  var paint = Paint()..shader = gradient.createShader(rect);
  canvas.drawRect(rect, paint);
}

enum _Element {
  background1,
  background2,
  text,
  shadow,
  tick,
  flare,
}

final _lightTheme = {
  _Element.background1: Color.fromRGBO(246, 251, 255, 1),
  _Element.background2: Color.fromRGBO(206, 236, 242, 1),
  _Element.text: Colors.blueGrey,
  _Element.shadow: Colors.blueGrey[100],
  _Element.tick: Colors.redAccent[700],
  _Element.flare: true,
  // 'assets/flares/pulsing_bg.flr',
};

final _darkTheme = {
  _Element.background1: Color.fromRGBO(47, 42, 79, 1),
  _Element.background2: Color.fromRGBO(21, 18, 41, 1),
  _Element.text: Colors.white,
  _Element.shadow: Color(0xFF174EA6),
  _Element.tick: Colors.amberAccent,
  _Element.flare: false,
  // 'assets/flares/pulsing_white.flr',
};

final radiansPerTick = radians(360 / 60);

class DigitalClock extends StatefulWidget {
  const DigitalClock(this.model);

  final ClockModel model;

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;
  var horosImage = AssetImage('assets/horos/HoroscopeSun.png');
  var _flareTheme;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
    _appLogo();
    _flareThemeIn();
  }

  @override
  void didUpdateWidget(DigitalClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  void _flareThemeIn(){
    var eval = _Element.flare;
    if(_Element.flare == true){
      _flareTheme = "assets/flares/pulsing_bg.flr";
    }
    else{
      _flareTheme = "assets/flares/pulsing_white.flr";
    }

  }

  void _appLogo() {

    if(_dateTime.month == 1){ //Janaury
      if (_dateTime.day >= 1 && _dateTime.day <= 20) {
        horosImage = AssetImage('assets/horos/Capricorn.png');
      }
      else if (_dateTime.day >= 21 && _dateTime.day <= 31) {
        horosImage = AssetImage('assets/horos/Aquarius.png');
      }
    }
    else if(_dateTime.month == 2){ //February
      if (_dateTime.day >= 1 && _dateTime.day <= 19) {
        horosImage = AssetImage('assets/horos/Aquarius.png');
      }
      else if (_dateTime.day >= 20 && _dateTime.day <= 29) {
        horosImage = AssetImage('assets/horos/Pisces.png');
      }
    }
    else if (_dateTime.month == 3) { //March
      if (_dateTime.day >= 1 && _dateTime.day <= 20) {
        horosImage = AssetImage('assets/horos/Pisces.png');
      }
      else if (_dateTime.day >= 21 && _dateTime.day <= 31) {
        horosImage = AssetImage('assets/horos/Aries.png');
      }
    }
    else if(_dateTime.month == 4){ //April
      if (_dateTime.day >= 1 && _dateTime.day <= 20) {
        horosImage = AssetImage('assets/horos/Aries.png');
      }
      else if (_dateTime.day > 20 && _dateTime.day < 31) {
        horosImage = AssetImage('assets/horos/Taurus.png');
      }
    }
    else if(_dateTime.month == 5){ //May
      if (_dateTime.day >= 1 && _dateTime.day <= 21) {
        horosImage = AssetImage('assets/horos/Taurus.png');
      }
      else if (_dateTime.day >= 22 && _dateTime.day <= 31) {
        horosImage = AssetImage('assets/horos/Gemini.png');
      }
    }
    else if(_dateTime.month == 6){ //June
      if (_dateTime.day >= 1 && _dateTime.day <= 21) {
        horosImage = AssetImage('assets/horos/Gemini.png');
      }
      else if (_dateTime.day >= 22 && _dateTime.day <= 30) {
        horosImage = AssetImage('assets/horos/Cancer.PNG');
      }
    }
    else if(_dateTime.month == 7){ //July
      if (_dateTime.day >= 1 && _dateTime.day <= 22) {
        horosImage = AssetImage('assets/horos/Cancer.png');
      }
      else if (_dateTime.day >= 23 && _dateTime.day <= 31) {
        horosImage = AssetImage('assets/horos/Leo.png');
      }
    }
    else if(_dateTime.month == 8){ //August
      if (_dateTime.day >= 1 && _dateTime.day <= 22) {
        horosImage = AssetImage('assets/horos/Leo.png');
      }
      else if (_dateTime.day >= 23 && _dateTime.day <= 31) {
        horosImage = AssetImage('assets/horos/Virgo.png');
      }
    }
    else if(_dateTime.month == 9){ //September
      if (_dateTime.day >= 1 && _dateTime.day <= 23) {
        horosImage = AssetImage('assets/horos/Virgo.png');
      }
      else if (_dateTime.day >= 24 && _dateTime.day <= 30) {
        horosImage = AssetImage('assets/horos/Libra.png');
      }
    }
    else if(_dateTime.month == 10){ //October
      if (_dateTime.day >= 1 && _dateTime.day <= 23) {
        horosImage = AssetImage('assets/horos/Libra.png');
      }
      else if (_dateTime.day >= 24 && _dateTime.day <= 31) {
        horosImage = AssetImage('assets/horos/Scorpio.png');
      }
    }
    else if(_dateTime.month == 11){ //November
      if (_dateTime.day >= 1 && _dateTime.day <= 22) {
        horosImage = AssetImage('assets/horos/Scorpio.png');
      }
      else if (_dateTime.day >= 23 && _dateTime.day <= 30) {
        horosImage = AssetImage('assets/horos/Sagittarius.png');
      }
    }
    else if(_dateTime.month == 12){ //December
      if (_dateTime.day >= 1 && _dateTime.day <= 21) {
        horosImage = AssetImage('assets/horos/Sagittarius.png');
      }
      else if (_dateTime.day >= 22 && _dateTime.day <= 31) {
        horosImage = AssetImage('assets/horos/Capricorn.png');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final colors = Theme.of(context).brightness == Brightness.light
        ? _lightTheme
        : _darkTheme;
    final hour =
        DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final minute = DateFormat('mm').format(_dateTime);
    final seconds = DateFormat('ss').format(_dateTime);
    final fontSize = MediaQuery.of(context).size.width / 6;
    final offset = -fontSize / 7;
    final defaultStyle = TextStyle(
      color: colors[_Element.text],
      fontFamily: 'Digital',
      fontSize: fontSize,
      shadows: [
        Shadow(
          blurRadius: 0,
          color: colors[_Element.shadow],
          offset: Offset(5, 0),
        ),
      ],
    );

    return Container(
      decoration: new BoxDecoration(
        // color: Colors.purple,
        gradient: new RadialGradient(
            colors: [
              colors[_Element.background1],
              colors[_Element.background2],
            ],
            radius: 1,
            tileMode: TileMode.clamp,
            stops: [0.5, 1]),
      ),
      child: Center(
        child: DefaultTextStyle(
          style: defaultStyle,
          child: Stack(
            children: <Widget>[
              SecondBackground(colors[_Element.text]),
              GlowSeconds(
                color: colors[_Element.tick],
                thickness: 6,
                size: 1,
                angleRadians: _dateTime.second * radiansPerTick,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(hour),
                        Text(':'),
                        Text(minute),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${DateFormat("dd MMM yyyy").format(_dateTime)}",
                      style: TextStyle(
                        color: colors[_Element.tick],
                        fontSize: MediaQuery.of(context).size.width / 20,
                        shadows: [
                          Shadow(
                            blurRadius: 0,
                            color: Colors.transparent,
                            offset: Offset(5, 0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                left: 15,
                top: 15,
                child: Text(
                  "${DateFormat("EEEE").format(_dateTime)}",
                  style: TextStyle(
                    color: colors[_Element.tick],
                    fontSize: MediaQuery.of(context).size.width / 20,
                    shadows: [
                      Shadow(
                        blurRadius: 0,
                        color: Colors.transparent,
                        offset: Offset(5, 0),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                right: 1,
                child: Container(
                  width: 250,
                  height: 250,
                  child: new Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      new FlareActor(
                        _flareTheme,
                          alignment: Alignment.center,
                          fit: BoxFit.fitHeight,
                          animation: "stand_by"),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Image(
                          image: horosImage,
                          width: 110,

                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );
}
