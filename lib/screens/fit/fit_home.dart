import 'package:fana_fitworld/controller/fit_homecontroller/steps_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../utils/appcolors.dart';

class FitHome extends StatelessWidget {
  final StepController _stepController = Get.put(StepController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent.withOpacity(.9),
      appBar: AppBar(
        iconTheme: IconThemeData(color: kprimerycolor),
        centerTitle: true,
        title: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(seconds: 2),
          curve: Curves.easeInOut,
          builder: (context, double scale, child) {
            return Transform.scale(
              scale: scale,
              child: GradientText(
                colors: [
                  ksecondarycolor,
                  kprimerycolor,
                ],
                "Fit Home",
                style: TextStyle(
                  fontFamily: "myfontregular",
                  fontSize: 27,
                ),
              ),
            );
          },
        ),
        leadingWidth: 75,
        toolbarHeight: 100,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 250,
                height: 250,
                child: Stack(children: [
                  Positioned.fill(
                    child: CircularProgressIndicator(
                      strokeWidth: 8,
                      strokeCap: StrokeCap.round,
                      backgroundColor: Colors.grey.shade800,
                      value: .30,
                      color: kprimerycolor,
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.directions_walk_sharp,
                          color: Colors.white,
                          size: 50,
                        ),
                        Obx(() => Center(
                              child: Text(
                                '${_stepController.steps}',
                                style: TextStyle(
                                    fontFamily: "myfontregular",
                                    letterSpacing: 3,
                                    fontSize: 54,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ],
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(height: 20),
              Obx(() => Text(
                    'Distance: ${_stepController.distance.toStringAsFixed(2)} meters',
                    style: TextStyle(fontSize: 24, color: kprimerycolor),
                  )),
              SizedBox(height: 20),
              Obx(() => Text(
                    'Calories: ${_stepController.calories.toStringAsFixed(2)} kcal',
                    style: TextStyle(fontSize: 24, color: kprimerycolor),
                  )),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(width: size.width,height: 200,
                  child: LineChart(LineChartData(
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: true,
                      horizontalInterval: 1,
                      verticalInterval: 1,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: kprimerycolor,
                          strokeWidth: 1,
                        );
                      },
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: kprimerycolor,
                          strokeWidth: 1,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      
                      show: true,
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: true),
                      ),
                      topTitles:  AxisTitles(
                        sideTitles: SideTitles(showTitles: true),
                        
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                          reservedSize: 30,
                          interval: 1,
                         
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                          interval: 1,
                          getTitlesWidget: leftTitleWidgets,
                          reservedSize: 42,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                
                      show: true,
                     
                    ),
                    minX: 0,
                    maxX: 11,
                    minY: 0,
                    maxY: 6,
                    lineBarsData: [
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 3),
                          FlSpot(2.6, 2),
                          FlSpot(4.9, 5),
                          FlSpot(6.8, 3.1),
                          FlSpot(8, 4),
                          FlSpot(9.5, 3),
                          FlSpot(11, 4),
                        ],
                        isCurved: true,
                        gradient: LinearGradient(
                          colors: [kprimerycolor, ksecondarycolor],
                        ),
                        barWidth: 5,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(
                          show: false,
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [kprimerycolor, ksecondarycolor]
                                .map((color) => color.withOpacity(0.3))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.white
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.white
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text(
          'MAR',
          style: style,
        );
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
}
