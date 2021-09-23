import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:newhomesource/data/model/community_search/community_model.dart';
import 'package:newhomesource/utilities/utils.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:ui';

class CommunityTile extends StatelessWidget {
  CommunityTile(
      {Key? key,
      required this.CommNametextStyle,
      required this.textStyle,
      required this.community})
      : super(key: key);

  final TextStyle CommNametextStyle;
  final TextStyle textStyle;
  final CommunityModel community;
  final gradientColors = [
    Color.fromRGBO(1, 1, 1, 0),
    Color.fromRGBO(0, 0, 0, 0.4)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5)),
                child: community.communityImage != null
                    ? CachedNetworkImage(
                        imageUrl: community.communityImage!,
                        height: double.infinity,
                        width: MediaQuery.of(context).size.width * .45,
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
                              height: double.infinity,
                              width: MediaQuery.of(context).size.width * .45,
                              fit: BoxFit.cover,
                            ),
                            GradientContainer(gradientColors: gradientColors),
                          ],
                        ),
                      )
                    : Stack(
                        children: [
                          Image.asset(
                            'assets/images/no_photo.png',
                            height: double.infinity,
                            width: MediaQuery.of(context).size.width * .45,
                            fit: BoxFit.cover,
                          ),
                          GradientContainer(gradientColors: gradientColors),
                        ],
                      ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: community.isMPC
                    ? Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            color: Color(0xffDC79D0).withOpacity(0.8),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        child: Text(
                          'Master Planned\nCommunity',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal),
                        ),
                      )
                    : null,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Visibility(
                        child: ImageIcon(
                          AssetImage('assets/images/ic_camera.png'),
                          color: Colors.white,
                          size: 22,
                        ),
                        visible: community.hasPhotos ? true : false,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Visibility(
                        child: ImageIcon(
                          AssetImage('assets/images/ic_notes.png'),
                          color: Colors.white,
                          size: 22,
                        ),
                        visible: community.hasNotes ? true : false,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 4,
                bottom: 8,
                child: community.brandLogoMedium != null
                    ? FittedBox(
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: community.brandLogoMedium!,
                          width: 69,
                          height: 30,
                          fit: BoxFit.contain,
                          alignment: Alignment.bottomRight,
                        ),
                      )
                    : Image.asset('assets/images/placeholder.png'),
              ),
            ],
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
                    Text(
                      community.name ?? "",
                      style: CommNametextStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        'From ${Utils.currencyFormatter.format(community.minimumPrice)}'
                        ' - ${Utils.currencyFormatter.format(community.maximumPrice)}',
                        style: textStyle,
                      ),
                    ),
                    Text(
                      community.communitySpec,
                      textAlign: TextAlign.start,
                      style: textStyle,
                    ),
                    // Text(
                    //   'From \$399,990 - \$523015',
                    //   style: textStyle,
                    // ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: SizedBox(
                              child: TextButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 20,
                                      color: Color(0xff0079D2),
                                    ),
                                    Flexible(
                                      child: Text(
                                        community.displayLocationAddress,
                                        textAlign: TextAlign.left,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {},
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 6)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            side:
                                                BorderSide(color: Colors.blue),
                                            borderRadius:
                                                BorderRadius.circular(18)))),
                                // backgroundColor:
                                //     MaterialStateProperty.all(Colors.grey)),
                              ),
                              height: 25,
                            ),
                          ),
                          fit: FlexFit.loose,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          padding: EdgeInsets.only(bottom: 6),
                          child: RawMaterialButton(
                            onPressed: () {},
                            fillColor: Colors.grey.shade400,
                            // constraints:
                            //     BoxConstraints.expand(width: 25, height: 25),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 18.0,
                            ),
                            shape: CircleBorder(),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    Key? key,
    required this.gradientColors,
  }) : super(key: key);

  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width * .45,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 1],
              colors: gradientColors)),
    );
  }
}
