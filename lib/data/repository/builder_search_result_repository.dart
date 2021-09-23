import 'package:newhomesource/data/model/services/srp_service.dart';

import '../model/builder_search/brand_list_result.dart';

class BuilderSearchResultRepository {
  SRPService _srpService = SRPService();
  Future<BrandListResult> fetchBuilderList(
      Map<String, dynamic> requestModel) async {
    dynamic response = await _srpService.getBuilders(requestModel);
    //final jsonData = response['results'];
    var list = BrandListResult.fromJson(response);
    return list;
  }
}
