import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newhomesource/data/model/home_search/grouped_home_model.dart';
import 'package:newhomesource/data/model/type_ahead/type_ahead_model.dart';
import 'package:newhomesource/view/widgets/grouped_home_tile.dart';
import 'package:newhomesource/view/widgets/shimmer_widget.dart';
import 'package:newhomesource/viewmodel/communitites_search_view_model.dart';
import 'package:newhomesource/viewmodel/home_search_viewmodel.dart';

class HomeSearchResultPage extends StatefulWidget {
  final TypeAheadModel selectedLocation;
  final HomeSearchViewModel viewModel;
  final CommunitySearchResultViewModel communityViewModel;
  const HomeSearchResultPage(
      {required Key key,
      required this.selectedLocation,
      required this.viewModel,
      required this.communityViewModel})
      : super(key: key);

  @override
  HomeSearchResultPageState createState() => HomeSearchResultPageState();
}

class HomeSearchResultPageState extends State<HomeSearchResultPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  void _scrollListener() {
    loadMore();
  }

  Future<Map<int, GroupedHomeModel>> loadMore() async {
    if (!widget.viewModel.isLoading && !widget.communityViewModel.isLoading) {
      if (_scrollController.position.extentAfter < 150) {
        var result =
            await widget.communityViewModel.getData(widget.selectedLocation);
        var moreItems = await widget.viewModel.loadMore(
            widget.communityViewModel.commIDAndModelMap,
            widget.selectedLocation);
        setState(() {
          if (moreItems.isEmpty ||
              widget.viewModel.groupedHomeMap.length ==
                  widget.viewModel.totalCount) {
            widget.viewModel.hasLoadMore = false;
          }
          widget.viewModel.isLoading = false;
        });
      }
      return widget.viewModel.groupedHomeMap;
    }
    return widget.viewModel.groupedHomeMap;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.viewModel.showShimmer
            ? 5
            : (widget.viewModel.hasLoadMore
                ? widget.viewModel.groupedHomeMap.length + 1
                : widget.viewModel.groupedHomeMap.length),
        controller: _scrollController,
        itemBuilder: (context, index) {
          print(index);
          if (!widget.viewModel.showShimmer &&
              widget.viewModel.hasLoadMore &&
              index >= widget.viewModel.groupedHomeMap.length) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: const Center(child: CupertinoActivityIndicator()),
            );
          } else {
            if (widget.viewModel.showShimmer) {
              return buildShimmer();
            } else {
              return GroupedHomeTile(
                  widget.viewModel.groupedHomeMap.values.toList()[index]);
            }
          }
        });
  }

  void update(Map<int, GroupedHomeModel> result) {
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
}
