import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constants/images.dart';
import 'package:weather_app/widget/Loading.dart';
import '../../controller/HomeController.dart';
import '../../widget/myList.dart';
import '../../widget/my_chart.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<HomeController>(builder: (controller) {
        if (controller.currentWeatherData.name == null) {
          return Loading();
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 450,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter:
                          ColorFilter.mode(Colors.black38, BlendMode.darken),
                      image: AssetImage(
                        'assets/images/3.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: AppBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            leading: IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 50, left: 20, right: 20),
                          child: Container(
                            child: TextField(
                              onChanged: (value) => controller.city = value,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textInputAction: TextInputAction.search,
                              onSubmitted: (value) =>
                                  controller.updateWeather(),
                              decoration: InputDecoration(
                                suffix: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                hintStyle: TextStyle(color: Colors.white),
                                hintText: 'Search'.toUpperCase(),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 230,
                          width: 500,
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                width: double.infinity,
                                height: double.infinity,
                                child: Card(
                                  color: Color.fromARGB(34, 255, 255, 255),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      //TODO
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 15, left: 20, right: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Center(
                                              child: Text(
                                                '${controller.currentWeatherData.name}'
                                                    .toUpperCase(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          'flutterfonts',
                                                    ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                DateFormat()
                                                    .add_MMMMEEEEd()
                                                    .format(DateTime.now()),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'flutterfonts',
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      //TODO
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  '${controller.currentWeatherData.weather![0].description}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 22,
                                                        fontFamily:
                                                            'flutterfonts',
                                                      ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline2!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'flutterfonts'),
                                                ),
                                                Text(
                                                  'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'flutterfonts',
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Container(
                                            padding: EdgeInsets.only(
                                                right: 20, top: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 80,
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Color.fromARGB(
                                                        0, 255, 255, 255),
                                                  ),
                                                  child: LottieBuilder.asset(
                                                      Images.cloudyAnim),
                                                ),
                                                SizedBox(height: 5),
                                                Container(
                                                  child: Text(
                                                    'wind ${controller.currentWeatherData.wind!.speed} m/s',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'flutterfonts',
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              'forcast next 5 days'
                                                  .toUpperCase(),
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                    fontSize: 16,
                                                    fontFamily: 'flutterfonts',
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      MyChart(),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              'other city'.toUpperCase(),
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                    fontSize: 16,
                                                    fontFamily: 'flutterfonts',
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      MyList(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
