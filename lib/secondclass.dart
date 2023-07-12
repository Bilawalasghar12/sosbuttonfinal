import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitledmakingsosbuttonfinal/thirdscreen.dart';

class SecondClass extends StatefulWidget {
  const SecondClass({Key? key}) : super(key: key);

  @override
  State<SecondClass> createState() => _SecondClassState();
}

class _SecondClassState extends State<SecondClass>
    with TickerProviderStateMixin {
  late AnimationController rippleController;
  late AnimationController scaleController;
  late Animation<double> rippleAnimation;
  late Animation<double> scaleAnimation;
  bool isAnimationStarted = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    rippleController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              scaleController.reverse();
              setState(() {
                isAnimationStarted = true;
              });
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: ThirdScreen()));
            }
          });
    rippleAnimation =
        Tween<double>(begin: 80.0, end: 90.0).animate(rippleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              rippleController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              rippleController.forward();
            }
          });
    scaleAnimation =
        Tween<double>(begin: 1.0, end: 30.0).animate(scaleController);

    rippleController.forward();

    Future.delayed(Duration(milliseconds: 500)).then((value) {
      scaleController.forward();
    });
  }

  @override
  void dispose() {
    rippleController.dispose();
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff6C00),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 100,
                ),
                AnimatedBuilder(
                    animation: scaleAnimation,
                    builder: (context, child) => Transform.scale(
                          scale: scaleAnimation.value,
                          child: Container(
                            height: 100,
                            //margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                        )),
              ],
            ),
          ),
          Positioned.fill(
            top: 100,
            right: 1,
            left: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  //margin: EdgeInsets.all(10),
                  child: SvgPicture.asset('assets/material-symbols_sos.svg')
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
