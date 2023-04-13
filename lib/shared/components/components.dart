import 'package:flutter/material.dart';

Widget defaultBotton({
  required double width,
  required double height,
  required Color background,
  // ignore: avoid_types_as_parameter_names
  required Function function,
  required String text,
  Padding? padding,
  bool isUppercase = true,
}) =>
    Padding(
      padding:
          EdgeInsetsDirectional.only(start: 60, end: 60, bottom: 0, top: 0),
      child: Container(
        height: height,
        width: width,
        color: background,
        padding: EdgeInsets.all(0),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          onPressed: () {
            function();
          },
          child: Text(
            isUppercase ? text.toUpperCase() : text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

Widget defaultFormfield({
  required TextEditingController controller,
  required TextInputType type,
  bool ispassword = false,
  Function? submit,
  Function? change,
  Function()? onTap,
  required String? Function(String?) validate,
  required String lable,
  required IconData prefix,
  IconData? suffix,
  Function? suffixpress,
  bool isClikable = true,
}) =>
    Padding(
      padding: const EdgeInsetsDirectional.only(start: 15, end: 15),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: ispassword,
        onFieldSubmitted: submit = null,
        onChanged: change = null,

        onTap: onTap,

        enabled: isClikable,

        validator: validate,

        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),

          // hintText: "Email Address"
          labelText: lable,
          prefixIcon: Icon(
            color: Color(0xfff5c855),
            prefix,

          ),
          suffixIcon: suffix != null ? IconButton(
                  onPressed: () {
                    suffixpress!();
                  },
                  icon: Icon(
                    suffix,
                    color: Color(0xfff5c855),
                  ),
                )
              : null,
          border: OutlineInputBorder(),
        ),
      ),
    );


Widget shopBotton({

  required NetworkImage imagepath,
  required Function() onpressed,

}) => Container(

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
        onPressed: onpressed ,
        ),
);


Widget ShopsInMall ({
   required String imagepath,
  required Function() onpressed,
      }) =>  Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
      border: Border.all(color: Color(0xfff5c855),),
      borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(20)),
      image: DecorationImage(
      image: AssetImage('$imagepath'),
      fit: BoxFit.fill,
      ),

      ),
      child: MaterialButton(
      padding: EdgeInsets.all(0),
      child: null,
      onPressed: onpressed,
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> CityStarsShops()))}
     ),
);