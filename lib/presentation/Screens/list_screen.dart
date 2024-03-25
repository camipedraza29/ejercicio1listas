import 'package:ejercicio1listas/list/get_list_html.dart';
import 'package:ejercicio1listas/list/post.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: FutureBuilder<List<Post>>(
          future: GetListHtml().getList(),
          builder: (context, snapshot) {
            return ListViewCreate(postList: snapshot.data);
          },
        ),
      ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: ListView(
          children: widgetList(),
        ))
      ],
    );
  }

  List<Widget> widgetList() {
    List<Widget> list = [];
    list.add(postSpace());
    postList?.forEach((post) {
      list.add(postContainer(post));
      list.add(postSpace());
    });
    return list;
  }

  SizedBox postSpace() => const SizedBox(height:10);

  Container postContainer(Post post) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(184, 184, 184, 1),
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(post.title),
    );
  }
}
