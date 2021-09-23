import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:newhomesource/data/model/services/type_ahead_service.dart';
import 'package:newhomesource/data/model/type_ahead/type_ahead_model.dart';
import 'package:newhomesource/utilities/colors.dart';
import 'package:newhomesource/view/screens/srp/srp_container_page.dart';
import '../../widgets/search_result_item.dart';
import '../srp/communities_search_result_page.dart';
import '../map/map_screen.dart';

class SearchPage extends StatefulWidget {
  // final Function(bool) backButtonCallback;
  // // bool isHidden;
  // SearchPage({required this.backButtonCallback});
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late FocusNode myFocusNode;
  late FocusNode searchFocusNode;
  bool isPrevious = false;
  final TextEditingController _typeAheadController = TextEditingController();
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    debugPrint("Focus: " + myFocusNode.hasFocus.toString());

    setState(() {
      isPrevious = searchFocusNode.hasFocus;
    });
    // shouldShowAppbar(myFocusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    myFocusNode.addListener(_onFocusChanged);
    searchFocusNode.addListener(_onFocusChanged);
    return NewWidget(myFocusNode: myFocusNode);
    // return SizedBox(
    //     height: MediaQuery.of(context).size.height,
    //     child: NewWidget(myFocusNode: myFocusNode));

    //  childWidget(myFocusNode: myFocusNode),
    //   ),
    // );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.myFocusNode,
  }) : super(key: key);

  final FocusNode myFocusNode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // hide back button
          centerTitle: true,
          title: SizedBox(
            child: Image.asset(
              'assets/images/logo.png',
              width: 150,
            ),
          ),
        ),
        body: ChildWidget(myFocusNode: myFocusNode),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  ChildWidget({
    Key? key,
    required this.myFocusNode,
  }) : super(key: key);

  final FocusNode myFocusNode;
  //ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress)
          return false;
        else
          return true;
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/search_bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height / 2.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Find Your New Home',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Text(
                    'Search the largest collection of new homes,'
                    ' community developments, and home builders.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TypeAheadField<TypeAheadModel>(
                      suggestionsBoxVerticalOffset: 0,
                      hideSuggestionsOnKeyboardHide: false,
                      hideOnLoading: true,
                      hideOnEmpty: true,
                      textFieldConfiguration: TextFieldConfiguration(
                        //controller: _typeAheadController,
                        textInputAction: TextInputAction.next,
                        autofocus: false,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 8),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Colors.white,
                            hintText:
                                'City, Zip, Market Area or Community Name',
                            hintMaxLines: 1,
                            hintStyle: TextStyle(fontSize: 13)),
                      ),
                      suggestionsBoxDecoration: SuggestionsBoxDecoration(
                          constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * .30)),
                      suggestionsCallback: (text) async {
                        return await TypeAheadService.getTypeHeadResult(text);
                      },
                      itemBuilder: (context, suggestion) {
                        return SearchResultItem(
                          suggestion: (suggestion).Name,
                          onCancelItem: () {
                            print('clicked');
                          },
                        );
                      },
                      onSuggestionSelected: (suggestion) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                // CommunitiesSearchResultPage(suggestion),
                                SRPContainerPage(typeAheadModel: suggestion),
                          ),
                        );
                      },
                      transitionBuilder: (context, suggestionsBox, controller) {
                        return suggestionsBox;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'OR',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MapScreen();
                      }));
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18))),
                      backgroundColor:
                          MaterialStateProperty.all(kButtonBlueColor),
                    ),
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Map Search',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Search exact address | User current location | Adjust radius',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Do you have a community code?',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 45,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              // controller: _scrollController,
                              focusNode: myFocusNode,
                              keyboardType: TextInputType.number,
                              onTap: () {
                                print("tapped");
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                hintText: 'Enter Community code',
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            decoration: BoxDecoration(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 50,
                            width: 90,
                            child: TextButton(
                              onPressed: () {
                                // FocusManager.instance.primaryFocus!.unfocus();
                                FocusScope.of(context).unfocus();
                              },
                              child: Text(
                                'Submit',
                                style: TextStyle(color: kGrayColor),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    //side: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(kYellow),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextButton.icon(
                        style: ButtonStyle(
                            // padding: MaterialStateProperty.all(
                            //     EdgeInsets.symmetric(vertical: 10)),
                            fixedSize:
                                MaterialStateProperty.all(Size.fromHeight(40)),
                            backgroundColor:
                                MaterialStateProperty.all(kYellow)),
                        onPressed: () {},
                        icon: Icon(
                          Icons.qr_code,
                          color: kGrayColor,
                        ),
                        label: Text(
                          'Scan community QR code',
                          style: TextStyle(
                            color: kGrayColor,
                          ),
                        ))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
