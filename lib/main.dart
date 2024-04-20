import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather Forecast',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter a city name',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0), // Spacer between the white rectangle and additional text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pushkin 154, Taraz',
                    style: TextStyle(color: Colors.black54, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0), // Spacer between the two text widgets
                  Text(
                    'Friday, April 19, 2024',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                  ),
                  SizedBox(height: 16.0), // Spacer between the text and the sun icon and number
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Colors.yellow,
                        size: 100,
                      ),
                      SizedBox(width: 15),
                      Text(
                        '14°F',
                        style: TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.normal,),
                      ),
                    ],
                  ),
                  SizedBox(height: 8), // Spacer between the sun icon and number and the weather description
                  Text(
                    'LIGHT SNOW',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.0), // Spacer between the weather description and the additional info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildInfoColumn(Icons.ac_unit, Colors.lightBlue, '5', 'km/hr'),
                      SizedBox(width: 20),
                      buildInfoColumn(Icons.ac_unit, Colors.lightBlue, '3', '%'),
                      SizedBox(width: 20),
                      buildInfoColumn(Icons.ac_unit, Colors.lightBlue, '20', '%'),
                    ],
                  ),
                  SizedBox(height: 24.0), // Spacer between the additional info and the forecast text
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      '7 DAY WEATHER FORECAST',
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 150.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildWeatherCard('SATURDAY', '8°F', Icons.wb_sunny, Colors.yellow, Colors.blue),
                        buildWeatherCard('SUNDAY', '10°F', Icons.cloud, Colors.black, Colors.white), // Changed icon to cloud
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }

  Widget buildInfoColumn(IconData icon, Color iconColor, String value, String unit) {
    return Column(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 40,
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 2),
        Text(
          unit,
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
      ],
    );
  }

  Widget buildWeatherCard(String day, String temperature, IconData iconData, Color iconColor, Color textColor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day,
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconData,
                    color: iconColor,
                    size: 20,
                  ),
                  SizedBox(width: 50),
                  Text(
                    temperature,
                    style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
