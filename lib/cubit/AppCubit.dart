import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/models/mall_moddel/mall_model.dart';
import 'package:untitled3/models/shops_model/shop_model.dart';

import '../models/malls_category/malls category_model.dart';
import 'AppState.dart';
class TabData {
  final String title;
  final List<MallCategory> categories;

  TabData(this.title, this.categories);
}
class AppCubit extends Cubit<AppStates> {
  AppCubit(super.AppInitialState);

  static AppCubit get(context) => BlocProvider.of(context);

  MallrModel? mallrModel;
  List <MallrModel> malls=[];
  MallCategory? mallCategory;

  List categoriesList = [];
  List Shoplist = [];
  List<Map<String,dynamic>> listt =[];
  List<Map<String,dynamic>> listtshop =[];
  int  i = 0;
  
  
  
  
  void getMall(){
    emit(AppGetMallLoadingState());
    FirebaseFirestore.instance.collection('malls').get().then((value) {
      value.docs.forEach((element) {
        malls.add(MallrModel.fromJson(element.data()));
        emit(AppGetMallSuccessState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(AppGetMallErrorState());
    });
  }





  MallCategory? mallCategoryy;
  String? mName;

  void getMallShopcategory() {
    emit(AppGetCategoryLoadingState());
    FirebaseFirestore.instance.collection('malls').get().then((value) {
      value.docs.forEach((element) {
        MallrModel model = MallrModel.fromJson(element.data());
        element.reference.collection('Categories').get().then((value) {
          value.docs.forEach((element) {
            MallCategory mallCategory = MallCategory.fromJson(element.data());
            categoriesList.add(mallCategory.name);
          });
          //print(model!.name);
          listt.add({model.name: categoriesList});
          categoriesList = [];
          emit(AppGetCategorySuccessState());
        }).catchError((e){
          emit(AppGetCategoryErrorState());
        });
      });
      emit(AppGetMallCategorySuccessState());
    }).catchError((e){
      emit(AppGetMallCategoryErrorState());
    });
  }



  // void getMallsShop() {
  //   emit(AppGetCategoryLoadingState());
  //   FirebaseFirestore.instance.collection('malls').get().then((value) {
  //     value.docs.forEach((element) {
  //       element.reference.collection('Categories').get().then((value) {
  //         value.docs.forEach((element) {
  //             element.reference.collection('shops').get().then((value) {
  //               value.docs.forEach((element) {
  //                 ShopModel shopModel = ShopModel.fromJson(element.data());
  //                   Shoplist.add(shopModel.name);
  //                   print(shopModel.name);
  //               });
  //               emit(AppGetShopSuccessState());
  //             }).catchError((e){
  //               emit(AppGetShopErrorState());
  //             });
  //         });
  //       });
  //     });
  //   });
  // }


  //
  // void getMallsShop() {
  //   emit(AppGetCategoryLoadingState());
  //   FirebaseFirestore.instance.collection('malls').get().then((value) {
  //     value.docs.forEach((mallElement) {
  //       MallrModel model = MallrModel.fromJson(mallElement.data());
  //
  //       mallElement.reference.collection('Categories').get().then((categoryValue) {
  //         List<Map<String, dynamic>> categoriesList = [];
  //         categoryValue.docs.forEach((categoryElement) async {
  //           MallCategory mallCategory = MallCategory.fromJson(categoryElement.data());
  //
  //           QuerySnapshot shopQuerySnapshot = await categoryElement.reference.collection('shops').get();
  //           List<Map<String, dynamic>> shopsList = [];
  //           shopQuerySnapshot.docs.forEach((shopDocumentSnapshot) {
  //             shopsList.add(shopDocumentSnapshot.data());
  //           });
  //
  //           categoriesList.add({
  //             'name': mallCategory.name,
  //             'shops': shopsList
  //           });
  //         });
  //
  //         listt.add({model.name: categoriesList});
  //         emit(AppGetCategorySuccessState());
  //       }).catchError((e){
  //         emit(AppGetCategoryErrorState());
  //       });
  //     });
  //
  //     emit(AppGetMallCategorySuccessState());
  //   }).catchError((e){
  //     emit(AppGetMallCategoryErrorState());
  //   });
  // }

  void changeIndex(index){
    i = index;
    emit(AppChangeIndexState());
  }
}

