import 'package:flutter/material.dart';

class StartHome extends StatelessWidget {
  const StartHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       width: 400,
       height: 700,
       decoration: BoxDecoration(
           color: Colors.deepOrange,
           borderRadius: BorderRadiusDirectional.only(
               bottomEnd: Radius.circular(180.0),
               topEnd: Radius.circular(180.0),
               // bottomStart: Radius.circular(60.0)
           )),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Image(
             image: AssetImage('assets/images/bee.png'),
             width: 150,
           ),
         ],
       ),
     ),
    );
  }
}
