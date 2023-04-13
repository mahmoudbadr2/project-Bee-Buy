import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sqflite/utils/utils.dart';
import 'package:untitled3/modules/citystars/citystars.dart';
import 'package:untitled3/modules/shop_account/accout.dart';
import 'package:untitled3/modules/shop_home/home_shop.dart';
import 'package:untitled3/modules/shopping_basket/basket.dart';
import 'package:untitled3/shared/components/components.dart';



class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: Color(0xfff5c855),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.menu,
                  ),
                  onPressed: () {},
                ),
              ],
              title: Row(
                children: const [
                  // Text(
                  //   titles[currentIndex],
                  // ),
                  Image(
                    image: AssetImage('assets/images/home2.png'),
                    width: 100,
                    height: 70,
                  ),
                ],
              )
          ),
          body:

          ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Container(
                width:150,
                height: 150,

                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xfff5c855)),
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/citystars/man/adidas/add1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width:150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xfff5c855)),
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/citystars/man/adidas/1.webp'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(height: 8,),
                        const Padding(
                          padding: EdgeInsets.symmetric(),
                          child:
                          Center(child: Text('REAL MADRID ',style: TextStyle(fontWeight: FontWeight.bold))),
                        ) ,
                        Center(child: Text('EGP 2,379.00',style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),

                    Column(
                      children: [
                        Container(
                          width:150,
                          height: 150,
                          // margin: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
                          // padding: EdgeInsets.symmetric(horizontal: 45,vertical: 25),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xfff5c855)),
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/citystars/man/adidas/2.webp'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(height: 8,),
                        const Padding(
                          padding: EdgeInsets.symmetric(),
                          child:
                          Center(child: Text('Winter T-shirt',style: TextStyle(fontWeight: FontWeight.bold))),
                        ) ,
                        Center(child: Text('EGP 1,749.00',style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width:150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xfff5c855)),
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/citystars/man/adidas/3.webp'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(height: 8,),
                        const Padding(
                          padding: EdgeInsets.symmetric(),
                          child:
                          Center(child: Text('POWER FLEECE PANTS',style: TextStyle(fontWeight: FontWeight.bold))),
                        ) ,
                        Center(child: Text('EGP 999.00',style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),

                    Column(
                      children: [
                        Container(
                          width:150,
                          height: 150,
                          // margin: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
                          // padding: EdgeInsets.symmetric(horizontal: 45,vertical: 25),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xfff5c855)),
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/citystars/man/adidas/4.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(height: 8,),
                        const Padding(
                          padding: EdgeInsets.symmetric(),
                          child:
                          Center(child: Text('ADICOLOR SHORTS',style: TextStyle(fontWeight: FontWeight.bold))),
                        ) ,
                        Center(child: Text('EGP 664.30',style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width:150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xfff5c855)),
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/citystars/man/adidas/5.webp'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(height: 8,),
                        const Padding(
                          padding: EdgeInsets.symmetric(),
                          child:
                          Center(child: Text('BLACK PANTHER LONG',style: TextStyle(fontWeight: FontWeight.bold))),
                        ) ,
                        Center(child: Text('EGP 790.30',style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),

                    Column(
                      children: [
                        Container(
                          width:150,
                          height: 150,
                          // margin: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
                          // padding: EdgeInsets.symmetric(horizontal: 45,vertical: 25),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xfff5c855)),
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/citystars/man/adidas/6.webp'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(height: 8,),
                        const Padding(
                          padding: EdgeInsets.symmetric(),
                          child:
                          Center(child: Text('CAMO PANTS',style: TextStyle(fontWeight: FontWeight.bold))),
                        ) ,
                        Center(child: Text('EGP 899.00',style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width:150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xfff5c855)),
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/citystars/man/adidas/7.webp'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(height: 8,),
                        const Padding(
                          padding: EdgeInsets.symmetric(),
                          child:
                          Center(child: Text('STRIPES SWIMSUIT',style: TextStyle(fontWeight: FontWeight.bold))),
                        ) ,
                        Center(child: Text('EGP 799.20',style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),

                    Column(
                      children: [
                        Container(
                          width:150,
                          height: 150,
                          // margin: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
                          // padding: EdgeInsets.symmetric(horizontal: 45,vertical: 25),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xfff5c855)),
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/citystars/man/adidas/8.webp'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(height: 8,),
                        const Padding(
                          padding: EdgeInsets.symmetric(),
                          child:
                          Center(child: Text('SST TRACK JACKET',style: TextStyle(fontWeight: FontWeight.bold))),
                        ) ,
                        Center(child: Text('EGP 1,140.30',style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width:150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xfff5c855)),
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/citystars/man/adidas/9.webp'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(height: 8,),
                        const Padding(
                          padding: EdgeInsets.symmetric(),
                          child:
                          Center(child: Text('SALAH JACKET',style: TextStyle(fontWeight: FontWeight.bold))),
                        ) ,
                        Center(child: Text('EGP 999.00',style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),

                    Column(
                      children: [
                        Container(
                          width:150,
                          height: 150,
                          // margin: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
                          // padding: EdgeInsets.symmetric(horizontal: 45,vertical: 25),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xfff5c855)),
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/citystars/man/adidas/10.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(height: 8,),
                        const Padding(
                          padding: EdgeInsets.symmetric(),
                          child:
                          Center(child: Text('SST TRACK JACKET',style: TextStyle(fontWeight: FontWeight.bold))),
                        ) ,
                        Center(child: Text('EGP 1,140.30',style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}







