import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newhomesource/data/model/home_search/grouped_home_model.dart';
import 'package:newhomesource/utilities/colors.dart';
import 'package:newhomesource/view/widgets/home_tile.dart';

class GroupedHomeTile extends StatefulWidget {
  GroupedHomeModel _groupedHomeModel;
  GroupedHomeTile(this._groupedHomeModel, {Key? key}) : super(key: key);

  @override
  _GroupedHomeTileState createState() => _GroupedHomeTileState();
}

class _GroupedHomeTileState extends State<GroupedHomeTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 340,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'community',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        widget._groupedHomeModel.communityName,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: kButtonBlueColor,
                        ),
                      ),
                    )
                  ],
                ),
                InkWell(
                    onTap: () {
                      print("brand tapped");
                    },
                    child: FittedBox(
                      child: CachedNetworkImage(
                        placeholder: (context, url) {
                          return Image.asset('assets/images/placeholder.png');
                        },
                        imageUrl: widget._groupedHomeModel.brandURL!,
                        height: 30,
                        width: 80,
                        fit: BoxFit.fill,
                        alignment: Alignment.bottomRight,
                        errorWidget: (context, url, error) => Container(
                          width: 69,
                          height: 30,
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 6, 0),
              child: Text('Home'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget._groupedHomeModel.homeModelList.length,
                itemBuilder: (context, index) {
                  return HomeTile(
                      widget._groupedHomeModel.homeModelList[index]);
                },
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        ));
  }
}
