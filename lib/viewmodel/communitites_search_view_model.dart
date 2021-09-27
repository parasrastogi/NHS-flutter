import 'package:newhomesource/data/model/community_search/community_model.dart';
import 'package:newhomesource/data/model/community_search/paging.dart';
import 'package:newhomesource/data/model/community_search/request_param_model.dart';
import 'package:newhomesource/data/model/type_ahead/type_ahead_model.dart';
import 'package:newhomesource/data/repository/community_search_repository.dart';

class CommunitySearchResultViewModel {
  int page = 1;
  int totalCount = 0;
  int totalHomeCount = 0;
  int pageSize = 10;
  bool hasLoadMore = true;
  bool isLoading = false;
  bool showShimmer = true;
  List<CommunityModel> communityList = [];
  Future<List<CommunityModel>> getData(TypeAheadModel typeAheadModel) async {
    isLoading = true;
    late RequestParamModel reqData;
    switch (typeAheadModel.Type) {
      case "Market":
        reqData = RequestParamModel(
            includeMPC: true,
            brandId: 0,
            marketId: typeAheadModel.MarketId,
            paging: Paging(pageSize: pageSize, page: page++, sortBy: "Random"));
        break;
      case "Community":
      case "Developer":
        reqData = RequestParamModel(
            includeMPC: true,
            brandId: 0,
            communityIds: [typeAheadModel.Id],
            marketId: typeAheadModel.MarketId,
            paging: Paging(pageSize: pageSize, page: page++));
        break;
      case "Zip":
        reqData = RequestParamModel(
            includeMPC: true,
            paging: Paging(
                pageSize: pageSize,
                page: page++,
                sortBy: "PostalCode",
                sortFirstBy: typeAheadModel.Name),
            originLat: typeAheadModel.Latitude,
            originLng: typeAheadModel.Longitude,
            radius: 25);
        break;
      case "City":
        reqData = RequestParamModel(
            includeMPC: true,
            paging: Paging(
                pageSize: pageSize,
                page: page++,
                sortBy: "City",
                sortFirstBy: typeAheadModel.City,
                sortSecondBy: "Distance"),
            originLat: typeAheadModel.Latitude,
            originLng: typeAheadModel.Longitude,
            radius: 25);
        break;

      default:
        break;
    }

    var communityResult =
        await CommunitySearchRepository().fetchCommunityList(reqData);
    totalCount = communityResult.totalCount ?? 0;
    isLoading = false;
    communityList.addAll(communityResult.resultsArray);
    return communityList;
  }

  Future<List<CommunityModel>> loadMore(TypeAheadModel typeAheadModel) async {
    return await getData(typeAheadModel);
  }
}
