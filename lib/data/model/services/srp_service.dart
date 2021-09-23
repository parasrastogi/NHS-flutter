import 'package:http/http.dart' as http;
import 'package:newhomesource/data/model/community_search/request_param_model.dart';
import 'dart:convert';
import 'auth.dart';

class SRPService {
  static const baseUrl = "http://salesarchitect-build.bhitest.com";
  static const urlCommunity = "$baseUrl/api/CommunityListing/GetCommunities";
  static const urlBuilder = "$baseUrl/api/CommunityListing/GetBuilders";
  static var uri = Uri.parse(urlCommunity);

  Future getCommunities(RequestParamModel reqBody) async {
    uri = Uri.parse(urlCommunity);
    var response = await http.post(uri,
        headers: Auth.jsonHeaders, body: jsonEncode(reqBody.toJson()));
    final parsedJson = json.decode(response.body);
    return parsedJson;
  }

  Future getBuilders(Map<String, dynamic> reqBody) async {
    uri = Uri.parse(urlBuilder);
    var response = await http.post(uri,
        body: jsonEncode(reqBody), headers: Auth.jsonHeaders);
    final parsedJson = json.decode(response.body);
    return parsedJson;
  }
}
