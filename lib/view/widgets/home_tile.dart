import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newhomesource/utilities/colors.dart';
import 'package:newhomesource/data/model/home_search/home_model.dart';
import 'package:newhomesource/utilities/utils.dart';

class HomeTile extends StatefulWidget {
  HomeModel _homeModel;

  HomeTile(this._homeModel, {Key? key}) : super(key: key);

  @override
  _HomeTileState createState() => _HomeTileState();
}

class _HomeTileState extends State<HomeTile> {
  final gradientColors = [
    Color.fromRGBO(1, 1, 1, 0),
    Color.fromRGBO(0, 0, 0, 0.4)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 6, 8, 8),
      width: 280,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
              child: widget._homeModel.planImage != null
                  ? CachedNetworkImage(
                      imageUrl: widget._homeModel.planImage!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: Image.asset('assets/images/placeholder.png',
                            height: double.infinity,
                            width: MediaQuery.of(context).size.width * .45,
                            fit: BoxFit.cover),
                      ),
                      errorWidget: (context, url, error) => Stack(
                        children: [
                          Image.asset(
                            'assets/images/no_photo.png',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    )
                  : Stack(
                      children: [
                        Image.asset(
                          'assets/images/no_photo.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    widget._homeModel.name,
                    style: TextStyle(color: kButtonBlueColor, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  'From ${Utils.currencyFormatter.format(widget._homeModel.basePrice)}',
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6, bottom: 6, right: 6),
            child: Text(
              widget._homeModel.homeSpec,
              style: TextStyle(fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}
