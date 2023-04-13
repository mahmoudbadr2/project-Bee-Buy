import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/layout/shop_home_screen.dart';
import 'package:untitled3/modules/shop_home/home_shop.dart';
import 'package:untitled3/modules/welcome_screen/welcome_screen.dart';
import 'package:untitled3/shared/components/components.dart';

class SignUp extends StatefulWidget {
   SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  late String _name, _email;
  var formkey = GlobalKey<FormState>();

  var usernameController = TextEditingController();

  var emailController = TextEditingController();

   var passController = TextEditingController();

   var repeat_passController = TextEditingController();

   var phone_numbercontroller = TextEditingController();

  RegExp passregex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  RegExp phonenum = RegExp( r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/');

   bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Color(0xfff5c855),
                      borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(60.0),
                          bottomStart: Radius.circular(60.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
                      Image(
                        image: AssetImage('assets/images/bee.png'),
                        width: 150,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,

                        ),
                      ),

                      SizedBox(height: 15,),

                      defaultFormfield(
                        controller: usernameController,
                        lable: 'User Name',
                        prefix: Icons.account_circle_outlined,
                        type: TextInputType.text,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return "Please enter your user name";
                          }
                          else if(!RegExp(r'^[a-z A-Z]+$').hasMatch(value!))
                          {
                          return "Please  Enter correct name";
                          }

                        },

                      ),

                      SizedBox(height: 15,),

                      defaultFormfield(
                        controller: emailController,
                        lable: "Email",
                        prefix: Icons.email,
                        type: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value!.isEmpty )
                          {
                            return 'Enter your Email';
                          }
                          else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value!))
                          {
                            return 'Email is not corect';
                          }
                          return null;

                        },

                      ),

                      SizedBox(height: 15,),

                      defaultFormfield(
                        controller: passController,
                        lable: "Password",
                        prefix: Icons.lock,
                        suffix: isPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        ispassword: isPassword,
                        type: TextInputType.visiblePassword,
                        suffixpress: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }

                          else if (!passregex.hasMatch(value))
                          {
                            return 'Password must be Minimum 1 Upper case Minimum 1 lowercase Minimum 1 Numeric Number Minimum 1 Special Character ';
                          }
                        },
                      ),
                      SizedBox(height: 15,),

                      defaultFormfield(
                        controller: repeat_passController,
                        lable: "Repeat Password",
                        prefix: Icons.lock,
                        suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                        ispassword: isPassword,
                        type: TextInputType.visiblePassword,
                        suffixpress: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                          else if(passController.text != repeat_passController.text)
                            {
                              return 'Password Do not match';
                            }

                          else if (!passregex.hasMatch(value))
                          {
                            return 'Enter valid password';
                          }
                        },
                      ),
                      SizedBox(height: 15,),

                      defaultFormfield(
                        controller: phone_numbercontroller,
                        lable: "Phone Number",
                        prefix: Icons.phone,
                        type: TextInputType.phone,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter phone number';
                          }
                          // else if(!RegExp( r'/^01[0125][0-9]{8}$}').hasMatch(value!))
                          // {
                          //   return 'Phone not correrct';
                          // }
                          else
                            {
                              return null;
                            }
                        },
                      ),

                      SizedBox(height: 20,),

                      Padding(
                        padding: EdgeInsetsDirectional.only(end: 90,start: 90),
                        child: Container(
                          width: 200,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xfff5c855),
                          ),
                          child: MaterialButton(
                            child: Text(
                              ' CREATE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: ()
                            {
                              if (formkey.currentState!.validate()) // بيعمل check لو المكان فاضي مش مكتوب فيه حاجه هيبعت الرساله
                              {
                                FirebaseAuth.instance.createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passController.text).then((value) => (context){});
                                Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScrean()));
                              }

                            },
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
