import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:newhomesource/data/model/services/type_ahead_service.dart';
import 'package:newhomesource/data/model/type_ahead/type_ahead_model.dart';
import 'package:newhomesource/view/screens/appBar/basic_appBar.dart';
import 'package:newhomesource/view/widgets/search_result_item.dart';
import 'builder_search_result_page.dart';
import 'communities_search_result_page.dart';

class SRPContainerPage extends StatefulWidget {
  late TypeAheadModel typeAheadModel;
  SRPContainerPage({Key? key, required this.typeAheadModel}) : super(key: key);

  @override
  _SRPContainerPageState createState() => _SRPContainerPageState();
}

class _SRPContainerPageState extends State<SRPContainerPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final gradientColors = [const Color(0xFF0d50d6), const Color(0xFF168cd7)];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tabView2 = CommunitiesSearchResultPage(widget.typeAheadModel);
    var tabView3 = BuilderSearchResultPage(widget.typeAheadModel);
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 8),
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
                      setState(() {
                        widget.typeAheadModel = suggestion;
                      });
                    },
                    transitionBuilder: (context, suggestionsBox, controller) {
                      return suggestionsBox;
                    },
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
                      buildCustomTab('Home'),
                      buildCustomTab('Community'),
                      buildCustomTab('Builder'),
                    ],
                  ),
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
                      tabView2,
                      tabView3,
                      // second tab bar view widget
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Tab buildCustomTab(String name) {
    return Tab(
      child: Container(
        child: Text(name),
        alignment: Alignment.center,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
