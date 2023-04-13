import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/cubit/AppCubit.dart';

import '../../models/malls_category/malls category_model.dart';

class ShopListScreen extends StatelessWidget {
  final TabData tabData;

  const ShopListScreen({Key? key, required this.tabData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: 1.1,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: tabData.categories.map((category) => itemBuilder(category)).toList(),
    );
  }

  Widget itemBuilder(MallCategory mallCategory) {
    return InkWell(
      onTap: () {
        // Navigate to the category page
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart),
            SizedBox(height: 10),
            Text(mallCategory.name),
          ],
        ),
      ),
    );
  }
}