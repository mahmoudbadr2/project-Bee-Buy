import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/cubit/AppState.dart';
import 'package:untitled3/cubit/AppCubit.dart';
import 'package:untitled3/models/shops_model/shop_model.dart';

class CategoryShop extends StatefulWidget {
  @override
  _CategoryShopState createState() => _CategoryShopState();
}

class _CategoryShopState extends State<CategoryShop> {
  @override
  void initState() {
    super.initState();
    // AppCubit.get(context).getMallsShop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Shop'),
      ),
      body: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          if (state is! AppGetShopLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AppGetShopSuccessState)
          {
            final cubit = AppCubit.get(context);
            final mallCategoryShops = cubit.listtshop;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: mallCategoryShops.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, dynamic> categoryShop = mallCategoryShops[index];
                  final String categoryName = categoryShop.keys.first;
                  final List<dynamic> shops = categoryShop.values.first;
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://picsum.photos/200'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(categoryName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 4),
                        Expanded(
                          child: ListView.builder(
                            itemCount: shops.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              final ShopModel shop = ShopModel.fromJson(shops[index]);
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(shop.imageUrl),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(shop.name),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        }
      ),
    );
  }
}