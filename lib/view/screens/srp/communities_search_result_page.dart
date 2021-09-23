import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:newhomesource/data/model/community_search/community_model.dart';
import 'package:newhomesource/data/model/type_ahead/type_ahead_model.dart';
import 'package:newhomesource/utilities/colors.dart';
import 'package:newhomesource/view/widgets/shimmer_widget.dart';
import 'package:newhomesource/viewmodel/communitites_search_view_model.dart';
import '../../widgets/community_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CommunitiesSearchResultPage extends StatefulWidget {
  final TypeAheadModel typeAheadModel;
  CommunitiesSearchResultPage(this.typeAheadModel);
  //final var viewModel =
  static const commNameTextStyle = TextStyle(
      fontSize: 15,
      color: Colors.black54,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none);
  static const textStyle = TextStyle(
      fontSize: 12, color: Colors.black54, decoration: TextDecoration.none);

  @override
  _CommunitiesSearchResultPageState createState() =>
      _CommunitiesSearchResultPageState();
}

class _CommunitiesSearchResultPageState
    extends State<CommunitiesSearchResultPage>
    with AutomaticKeepAliveClientMixin<CommunitiesSearchResultPage> {
  late ScrollController _scrollController;
  late CommunitiesSearchViewModel viewModel;
  late Future<List<CommunityModel>> _future;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    viewModel = CommunitiesSearchViewModel();
    _future = getCommunities();
  }

  @override
  void didUpdateWidget(CommunitiesSearchResultPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    viewModel.communityList.clear();
    viewModel.page = 1;
    viewModel.showShimmer = true;
    getCommunities();
  }

  Future<List<CommunityModel>> getCommunities() async {
    if (!viewModel.isLoading) {
      setState(() {
        viewModel.isLoading = true;
      });
      var comm = await viewModel.getCommunities(widget.typeAheadModel);
      setState(() {
        if (comm.isEmpty || comm.length == viewModel.totalCount) {
          viewModel.hasLoadMore = false;
        }
        viewModel.isLoading = false;
        viewModel.showShimmer = false;
        //viewModel.communityList.addAll(comm);
      });
    }
    return viewModel.communityList;
  }

  void _scrollListener() {
    _future = loadMore();
  }

  Future<List<CommunityModel>> loadMore() async {
    if (!viewModel.isLoading) {
      // print(_scrollController.position.extentAfter);
      if (_scrollController.position.extentAfter < 150) {
        setState(() {
          viewModel.isLoading = true;
        });
        var moreItems = await viewModel.loadMore(widget.typeAheadModel);
        setState(() {
          if (moreItems.isEmpty ||
              viewModel.communityList.length == viewModel.totalCount) {
            viewModel.hasLoadMore = false;
          }
          viewModel.isLoading = false;
          //viewModel.communityList.addAll(moreItems);
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
          //child: FutureBuilder<List<CommunityModel>>(
          //     future: _future, // async work
          //     builder: (BuildContext context,
          //         AsyncSnapshot<List<CommunityModel>> snapshot) {
          //       if (viewModel.communityList.isEmpty) {
          //         return ListView.builder(
          //           itemCount: 5,
          //           itemBuilder: (BuildContext context, int index) {
          //             return buildCommunityShimmer();
          //           },
          //         );
          //       } else {
          //         switch (snapshot.connectionState) {
          //           case ConnectionState.waiting:
          //
          //           default:
          //             if (snapshot.hasError)
          //               return Text('Error: ${snapshot.error}');
          //             else
          //               return ListView.builder(
          //                   itemCount: (viewModel.hasLoadMore
          //                       ? snapshot.data!.length + 1
          //                       : snapshot.data!.length),
          //                   controller: _scrollController,
          //                   cacheExtent: 9999,
          //                   itemBuilder: (context, index) {
          //                     print(index);
          //                     if (viewModel.hasLoadMore &&
          //                         index >= snapshot.data!.length) {
          //                       return Padding(
          //                         padding: EdgeInsets.all(5),
          //                         child: const Center(
          //                             child: CupertinoActivityIndicator()),
          //                       );
          //                     } else {
          //                       return CommunityTile(
          //                           CommNametextStyle:
          //                               CommunitiesSearchResultPage
          //                                   .commNameTextStyle,
          //                           textStyle:
          //                               CommunitiesSearchResultPage.textStyle,
          //                           community: snapshot.data![index]);
          //                     }
          //                   });
          //         }
          //       }
          //     })

          child: ListView.builder(
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
                  return buildCommunityShimmer();
                } else {
                  return CommunityTile(
                      CommNametextStyle:
                          CommunitiesSearchResultPage.commNameTextStyle,
                      textStyle: CommunitiesSearchResultPage.textStyle,
                      community: viewModel.communityList[index]);
                }
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildCommunityShimmer() => Container(
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

enum ResponseModelType { Market, Community, City, Zip, Developer, None }

class SortViewModel {
  late String title;
  late SortBy sort;
  late bool sortOrder;
}

enum SortBy {
  bydefault,
  matchingHomes,
  city,
  price,
  builder,
  community,
}

extension SortByExtension on SortBy {
  String get sort {
    switch (this) {
      case SortBy.bydefault:
        return "Random";
      case SortBy.matchingHomes:
        return "NumHomes";
      case SortBy.city:
        return "City";
      case SortBy.price:
        return "Price";
      case SortBy.builder:
        return "Brand";
      case SortBy.community:
        return "Comm";
    }
  }
}

enum SortModel {
  sortBy,
  sortSecondBy,
  sortFirstBy,
  SortOrder,
  SortSecondOrder,
}
