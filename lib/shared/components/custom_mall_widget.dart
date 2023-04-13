import 'package:flutter/material.dart';

class MallsBottomShape extends StatelessWidget {
  Function() onpress;
  var imagepath;
  MallsBottomShape({required this.onpress,required this.imagepath});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xfff5c855)),
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage('$imagepath'),
            fit: BoxFit.fill,
          ),
        ),
        child: MaterialButton(
          padding: EdgeInsets.all(0),
          child: null,
          onPressed: onpress,
        ),
      ),
    );
  }
}
