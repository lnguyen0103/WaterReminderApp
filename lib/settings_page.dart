import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}
class _SettingsPageState extends State<SettingsPage> {
  int _counter = 0;
  String dropdownValue = 'male';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });


  }

  @override
  Widget build(BuildContext context) {

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
            children:[
                // Personal info section
                Expanded(
                    child:Column(
                        // positions category header and boxes under it to the left
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                                  'Personal Information',
                                  style: TextStyle(
                                    // these lines allows for text with a spaced underline
                                    decoration: TextDecoration.underline,
                                    color: Colors.transparent,
                                    decorationColor: Colors.black,
                                    decorationThickness: 2,
                                    decorationStyle: TextDecorationStyle.solid,
                                    fontSize: 20,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        offset: Offset(0, -10),
                                      ),
                                    ], // shadows
                                  ),
                                ),
                              ),
                          ),

                          // implementing sub section row item using all expanded
                          Expanded(

                            child: InkWell(
                              onTap: (){

                              },
                              child:Row(
                                children: [
                                  Expanded(
                                      flex:17,
                                      child: FittedBox(
                                        child: Icon(
                                          Icons.wc_rounded,
                                          color: Colors.lightBlueAccent,

                                        ),
                                      )
                                  ),
                                  Expanded(
                                    flex:20,
                                    child: Text("Sex: ",
                                      style: TextStyle(
                                        fontSize: 25,
                                      )
                                    ),
                                  ),

                                  //@@@@@@
                                  Expanded(
                                    flex:60,
                                    child: DropdownButton<String>(
                                      value: dropdownValue, // Line 24 check settings page state class

                                      elevation: 16,
                                      style: const TextStyle(color: Colors.lightBlueAccent),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.lightBlueAccent,
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue = newValue!;
                                        });
                                      },
                                      items: <String>['male', 'female']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                    /*
                                    child: Text("What is your sex?",
                                        style: TextStyle(
                                          fontSize: 25,
                                        )
                                    ),
                                    */
                                  )
                                ],
                              ),
                            ),
                          ),

                            // implementing sub section row item using widget standard sizes and only
                            // one item as expanded()
                            Expanded(
                              child: InkWell(
                                  onTap: (){

                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        // allows container to match height of its parent: the row
                                        height:double.infinity,
                                        //FittedBox is a frame for the icon that can expand icon to fit container
                                        child: FittedBox(
                                          child: Icon(
                                            Icons.monitor_weight_rounded,
                                            color: Colors.lightBlueAccent,
                                          ),
                                        ),
                                      ),
                                      Text("Weight: ",
                                        style: TextStyle(
                                          fontSize: 25,
                                        )

                                      ),
                                      Expanded(
                                        // @@@@@@
                                        child: TextField(
                                          decoration: InputDecoration(labelText: 'Enter Weight'),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                        )
                                        /*
                                        child: Text("Enter your weight",
                                            style: TextStyle(
                                              fontSize: 25,
                                            )
                                        ),
                                        */
                                      )
                                    ],
                                  )
                              ),
                            ),
                        ]
                    ),
                ),
              //******************************
              // end of first section


              // start of second section
              Expanded(
                child:Column(
                  // positions category header and boxes under it to the left
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Reminder Settings',
                            style: TextStyle(
                              // these lines allows for text with a spaced underline
                              decoration: TextDecoration.underline,
                              color: Colors.transparent,
                              decorationColor: Colors.black,
                              decorationThickness: 2,
                              decorationStyle: TextDecorationStyle.solid,
                              fontSize: 20,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(0, -10),
                                ),
                              ], // shadows
                            ),
                          ),
                        ),
                      ),

                      Expanded(

                        child: InkWell(
                          onTap: (){
                            AlertDialog(
                                title: Text("Coming soon!"),
                                actions: <Widget>[
                                  TextButton (
                                    child: Text("ok"),
                                    onPressed:() {
                                    },
                                  ),
                                ],
                            );
                          },
                          child:Row(
                            children: [
                              Container(
                                // allows container to match height of its parent: the row
                                height: double.infinity,
                                //FittedBox is a frame for the icon that can expand icon to fit container
                                child: FittedBox(
                                  child: Icon(
                                    Icons.doorbell_outlined,
                                    color: Colors.lightBlueAccent,

                                  ),
                                ),
                              ),
                              Text("Reminder Ringtones (TBA!)",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.grey,

                                  )
                              ),
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        child: InkWell(
                            onTap: (){

                            },
                            child: Row(
                              children: [
                                Container(
                                  // allows container to match height of its parent: the row
                                  height:double.infinity,
                                  //FittedBox is a frame for the icon that can expand icon to fit container
                                  child: FittedBox(
                                    child: Icon(
                                      Icons.watch_later_outlined,
                                      color: Colors.lightBlueAccent,
                                    ),
                                  ),
                                ),
                                Text("Reminder Frequency (TBA!)",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.grey,
                                    )

                                ),
                              ],
                            )
                        ),
                      ),
                    ]
                ),
              ),
              //******************************
              // end of second section

              // start of third section
              // @@@@@@ took out expanded parents for both the title and the one row in here b/c both got
              // stretch out to bigger sizes from only having one row as opposed to 2
              Expanded(
                child:Column(
                  // positions category header and boxes under it to the left
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'Other options',
                          style: TextStyle(
                            // these lines allows for text with a spaced underline
                            decoration: TextDecoration.underline,
                            color: Colors.transparent,
                            decorationColor: Colors.black,
                            decorationThickness: 2,
                            decorationStyle: TextDecorationStyle.solid,
                            fontSize: 20,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(0, -10),
                              ),
                            ], // shadows
                          ),
                        ),
                      ),


                      Container(
                        height: 70,
                        child: InkWell(
                          onTap: (){

                          },
                          child:Row(
                            children: [
                              Container(
                                // allows container to match height of its parent: the row
                                height: double.infinity,
                                //FittedBox is a frame for the icon that can expand icon to fit container
                                child: FittedBox(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.lightBlueAccent,

                                  ),
                                ),
                              ),
                              Text("Track More Stuff (TBA!)",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.grey,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),


                    ]
                ),
              ),
            ]
            //******************************
            // end of third section

          ),
        ),
      ),
    );
  }
}
