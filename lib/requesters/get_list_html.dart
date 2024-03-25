

import 'package:dio/dio.dart';
import 'package:ejercicio1listas/domain/entities/post.dart';


class GetListHtml {

  final _dio= Dio();

  Future<List<Post>> getList () async {
    final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
    List<Post> postArray = [];
    final postJsonArray = response.data;
    postJsonArray.forEach( (postJson){
      Post newPost = Post.fromJson(postJson);  
      postArray.add(newPost);
    }

    );
    return postArray;
   }

}

