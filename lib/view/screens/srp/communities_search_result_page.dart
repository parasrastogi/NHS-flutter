import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:newhomesource/data/model/community_search/community_model.dart';
import 'package:newhomesource/data/model/type_ahead/type_ahead_model.dart';
import 'package:newhomesource/utilities/colors.dart';
import 'package:newhomesource/utilities/style.dart';
import 'package:newhomesource/view/widgets/shimmer_widget.dart';
import 'package:newhomesource/viewmodel/communitites_search_view_model.dart';
import '../../widgets/community_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SearchResultPage extends StatefulWidget {
  final TypeAheadModel selectedLocation;
  SearchResultPage({required Key key, required this.selectedLocation})
      : super(key: key);

  @override
  SearchResultPageState createState() => SearchResultPageState();
}

class SearchResultPageState extends State<SearchResultPage>
    with AutomaticKeepAliveClientMixin<SearchResultPage> {
  late ScrollController _scrollController;
  late CommunitySearchResultViewModel viewModel;
  var keyboardVisibilityController = KeyboardVisibilityController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    viewModel = CommunitySearchResultViewModel();
    getData(widget.selectedLocation);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(SearchResultPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void getData(TypeAheadModel typeAheadModel) async {
    print("get data called---> ${typeAheadModel.Name}");
    viewModel.communityList.clear();
    viewModel.page = 1;
    setState(() {
      viewModel.showShimmer = true;
    });

    if (!viewModel.isLoading) {
      var result = await viewModel.getData(typeAheadModel);
      setState(() {
        if (result.isEmpty || result.length == viewModel.totalCount) {
          viewModel.hasLoadMore = false;
        }
        //viewModel.isLoading = false;
        viewModel.showShimmer = false;
      });
    }
  }

  void _scrollListener() {
    loadMore();
  }

  Future<List<CommunityModel>> loadMore() async {
    if (!viewModel.isLoading) {
      if (_scrollController.position.extentAfter < 150) {
        var moreItems = await viewModel.loadMore(widget.selectedLocation);
        setState(() {
          if (moreItems.isEmpty ||
              viewModel.communityList.length == viewModel.totalCount) {
            viewModel.hasLoadMore = false;
          }
          viewModel.isLoading = false;
        });
      }
      return viewModel.communityList;
    }
    return viewModel.communityList;
  }

  final brandId = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress)
          return false;
        else
          return true;
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Container(
          child: ListView.builder(
            key: ObjectKey(viewModel.showShimmer
                ? buildShimmer()
                : viewModel.communityList[0]),
            itemCount: viewModel.showShimmer
                ? 5
                : (viewModel.hasLoadMore
                    ? viewModel.communityList.length + 1
                    : viewModel.communityList.length),
            controller: _scrollController,
            cacheExtent: 9999,
            itemBuilder: (context, index) {
              print(index);
              if (!viewModel.showShimmer &&
                  viewModel.hasLoadMore &&
                  index >= viewModel.communityList.length) {
                return Padding(
                  padding: EdgeInsets.all(5),
                  child: const Center(child: CupertinoActivityIndicator()),
                );
              } else {
                if (viewModel.showShimmer) {
                  return buildShimmer();
                } else {
                  return CommunityTile(
                      commNameTextStyle: titleTextStyle,
                      textStyle: subtitleTextStyle,
                      community: viewModel.communityList[index]);
                }
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildShimmer() => Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Row(
          children: [
            ShimmerWidget.rectangular(
              height: double.infinity,
              width: MediaQuery.of(context).size.width * .45,
            ),
            Flexible(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerWidget.rectangular(height: 10),
                      SizedBox(
                        height: 10,
                      ),
                      ShimmerWidget.rectangular(
                        height: 8,
                        width: MediaQuery.of(context).size.width * .30,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      ShimmerWidget.rectangular(
                        height: 8,
                        width: MediaQuery.of(context).size.width * .20,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );

  @override
  bool get wantKeepAlive => true;
}
