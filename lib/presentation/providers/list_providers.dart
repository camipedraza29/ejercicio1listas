

import 'package:ejercicio1listas/requesters/get_list_html.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio1listas/domain/entities/post.dart';

class ListProviders extends ChangeNotifier{
  final listScrollController = ScrollController();
  final getListHtml = GetListHtml();
  List<Post> postList = [];


  Future<void> getPosts() async {
    postList = await getListHtml.getList();
    notifyListeners();
  }

}
