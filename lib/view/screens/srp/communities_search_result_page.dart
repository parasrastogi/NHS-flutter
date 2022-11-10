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

class SearchCommunityResultPage extends StatefulWidget {
  final TypeAheadModel selectedLocation;
  final CommunitySearchResultViewModel viewModel;
  SearchCommunityResultPage(
      {required Key key,
      required this.selectedLocation,
      required this.viewModel})
      : super(key: key);

  @override
  SearchCommunityResultPageState createState() =>
      SearchCommunityResultPageState();
}

class SearchCommunityResultPageState extends State<SearchCommunityResultPage>
    with AutomaticKeepAliveClientMixin<SearchCommunityResultPage> {
  late ScrollController _scrollController;

  var keyboardVisibilityController = KeyboardVisibilityController();

  @override
  void initState() {
    print("inti called");
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    // viewModel = CommunitySearchResultViewModel();
    //getData(widget.selectedLocation);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(SearchCommunityResultPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void getData(TypeAheadModel typeAheadModel) async {
    print("get data called---> ${typeAheadModel.Name}");
    widget.viewModel.communityList.clear();
    widget.viewModel.page = 1;
    setState(() {
      widget.viewModel.showShimmer = true;
    });

    if (!widget.viewModel.isLoading) {
      var result = await widget.viewModel.getData(typeAheadModel);
      setState(() {
        if (result.isEmpty || result.length == widget.viewModel.totalCount) {
          widget.viewModel.hasLoadMore = false;
        }
        //viewModel.isLoading = false;
        widget.viewModel.showShimmer = false;
      });
    }
  }

  void _scrollListener() {
    loadMore();
  }

  Future<List<CommunityModel>> loadMore() async {
    if (!widget.viewModel.isLoading) {
      if (_scrollController.position.extentAfter < 150) {
        var moreItems =
            await widget.viewModel.loadMore(widget.selectedLocation);
        setState(() {
          if (moreItems.isEmpty ||
              widget.viewModel.communityList.length ==
                  widget.viewModel.totalCount) {
            widget.viewModel.hasLoadMore = false;
          }
          widget.viewModel.isLoading = false;
        });
      }
      return widget.viewModel.communityList;
    }
    return widget.viewModel.communityList;
  }

  void update(List<CommunityModel> result) {
    if (!widget.viewModel.isLoading) {
      setState(() {
        if (result.isEmpty || result.length == widget.viewModel.totalCount) {
          widget.viewModel.hasLoadMore = false;
        }
        //viewModel.isLoading = false;
        widget.viewModel.showShimmer = false;
      });
    }
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
            key: ObjectKey(widget.viewModel.showShimmer
                ? buildShimmer()
                : widget.viewModel.communityList.length > 0
                    ? widget.viewModel.communityList[0]
                    : CommunityModel.createEmptyModel()),
            itemCount: widget.viewModel.showShimmer
                ? 5
                : (widget.viewModel.hasLoadMore
                    ? widget.viewModel.communityList.length + 1
                    : widget.viewModel.communityList.length),
            controller: _scrollController,
            cacheExtent: 9999,
            itemBuilder: (context, index) {
              print(index);
              if (!widget.viewModel.showShimmer &&
                  widget.viewModel.hasLoadMore &&
                  index >= widget.viewModel.communityList.length) {
                return Padding(
                  padding: EdgeInsets.all(5),
                  child: const Center(child: CupertinoActivityIndicator()),
                );
              } else {
                if (widget.viewModel.showShimmer) {
                  return buildShimmer();
                } else {
                  return CommunityTile(
                      commNameTextStyle: titleTextStyle,
                      textStyle: subtitleTextStyle,
                      community: widget.viewModel.communityList[index]);
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
