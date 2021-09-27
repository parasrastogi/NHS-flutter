import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newhomesource/data/model/type_ahead/type_ahead_model.dart';
import 'package:newhomesource/utilities/colors.dart';
import 'package:newhomesource/view/widgets/shimmer_widget.dart';
import 'package:newhomesource/viewmodel/builder_search_viewmodel.dart';

class BuilderSearchResultPage extends StatefulWidget {
  final TypeAheadModel typeAheadModel;

  BuilderSearchResultPage({required Key key, required this.typeAheadModel})
      : super(key: key);

  @override
  BuilderSearchResultPageState createState() {
    return BuilderSearchResultPageState();
  }
}

class BuilderSearchResultPageState extends State<BuilderSearchResultPage>
    with AutomaticKeepAliveClientMixin<BuilderSearchResultPage> {
  late BuilderSearchViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = BuilderSearchViewModel();
    getBuilderList(widget.typeAheadModel);
  }

  @override
  void didUpdateWidget(BuilderSearchResultPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void getBuilderList(TypeAheadModel typeAheadModel) async {
    _viewModel.brandList.clear();
    _viewModel.showShimmer = true;
    setState(() {
      _viewModel.aspectRatio = 6 / 4;
    });
    var builderList = await _viewModel.getBuilderList(
        {"MarketId": typeAheadModel.MarketId, "includeMPC": true});
    setState(() {
      _viewModel.brandList = builderList;
      _viewModel.aspectRatio = 9 / 7;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: _viewModel.aspectRatio,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 40),
      crossAxisCount: 3,
      mainAxisSpacing: 6,
      crossAxisSpacing: 10,
      children: List.generate(
          _viewModel.isLoading ? 5 : _viewModel.brandList.length, (index) {
        if (_viewModel.isLoading) {
          return Container(
            child: buildBuilderShimmer(),
          );
        } else {
          var builder = _viewModel.brandList[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 9 / 5,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: (builder.builderLogo ?? "").contains(".gif")
                      ? Text(
                          builder.name ?? '',
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                        )
                      : CachedNetworkImage(
                          imageUrl: builder.builderLogo ?? "",
                          errorWidget: (context, url, error) =>
                              Text(builder.name ?? ""),
                        ),
                ),
              ),
              Text(
                "${builder.count} communities",
                style:
                    TextStyle(fontSize: 12, backgroundColor: kBackgroundColor),
              )
            ],
          );
        }
      }),
    );
  }

  Widget buildBuilderShimmer() => ShimmerWidget.rectangular(
        height: MediaQuery.of(context).size.width * 30,
      );

  @override
  bool get wantKeepAlive => true;
}
