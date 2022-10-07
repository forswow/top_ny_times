import 'dart:async';

import 'package:dio/dio.dart';

import '../model/model.dart';

const apiKey = 'x4vGB0Qn7PoroElGhGAJWek3GwJtGcnp';

class Data {
  Future getResponse([String section = 'home']) async {
    var dio = Dio();
    try {
      final response = await dio.get(
          'https://api.nytimes.com/svc/topstories/v2/$section.json?api-key=$apiKey');
      if (response.statusCode == 200) {
        return Post.fromJson(response.data).results;
      }
    } catch (e) {
      print(e);
      Future.error(Exception().toString());
    } finally {}
  }
}
