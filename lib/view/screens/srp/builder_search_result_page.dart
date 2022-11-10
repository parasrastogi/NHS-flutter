import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newhomesource/data/model/builder_search/brand_model.dart';
import 'package:newhomesource/data/model/type_ahead/type_ahead_model.dart';
import 'package:newhomesource/utilities/colors.dart';
import 'package:newhomesource/view/widgets/shimmer_widget.dart';
import 'package:newhomesource/viewmodel/builder_search_viewmodel.dart';

class BuilderSearchResultPage extends StatefulWidget {
  final TypeAheadModel typeAheadModel;
  final BuilderSearchViewModel viewModel;
  BuilderSearchResultPage(
      {required Key key, required this.typeAheadModel, required this.viewModel})
      : super(key: key);

  @override
  BuilderSearchResultPageState createState() {
    return BuilderSearchResultPageState();
  }
}

class BuilderSearchResultPageState extends State<BuilderSearchResultPage>
    with AutomaticKeepAliveClientMixin<BuilderSearchResultPage> {
  @override
  void initState() {
    super.initState();
    //getBuilderList(widget.typeAheadModel);
  }

  @override
  void didUpdateWidget(BuilderSearchResultPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void getBuilderList(TypeAheadModel typeAheadModel) async {
    widget.viewModel.brandList.clear();
    widget.viewModel.showShimmer = true;
    setState(() {
      widget.viewModel.aspectRatio = 6 / 4;
    });
    var builderList = await widget.viewModel.getBuilderList(typeAheadModel);
    setState(() {
      widget.viewModel.brandList = builderList;
      widget.viewModel.aspectRatio = 9 / 7;
    });
  }

  void update(List<BrandModel> result) {
    if (!widget.viewModel.isLoading) {
      setState(() {
        widget.viewModel.showShimmer = false;
        widget.viewModel.aspectRatio = 9 / 7;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: widget.viewModel.aspectRatio,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 40),
      crossAxisCount: 3,
      mainAxisSpacing: 6,
      crossAxisSpacing: 10,
      children: List.generate(
          widget.viewModel.showShimmer ? 5 : widget.viewModel.brandList.length,
          (index) {
        if (widget.viewModel.showShimmer) {
          return Container(
            child: buildBuilderShimmer(),
          );
        } else {
          var builder = widget.viewModel.brandList[index];
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
