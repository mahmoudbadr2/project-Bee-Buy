import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled3/modules/shop_home/home_shop.dart';
import 'package:untitled3/modules/sign_up_screen/sign_up.dart';
import 'package:untitled3/shared/components/components.dart';

import '../../layout/shop_home_screen.dart';

class LoginScrean extends StatefulWidget {
  @override
  State<LoginScrean> createState() => _LoginScreanState();
}

class _LoginScreanState extends State<LoginScrean> {
  var emailController = TextEditingController();

  var passController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  bool isPassword = true;

  RegExp passregex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Container(
      //     child: Text(
      //       'Bee Buy',
      //       style: TextStyle(
      //         fontSize: 20,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // ),
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
                  height: 210,
                  decoration: BoxDecoration(
                      color: Color(0xfff5c855),
                      borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(60.0),
                          bottomStart: Radius.circular(60.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/bee.png'),
                        width: 200,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      defaultFormfield(
                        controller: emailController,
                        lable: "Email",
                        prefix: Icons.email,
                        type: TextInputType.emailAddress,

                        validate: (String? value)
                        {

                          if (value!.isEmpty )
                          {
                            return 'Please enter Email';
                          }
                          else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value!))
                            {
                              return 'Email must be like examble@gmail.com';
                            }

                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
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
                              return 'Enter valide password ';
                            }
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
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
                              ' LOGIN',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              if (formkey.currentState!.validate()) // بيعمل check لو المكان فاضي مش مكتوب فيه حاجه هيبعت الرساله
                              {
                                FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password : passController.text).then((value) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShopHomeScreen()));
                                });
                              }
                              else
                                {
                                  if (formkey.currentState!.validate()) // بيعمل check لو المكان فاضي مش مكتوب فيه حاجه هيبعت الرساله
                                      {
                                    FirebaseAuth.instance.signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password : passController.text).then((value) {
                                          return "Please enter right email";
                                    });
                                  }
                                }

                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "FORGOT PASSWORD?",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'OR',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: 90, start: 90),
                        child: Container(
                          width: 200,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:Color(0xfff5c855),
                          ),
                          child: MaterialButton(
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
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
