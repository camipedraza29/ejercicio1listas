import 'package:ejercicio1listas/presentation/providers/list_providers.dart';
import 'package:ejercicio1listas/requesters/get_list_html.dart';
import 'package:ejercicio1listas/domain/entities/post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 135, 135),
        title: const Text('Lista de Post'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: true,
      ),
      body: Center(child: ListViewCreate()),
    );
  }
}

class ListViewCreate extends StatelessWidget {
  final List<Post>? postList;

  const ListViewCreate({
    super.key,
    this.postList,
  });

  @override
  Widget build(BuildContext context) {
    final listProviders = context.watch<ListProviders>();
    listProviders.getPosts();
    return ListView.builder(
        itemCount: listProviders.postList.length,
        itemBuilder: (context, index) {
          final post = listProviders.postList[index];
          return postContainer(post);
        });
  }

  Container postContainer(Post post) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(184, 184, 184, 1),
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(top: 15, left: 5, right: 5),
      child: Text(post.title),
    );
  }
}
