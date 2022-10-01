import 'dart:ui';

import 'package:flutter/material.dart';

import '../repository/dataRepository.dart';
import 'dataViewModel.dart';

class HomeViewModel{
  final String title="STORE";
  final Color color=Color(0xff8ea1f0);
  final double heightSpace=20;
  final double widthSpace=20;
  final borderRadius=BorderRadius.circular(10);
  final padding=EdgeInsets.all(10);
  final fontSize=20.0;

  DataRepository? dataRepository;
  HomeViewModel({this.dataRepository});

  Future<List<DataViewModel>> getAllDataAPI() async {
    var dataFromAPI = await dataRepository!.getAllData();
    return dataFromAPI.map((data)=>DataViewModel(dataModel: data)).toList();
  }
  List<DataViewModel> getAllData()  {
    var dataFromLocal = dataRepository!.getAllData();
    return dataFromLocal.map((data)=>DataViewModel(dataModel: data)).toList();
  }
}