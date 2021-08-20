import 'package:flutter/material.dart';
import 'package:cgpa_calculator/Constants.dart';
import 'SGPA.dart';
import 'CGPA.dart';

class TabView extends StatefulWidget {
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: AppBar(
            backgroundColor: kBackgroundColor,
            flexibleSpace: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SafeArea(
                  child: Container(
                    child: Image.asset(kCalculatorImage),
                    width: deviceSize.width,
                    height: deviceSize.height * 0.1,
                  ),
                ),
              ],
            ),
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.amber,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey[500],
              tabs: [
                Tab(
                  child: Text(
                    'SGPA',
                    style: kTabBarTextStyle
                  ),
                ),
                Tab(
                  child: Text(
                    'CGPA',
                    style: kTabBarTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            SGPA(),
            CGPA(),
          ],
        ),
      ),
    );
  }
}