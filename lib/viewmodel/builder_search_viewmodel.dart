import 'package:newhomesource/data/model/builder_search/brand_model.dart';
import 'package:newhomesource/data/model/type_ahead/type_ahead_model.dart';
import 'package:newhomesource/data/repository/builder_search_result_repository.dart';

class BuilderSearchViewModel {
  List<BrandModel> brandList = [];
  bool isLoading = true;
  bool showShimmer = true;
  double aspectRatio = 9 / 7;

  Future<List<BrandModel>> getBuilderList(
      TypeAheadModel selectedLocation) async {
    var requestBody = {
      "MarketId": selectedLocation.MarketId,
      "includeMPC": true
    };
    isLoading = true;
    var builderResult =
        await BuilderSearchResultRepository().fetchBuilderList(requestBody);
    isLoading = false;
    showShimmer = false;
    brandList.addAll(builderResult.brandModel);
    return brandList;
  }
}
