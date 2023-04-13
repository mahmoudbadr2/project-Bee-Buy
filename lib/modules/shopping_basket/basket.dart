import 'package:flutter/cupertino.dart';

class BasketShop extends StatelessWidget {
  const BasketShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Basket shop',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}