import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// stl -> to create class
class HomeScrean extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          "First App",
        ),
        actions: [
          IconButton(
              icon:Icon(
                Icons.notification_important,
              ),
            onPressed: onNotification,
          ),
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: ()
            {
              print(" Ma boraha ya moftary");
            },
          ),
        ],
        backgroundColor: Colors.orange,
      ),
      // body: Container(
      //   color:Colors.greenAccent,
      //   width: double.infinity,
      //   child: Column(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children:
      //     [
      //       Container(
      //         color: Colors.red,
      //         child: Text(
      //           "First Text",
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 40.0,
      //           ),
      //         ),
      //       ),
      //       // Container(
      //       //   height: 100.0,
      //       //   color: Colors.deepPurple,
      //       //   child: Text(
      //       //     "Second Text",
      //       //     style: TextStyle(
      //       //       color: Colors.white,
      //       //       fontSize: 40.0,
      //       //     ),
      //       //   ),
      //       // ),
      //       // Container(
      //       //   height: 100.0,
      //       //   color: Colors.amber,
      //       //   child: Text(
      //       //     "thired Text",
      //       //     style: TextStyle(
      //       //       color: Colors.white,
      //       //       fontSize: 40.0,
      //       //     ),
      //       //   ),
      //       // ),
      //       // Container(
      //       //   height: 100.0,
      //       //   color: Colors.blue,
      //       //   child: Text(
      //       //     "Four Text",
      //       //     style: TextStyle(
      //       //       color: Colors.white,
      //       //       fontSize: 40.0,
      //       //     ),
      //       //   ),
      //       // ),
      //     ],
      //   ),
      // ),
      // body: Container(
      //   color: Colors.deepPurple,
      //   height: double.infinity,
      //   child: Row(
      //
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children:
      //     [
      //       Container(
      //         child: Text(
      //           "First",
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 20.0,
      //           ),
      //         ),
      //       ),
      //       // Text(
      //       //   "Second",
      //       //   style: TextStyle(
      //       //     color: Colors.white,
      //       //     fontSize: 20.0,
      //       //   ),
      //       // ),
      //     ],
      //   ),
      // ),
      // body: SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children:
      //     [
      //       Text(
      //         'First'
      //       ),
      //       Text(
      //           'Second'
      //       ),
      //       Text(
      //           'third'
      //       ),
      //       Text(
      //           'fourth'
      //       ),
      //       Text(
      //           'First'
      //       ),
      //       Text(
      //           'Second'
      //       ),
      //       Text(
      //           'third'
      //       ),
      //       Text(
      //           'fourth'
      //       ),
      //       Text(
      //           'First'
      //       ),
      //       Text(
      //           'Second'
      //       ),
      //       Text(
      //           'third'
      //       ),
      //       Text(
      //           'fourth'
      //       ),
      //       Text(
      //           'First'
      //       ),
      //       Text(
      //           'Second'
      //       ),
      //       Text(
      //           'third'
      //       ),
      //       Text(
      //           'fourth'
      //       ),
      //       Text(
      //           'First'
      //       ),
      //       Text(
      //           'Second'
      //       ),
      //       Text(
      //           'third'
      //       ),
      //       Text(
      //           'fourth'
      //       ),
      //     ],
      //   ),
      // ),

      body: Column(
        children:
        [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              width: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20.0),
                ),

              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512_960_720.jpg'),
                    height: 200.0,
                    width: 200.0,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.4),
                    width: double.infinity,
                    // padding: EdgeInsetsDirectional.only(
                    //   top: 10.0,
                    //   bottom: 10.0,
                    // ),
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Text(
                      "Flower",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    ) ;
  }
  void onNotification()
  {
    print("You click on me ah ah slowly");
  }

}