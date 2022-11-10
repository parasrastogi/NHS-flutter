import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:newhomesource/data/model/services/auth.dart';
import 'package:newhomesource/data/model/type_ahead/type_ahead_model.dart';
import 'package:newhomesource/data/model/type_ahead/type_ahead_result.dart';

class TypeAheadService {
  static Future<List<TypeAheadModel>> getTypeHeadResult(String text) async {
    print("text search $text");

    final Map<String, String> _jsonHeaders = {
      HttpHeaders.authorizationHeader: Auth.authorizationToken,
      HttpHeaders.contentTypeHeader: "application/json",
      'SAApiVersion': '2.0'
    };

    var url = Uri.parse(
        'http://salesarchitect-build.bhitest.com/api/TypeAhead/Locations?searchTerm=$text&types=Market,Community,Zip,City,Developer');

    var response = await http.get(url, headers: _jsonHeaders);

    print("response.body---> ${response.body}");

    try{
      final parsedJson = json.decode(response.body);
      if (parsedJson['Model'] == null){
        return List<TypeAheadModel>.empty();
      }else{
        var list = TypeAheadResult.fromJson(parsedJson);

        // final list = parsedJson['Model'] as List;
        // var typeAheadList = list.map(
        //   (typeAhead) {
        //     final parsedJson = typeAhead as Map<String, dynamic>;
        //     print(parsedJson);
        //     return TypeAheadModel.fromJson(parsedJson);
        //   },
        // ).toList();
        print("list.typeAheadList---> ${list.typeAheadList}");
        return list.typeAheadList ?? List<TypeAheadModel>.empty();
      }

    }on Exception{

    }
      return List<TypeAheadModel>.empty();
  }
}
