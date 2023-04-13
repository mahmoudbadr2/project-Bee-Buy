 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/models/user/user_model.dart';



class usersScrean extends StatelessWidget {
  List<UserModel> users = [
    UserModel(
        id: 1,
        name: 'osha badr',
        phone: '+201012966173',
    ),
    UserModel(
      id: 2,
      name: 'mohammed badr',
      phone: '+201022966173',
    ),
    UserModel(
      id: 3,
      name: 'habiba badr',
      phone: '+201111966173',
    ),
    UserModel(
      id: 1,
      name: 'osha badr',
      phone: '+201012966173',
    ),
    UserModel(
      id: 2,
      name: 'mohammed badr',
      phone: '+201022966173',
    ),
    UserModel(
      id: 3,
      name: 'habiba badr',
      phone: '+201111966173',
    ),
  ];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Users",
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buidUserItem(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ) ,
        itemCount: users.length ,
      ),
    );
  }
  Widget buidUserItem(UserModel user) =>  Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:
      [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            "${user.id}",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children:
          [
            Text(
              "${user.name}",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "+${user.phone}",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
