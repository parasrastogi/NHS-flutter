import 'package:newhomesource/data/model/home_search/home_model.dart';

class GroupedHomeModel {
  String? brandURL;
  String communityName;
  List<HomeModel> homeModelList;
  GroupedHomeModel(this.brandURL, this.communityName, this.homeModelList);
}
