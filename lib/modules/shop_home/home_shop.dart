
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/cubit/AppCubit.dart';
import 'package:untitled3/models/mall_moddel/mall_model.dart';
import 'package:untitled3/modules/citystars/citystars.dart';
import 'package:untitled3/shared/components/custom_mall_widget.dart';
import 'package:untitled3/shared/components/eg.dart';

import '../../cubit/AppState.dart';


class HomeShop extends StatefulWidget {
  HomeShop({Key? key}) : super(key: key);

  final DocumentReference mall = FirebaseFirestore.instance.collection('mall').doc('Cairo Festival City');

  @override
  State<HomeShop> createState() => _HomeShopState();
}

class _HomeShopState extends State<HomeShop> {
  // List imageList = [
  //   {'id' : 1 , 'imagepath' : 'assets/images/carsol/1.png',},
  //   {'id' : 2 , 'imagepath' : 'assets/images/carsol/2.png',},
  //   {'id' : 3 , 'imagepath' : 'assets/images/carsol/3.png',},
  //   {'id' : 4 , 'imagepath' : 'assets/images/carsol/4.jpg',},
  //   {'id' : 5 , 'imagepath' : 'assets/images/carsol/5.jpg',},
  // ];

  List <MallrModel> malls = [];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>AppCubit(AppInitialState())..getMall()..getMallShopcategory()
      ,
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state){},
        builder: (context, state){
          return ConditionalBuilder(
            condition: AppCubit.get(context).malls.length != 0,
            builder: (context)=>Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children:
                  [
                    // Stack(
                    //   children: [
                    //     InkWell(
                    //       onTap: () {
                    //         print(currentIndex);
                    //       },
                    //       child: CarouselSlider(
                    //         items: imageList.map(
                    //               (item) => Image.asset(
                    //             item['imagepath'],
                    //             fit: BoxFit.cover,
                    //             width: double.infinity,
                    //           ),
                    //         ).toList(),
                    //         carouselController: carouselController,
                    //         options: CarouselOptions(
                    //           scrollPhysics: const BouncingScrollPhysics(),
                    //           autoPlay: true,
                    //           aspectRatio: 2,
                    //           viewportFraction: 1,
                    //           onPageChanged: (index, reason) {
                    //             AppCubit.get(context).changeIndex(index);
                    //             currentIndex = index;
                    //           },
                    //         ),
                    //       ),
                    //     ),
                    //     Positioned(
                    //       bottom: 10,
                    //       left: 0,
                    //       right: 0,
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: imageList.asMap().entries.map((entry) {
                    //           return GestureDetector(
                    //             onTap: () => carouselController.animateToPage(entry.key),
                    //             child: Container(
                    //               width: currentIndex == entry.key ? 17 : 7,
                    //               height: 7.0,
                    //               margin: const EdgeInsets.symmetric(
                    //                 horizontal: 3.0,
                    //               ),
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(10),
                    //                   color: currentIndex == entry.key
                    //                       ? Colors.red
                    //                       : Colors.teal),
                    //             ),
                    //           );
                    //         }).toList(),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 15,),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                          child: GridView.count(

                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            childAspectRatio: 1.1,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,

                            children: List.generate(
                              AppCubit.get(context).malls.length,
                                  (index) => itemBuilder(AppCubit.get(context).malls[index],context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            fallback: (context)=> Center(child: CircularProgressIndicator(),),
          );
        },

      ),
    );
}
  }
  Widget itemBuilder(MallrModel malls, BuildContext context) {
    return MallsBottomShape(
      imagepath: malls.image,
      onpress: () {
        AppCubit.get(context).mName = malls.name;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CityStarsShops(mallName: malls.name,

            ),
          ),
        );
      },
    );
  }



