class MallsModel
{
  final String name;
  final String address;

  MallsModel( this.name, this.address);

factory MallsModel.fromJsaon(jsonData)
{
  return MallsModel(jsonData['address'], jsonData['name']);
}
}
// //
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:firebase_core/firebase_core.dart';
//
// import '../../shared/components/components.dart';
// class MallsModel extends StatefulWidget {
//    MallsModel({Key? key}) : super(key: key);
//
//    final DocumentReference mall = FirebaseFirestore.instance.collection('mall').doc('Cairo Festival City');
//
//
//   @override
//   State<MallsModel> createState() => _MallsModelState();
// }
//
// class _MallsModelState extends State<MallsModel> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
//         {
//           if (snapshot.hasError) {
//             return Text('Something went wrong');
//           }
//
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Text('Loading...');
//           }
//
//           return ListView(
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data = document.data() as Map<String, dynamic>;
//
//               return ListView(
//                 children:
//                 [
//                   shopBotton(
//                     name:  data['name'],
//                       imagepath: 'assets/images/masr1.jpg',
//                       onpressed: (){
//                         // Navigator.push(context, MaterialPageRoute(builder: ));
//                       }
//                   ),
//                 ],
//               );
//             }).toList(),
//           );
//         },
//     );
//   }
// }
//
//
