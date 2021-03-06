import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:newhomesource/data/model/services/type_ahead_service.dart';
import 'package:newhomesource/data/model/type_ahead/type_ahead_model.dart';
import 'package:newhomesource/utilities/colors.dart';
import 'package:newhomesource/view/screens/appBar/basic_appBar.dart';
import 'package:newhomesource/view/widgets/search_result_item.dart';
import 'builder_search_result_page.dart';
import 'communities_search_result_page.dart';

class SRPContainerPage extends StatefulWidget {
  late TypeAheadModel selectedLocation;
  SRPContainerPage({Key? key, required this.selectedLocation})
      : super(key: key);

  @override
  _SRPContainerPageState createState() => _SRPContainerPageState();
}

class _SRPContainerPageState extends State<SRPContainerPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<SearchResultPageState> _communityStateKey =
      GlobalKey<SearchResultPageState>();
  final GlobalKey<BuilderSearchResultPageState> _builderStateKey =
      GlobalKey<BuilderSearchResultPageState>();
  late TabController _tabController;
  final gradientColors = [const Color(0xFF0d50d6), const Color(0xFF168cd7)];
  final TextEditingController _typeAheadController = TextEditingController();
  var selectedLocation;
  @override
  void initState() {
    selectedLocation = widget.selectedLocation.Name;
    var keyboardVisibilityController = KeyboardVisibilityController();

    // Subscribe
    keyboardVisibilityController.onChange.listen((bool visible) {
      print('Keyboard visibility: ${keyboardVisibilityController.isVisible}');
      if (!visible) {
        _typeAheadController.text = selectedLocation;
      }
    });
    _tabController = TabController(length: 3, vsync: this);
    _typeAheadController.text = selectedLocation;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return true;
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: BasicAppBar.getAppBar(title: 'Search'),
        body: Stack(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: gradientColors),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 8, left: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                        TypeAheadField<TypeAheadModel>(
                          suggestionsBoxVerticalOffset: 0,
                          hideSuggestionsOnKeyboardHide: false,
                          hideOnLoading: true,
                          hideOnEmpty: true,
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: _typeAheadController,
                            textInputAction: TextInputAction.next,
                            autofocus: false,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                suffixIcon: Visibility(
                                  visible: _typeAheadController.text.isNotEmpty,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.clear,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _typeAheadController.text = "";
                                      });
                                    },
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 8),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide.none),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'City, Zip or Community Name',
                                hintMaxLines: 1,
                                hintStyle: TextStyle(fontSize: 13)),
                          ),
                          suggestionsBoxDecoration: SuggestionsBoxDecoration(
                              constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height *
                                          .30)),
                          suggestionsCallback: (text) async {
                            return await TypeAheadService.getTypeHeadResult(
                                text);
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
                            selectedLocation = suggestion.Name;
                            this._typeAheadController.text = suggestion.Name;

                            _communityStateKey.currentState!
                                .getData(suggestion);
                            _builderStateKey.currentState!
                                .getBuilderList(suggestion);
                          },
                          transitionBuilder:
                              (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/map_pin.png'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 80, 8, 8),
              child: Column(
                children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.yellow,
                      indicatorWeight: 4,
                      labelPadding: EdgeInsets.zero,
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        buildCustomTab(title: 'Home'),
                        buildCustomTab(title: 'Community'),
                        buildCustomTab(title: 'Builder', isLast: true),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  // tab bar view
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Center(
                          child: Text(
                            'Tab1 Page',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SearchResultPage(
                            selectedLocation: widget.selectedLocation,
                            key: _communityStateKey),
                        BuilderSearchResultPage(
                          typeAheadModel: widget.selectedLocation,
                          key: _builderStateKey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Tab buildCustomTab({required String title, bool isLast = false}) {
    return Tab(
      child: Container(
        child: Text(title,
            style: TextStyle(
                color: kTabBarTitleColor, fontWeight: FontWeight.normal)),
        alignment: Alignment.center,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: isLast
                ? Border(right: BorderSide.none)
                : Border(
                    right: BorderSide(color: Colors.grey),
                  )),
      ),
    );
  }
}
