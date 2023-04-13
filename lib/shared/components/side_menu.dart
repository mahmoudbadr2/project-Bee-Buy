import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:untitled3/models/rive_assets/rive_assets.dart';
import 'package:untitled3/shared/components/side_menu_tile.dart';
import 'package:untitled3/utils/rive_utils.dart';

import 'info_card.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}


class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFFb06701),
        child: SafeArea(
          child: Column(
            children:
            [
              InfoCard(
                name: 'Mahmoud Badr',
                profession: 'User',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24,top: 32,bottom: 16),
                child: Text('Browse'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenus.map((menu) => SideMenuTile(
                menu: menu,
                riveonInit: (artboard){
                  StateMachineController controller = RiveUtils.getRiveController(
                      artboard,
                    stateMachineName: menu.stateMachineName
                  );
                  menu.input = controller.findSMI("active") as SMIBool;
                },
                press: (){
                  menu.input!.change(true);
                  Future.delayed(Duration(seconds: 1),(){
                    menu.input!.change(false);
                  });
                },
                isActive : false,
              )),
            ],
          ),
        ),
      ),
    );
  }
}



