import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:untitled3/models/rive_assets/rive_assets.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    Key? key, required this.menu, required this.press, required this.riveonInit, required this.isActive,
  }) : super(key: key);

  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveonInit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white24,
            height: 2,
          ),
        ),
        ListTile(
          onTap: press,
          leading: SizedBox(
            height: 34,
            width: 34,
            child: RiveAnimation.asset(
              menu.src,
              artboard: menu.artboard,
              onInit: riveonInit,
            ),
          ),
          title: Text(
            menu.title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}