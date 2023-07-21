import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/helper/images.dart';
import 'package:weather_app/layout/home_screen/chart.dart';
import 'package:weather_app/layout/home_screen/listview_show_5days.dart';
import 'package:weather_app/layout/home_screen/weather_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<WeatherController>(
          init: Get.find<WeatherController>(),
          builder: (controller) {
            return ConditionalBuilder(
                condition: controller.dataListWeatherNow.isNotEmpty
                    &&controller.weatherNowResponse!=null
                    &&controller.fiveDaysData.isNotEmpty,
                builder: (ctx)=>SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //top part of screen
                        Container(
                          height: MediaQuery
                              .sizeOf(context)
                              .height * 0.5,
                          child: Stack(
                            children: [
                              Container(
                                height: MediaQuery
                                    .sizeOf(context)
                                    .height * 0.35,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                        Colors.black38, BlendMode.darken),
                                    image: AssetImage(
                                      'assets/images/cloud-in-blue-sky.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                EdgeInsets.only(top: 20, left: 20, right: 20),
                                child: TextField(
                                  onChanged: (value) {
                                    controller.city = value;
                                    //controller.updateWeather();
                                  },
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textInputAction: TextInputAction.search,
                                  onSubmitted: (value) => controller.updateWeather(),
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
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  // width: double.infinity,
                                  height: MediaQuery.sizeOf(context).height * 0.32,
                                  child: Card(
                                   // color: Colors.white,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        //city and date
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 8, left: 20, right: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Text(
                                                  '${controller.weatherNowResponse!
                                                      .name}'
                                                      .toUpperCase(),
                                                  style: Theme
                                                      .of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'flutterfonts',
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  DateFormat()
                                                      .add_MMMMEEEEd()
                                                      .format(DateTime.now()),
                                                  style: Theme
                                                      .of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: 'flutterfonts',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        //line
                                        Divider(),
                                        //rest of card
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            //first part of row
                                            Container(
                                              padding: EdgeInsets.only(left: 50),
                                              child: Column(
                                                children: [
                                                  //weather description
                                                  Text(
                                                    '${controller.weatherNowResponse!
                                                        .weather![0].description}',
                                                    style: Theme
                                                        .of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 22,
                                                      fontFamily: 'flutterfonts',
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  //temperature
                                                  Text(
                                                    '${(controller.weatherNowResponse!
                                                        .main!.temp! - 273.15)
                                                        .round()
                                                        .toString()}\u2103',
                                                    style: Theme
                                                        .of(context)
                                                        .textTheme
                                                        .headline2!
                                                        .copyWith(
                                                        color: Colors.white,
                                                        fontFamily:
                                                        'flutterfonts'),
                                                  ),
                                                  //temperature min / max
                                                  Text(
                                                    'min: ${(controller
                                                        .weatherNowResponse!.main!
                                                        .temp_min! - 273.15)
                                                        .round()
                                                        .toString()}\u2103 / max: ${(controller
                                                        .weatherNowResponse!.main!
                                                        .temp_max! - 273.15)
                                                        .round()
                                                        .toString()}\u2103',
                                                    style: Theme
                                                        .of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: 'flutterfonts',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            //second part of row animation picture
                                            Container(
                                              padding: EdgeInsets.only(right: 20),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children:
                                                [
                                                  FittedBox(
                                                    child: SizedBox(
                                                      child: LottieBuilder.asset(
                                                          Images.cloudyAnim),
                                                    height: 100,
                                                      width: 100,
                                                    ),

                                                    fit: BoxFit.fill,
                                                  ),
                                                  const SizedBox(height: 5,),
                                                  Text(
                                                    'wind ${controller
                                                        .weatherNowResponse!.wind!
                                                        .speed} m/s',
                                                    style: Theme
                                                        .of(context)
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
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //second part of screen
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //text
                                  Container(
                                    child: Text(
                                      'other city'.toUpperCase(),
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                        fontSize: 16,
                                        fontFamily: 'flutterfonts',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  //horizental list
                                  MyList(),
                                  //text
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'forcast next 5 days'.toUpperCase(),
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Icon(
                                          Icons.next_plan_outlined,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  //chat
                                  MyChart(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                fallback:(ctx)=>Center(child: CircularProgressIndicator(color: Colors.amber,),),);
          }),
    );
  }
}
