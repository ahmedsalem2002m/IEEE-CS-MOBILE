import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.weatherModel,});
  final WeatherModel weatherModel;



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController weatherController = TextEditingController();
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#96b0c1'),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50.0,
          right: 20,
          left: 20,
          bottom: 20,
        ),
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 18),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: HexColor('#738491'),
                ),
                child: Text(
                  "Today\'s Weather",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 700),
                margin: EdgeInsets.symmetric(vertical: 12),
                width: double.infinity,
                height: isShow == false ? 220:450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: HexColor('#56636a'),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.weatherModel.cityName,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "${widget.weatherModel.tempC}°C",
                        style: TextStyle(
                          fontSize: 65,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image(
                                image: NetworkImage(
                                  'https:${widget.weatherModel.mainIcon}',
                                ),
                                width: 40,
                                height: 40,
                              ),
                              Text(
                                widget.weatherModel.state,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isShow = !isShow;
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Text(
                                  "See More",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 8,),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context,index)=>Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                index <=11 ? Text(
                                  '${
                                      widget.weatherModel.foreCastDay[0]
                                          .hour[index].time.split(" ")[1].split(
                                          ":")[0]
                                  }AM',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ):
                                Text(
                                  '${
                                    widget.weatherModel.foreCastDay[0]
                                        .hour[index].time.split(" ")[1].split(
                                        ":")[0]
                                  }PM',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "${widget.weatherModel.foreCastDay[0].hour[index].temp}°",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                Image(
                                  image: NetworkImage(
                                    'https:${widget.weatherModel.foreCastDay[0].hour[index].icon}',
                                  ),
                                  width: 40,
                                  height: 40,
                                ),
                              ],
                            ),
                            separatorBuilder: (context,index)=>Padding(
                                padding:EdgeInsets.symmetric(horizontal: 0,vertical: 12),
                            child: Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.grey,
                            ),),
                            itemCount: widget.weatherModel.foreCastDay[0].hour.length),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 18),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: HexColor('#738491'),
                ),
                child: Text(
                  "Weather this Week",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Container(
                width: double.infinity,
                height: 130,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>Container(
                      width: 120,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: HexColor('#56636a'),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              DateFormat.EEEE().format(DateTime.parse(widget.weatherModel.foreCastDay[index].date)),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),

                            Text(
                              widget.weatherModel.foreCastDay[index].date,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Image(
                              image: NetworkImage(
                                'https:${widget.weatherModel.foreCastDay[index].listIcon}',
                              ),
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              "${widget.weatherModel.foreCastDay[index].avgT}°",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context,index)=>Padding(
                      padding:EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                      child: Container(
                        width: 14,
                        height:130 ,
                      ),
                    ),
                    itemCount: widget.weatherModel.foreCastDay.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}
