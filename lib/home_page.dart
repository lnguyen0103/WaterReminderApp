import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:syncfusion_flutter_gauges/gauges.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  //@@@@@@@@@
  //double progressValue= 1/3;

  int loadingValue=0;
  int totalValue=80;
  void onAddButtonPressed() {
    setState(() {
      loadingValue += 5;
      print("method was called");
    });
  }

  @override
  Widget build(BuildContext context) {

    //@@@@@@@
    /*
    pointers: <GaugePointer>[
      RangePointer(
        value: progressValue,
        cornerStyle: CornerStyle.bothCurve,
        width: 0.2,
        sizeUnit: GaugeSizeUnit.factor,
      )
    ];
    */
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Progress Bar"),
            // adds spacing between widgets
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 50,
              child: CircularProgressIndicator.adaptive(

                value: 1/100,


              ),
            ),

            Container(
              height: 200,
              width: 200,
              child: CircularProgressIndicator.adaptive(
                value: loadingValue / totalValue,
              ),
            ),

            // adds spacing between widgets
            SizedBox(
              height: 20,
            ),
            Container(
              height:20,
              child: Text(
                "Ounces Drinken: " + loadingValue.toString() + " /80 oz",
              ),
            ),
            // adds spacing between widgets
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: (){
                      onAddButtonPressed;
                      setState(() {
                        loadingValue += 8;
                      });
                    },
                    iconSize: 50,
                    icon: Icon(
                        Icons.water_drop_outlined,
                        color: Colors.lightBlueAccent,
                    ),

                ),
                Text( " + 8 fl oz")
              ],
            ),

            // spread operator (...) adds more items to a list
            if (loadingValue > totalValue) ...[
              SizedBox(
                height: 10,
              ),
              Text(
                'Excess Ounces Drinken:  ${loadingValue - totalValue}',
              ),
            ],


            //@@@@@@@@@
            /*
            SfRadialGauge(axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.2,
                  cornerStyle: CornerStyle.bothCurve,
                  color: Color.fromARGB(30, 0, 169, 181),
                  thicknessUnit: GaugeSizeUnit.factor,

                ),
              )
            ]),
            */
          ],
        ),
      ),

    );
  }
}
