import 'package:newhomesource/data/model/community_search/request_param_model.dart';
import 'package:newhomesource/data/model/home_search/home_list_result.dart';
import 'package:newhomesource/data/model/services/srp_service.dart';

class HomeSearchRepository {
  SRPService _srpService = SRPService();
  Future<HomeListResult> fetchHomeList(
      RequestParamModel requestParamModel) async {
    dynamic response = await _srpService.getHomes(requestParamModel);
    var list = HomeListResult.fromJson(response);
    return list;
  }
}
