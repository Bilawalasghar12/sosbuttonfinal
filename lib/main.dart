import 'package:flutter/material.dart';
import 'package:untitledmakingsosbuttonfinal/secondclass.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: App(),
      ),
    ),
  );
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool button = false;
  int millisecond = 500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                100,
              ),
            ),
            duration: Duration(milliseconds: millisecond),
            //  color: Colors.blue,

            height: button ? MediaQuery.of(context).size.height / 1.5 : 150,
            width: 131,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 131,
                  height: 131,
                  //color: Colors.red,
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 30),

                  decoration: BoxDecoration(
                      color: Color(0xffff6C00),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          topLeft: Radius.circular(100))),

                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        button = !button;
                      });

                      Future.delayed(
                        Duration(
                          milliseconds: millisecond,
                        ),
                      ).then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondClass(),
                            ),
                          ));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        child: Center(
                          child: Text(
                            'SOS',
                            style: TextStyle(
                              color: Color(0xffff6C00),
                            ),
                          ),
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color(0xffff6C00),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
