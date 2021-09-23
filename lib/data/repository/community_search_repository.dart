import 'package:newhomesource/data/model/community_search/request_param_model.dart';
import 'package:newhomesource/data/model/services/srp_service.dart';
import '../model/community_search/community_list_result.dart';

class CommunitySearchRepository {
  SRPService _srpService = SRPService();
  Future<CommunityListResult> fetchCommunityList(
      RequestParamModel requestParamModel) async {
    dynamic response = await _srpService.getCommunities(requestParamModel);
    //final jsonData = response['results'];
    var list = CommunityListResult.fromJson(response);
    return list;
  }
}
