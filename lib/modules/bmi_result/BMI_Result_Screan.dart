import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bmiResScrean extends StatelessWidget {


  late final bool isMale ;
  late final double Resalt ;
  late final int age ;

  bmiResScrean({
    required this.isMale,
    required this.age,
    required this.Resalt,
});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
          ),
        ),
        title: Text(
          "BMI RESALT",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text(
              'Gender : ${isMale? "Male" : "Female"} ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,

              ),
            ),

            Text(
              'Age : $age',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,

              ),
            ),

            Text(
              'Resalt : ${Resalt.round()}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,

              ),
            ),

          ],
        ),
      ),
    );
  }
}
