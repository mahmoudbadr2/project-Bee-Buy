
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/cubit/AppState.dart';
import 'package:untitled3/models/malls_category/malls%20category_model.dart';
import 'package:untitled3/modules/malls_shops/category_shop.dart';
import '../../cubit/AppCubit.dart';

class CityStarsShops extends StatefulWidget {
  const CityStarsShops({Key? key, required this.mallName}) : super(key: key);
  final String mallName;

  @override
  _CityStarsShopsState createState() => _CityStarsShopsState();
}

class _CityStarsShopsState extends State<CityStarsShops> {
  @override
  void initState() {
    super.initState();
    AppCubit.get(context).getMallShopcategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mallName),
      ),
      body: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          if (state is! AppGetCategorySuccessState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final cubit = AppCubit.get(context);
            final mallCategories =
            cubit.listt.firstWhere((element) => element.keys.first == widget.mallName)['${widget.mallName}'];
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                itemCount: mallCategories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryShop(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.shopping_cart, size: 48.0),
                            SizedBox(height: 16.0),
                            Text(
                              mallCategories[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              '20% OFF',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}