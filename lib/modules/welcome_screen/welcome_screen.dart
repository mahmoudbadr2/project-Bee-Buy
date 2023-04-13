import 'package:flutter/material.dart';
import 'package:untitled3/layout/shop_home_screen.dart';

class WelcomeScrean extends StatefulWidget {
  const WelcomeScrean({Key? key}) : super(key: key);

  @override
  State<WelcomeScrean> createState() => _WelcomeScreanState();
}

class _WelcomeScreanState extends State<WelcomeScrean> with TickerProviderStateMixin {


late AnimationController _controller;
late Animation<double> _animation;

@override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(vsync: this ,duration: Duration(seconds: 2));

    _animation = CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut);

    _controller.forward();

  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          SizeTransition(
            sizeFactor: _animation,
            axis: Axis.horizontal,
            axisAlignment: 1,
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Color(0xfff5c855),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(300),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon:Icon(
                            Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                    ),
                  ),
                  Center(
                    heightFactor: double.minPositive,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100,right: 50),
                      child: Image.asset(
                        'assets/images/bee.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text(
              'Welcome To',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Color(0xff183661)
            ),
          ),
          Text(
              'Bee Buy',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 45,
              color: Color(0xfff2c119),
            ),
          ),
          SizedBox(height: 50,),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 90, start: 90),
            child: Container(
              width: 200,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xfff5c855),
              ),
              child: MaterialButton(
                child: Text(
                  'Get Started'.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShopHomeScreen()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
