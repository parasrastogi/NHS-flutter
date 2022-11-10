import 'package:newhomesource/data/model/community_search/community_model.dart';
import 'package:newhomesource/data/model/community_search/paging.dart';
import 'package:newhomesource/data/model/community_search/request_param_model.dart';
import 'package:newhomesource/data/model/home_search/grouped_home_model.dart';
import 'package:newhomesource/data/model/type_ahead/type_ahead_model.dart';
import 'package:newhomesource/data/repository/home_search_respository.dart';
import 'package:newhomesource/data/model/home_search/home_model.dart';

class HomeSearchViewModel {
  bool isLoading = false;
  int page = 1;
  int pageSize = 100;
  int totalCount = 0;
  bool hasLoadMore = true;
  bool showShimmer = true;
  List<HomeModel> homeList = [];
  // Map<int, List<HomeModel>> groupedHomeMap = {};
  Map<int, GroupedHomeModel> groupedHomeMap = {};
  List<GroupedHomeModel> groupedHomeList = [];

  Future<Map<int, GroupedHomeModel>> getHomes(
      Map<int, CommunityModel>
          communityIDAndModelMap, // return List<GroupHomeModel>
      TypeAheadModel selectedLocation) async {
    isLoading = true;
    hasLoadMore = true;
    var communitiesIDs = communityIDAndModelMap.keys.toList();
    RequestParamModel requestBody = RequestParamModel(
        includeMPC: true,
        communityIds: communitiesIDs,
        marketId: selectedLocation.MarketId,
        paging: Paging(
            page: page++,
            pageSize: pageSize,
            sortBy: "Random",
            sortSecondBy: "None"));

    var homeResult = await HomeSearchRepository().fetchHomeList(requestBody);
    isLoading = false;
    showShimmer = false;
    var list = homeResult.homeModel;

    communityIDAndModelMap.forEach((id, communityModel) {
      List<HomeModel> homeList = List.empty(growable: true);
      groupedHomeMap[id] = GroupedHomeModel(
          communityModel.brandLogoMedium, communityModel.name ?? "", homeList);
    });

    list?.forEach((home) {
      groupedHomeMap[home.bdxCommunityId]?.homeModelList.add(home);
    });

    return groupedHomeMap;
  }

  Future<Map<int, GroupedHomeModel>> loadMore(
      Map<int, CommunityModel> communityIDAndModelMap,
      TypeAheadModel selectedLocation) async {
    return await getHomes(communityIDAndModelMap, selectedLocation);
  }
}
