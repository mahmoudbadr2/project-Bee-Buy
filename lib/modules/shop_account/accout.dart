import 'package:flutter/cupertino.dart';

class AccountShop extends StatelessWidget {
  const AccountShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Account Shop',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}