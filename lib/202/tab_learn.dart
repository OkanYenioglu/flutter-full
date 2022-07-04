import 'package:flutter/material.dart';
import 'package:flutter_full/101/icon_learn.dart';
import 'package:flutter_full/101/image_learn.dart';
import 'package:flutter_full/101/padding_learn.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({Key? key}) : super(key: key);

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchValue = 10;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        extendBody: true,
        floatingActionButton: FloatingActionButton(onPressed: () {
          _tabController.animateTo(_MyTabViews.home.index);
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: _notchValue,
          child: _MyTabBar(),
        ),
        appBar: AppBar(),
        body: _MyTabView(),
      ),
    );
  }

  TabBar _MyTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: _MyTabViews.values.map((e) => Tab(text: '${e.name}')).toList(),
    );
  }

  TabBarView _MyTabView() {
    return TabBarView(
        controller: _tabController,
        children: [const ImageLearn(), IconLearnView(), const ImageLearn(), IconLearnView()]);
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewExtansion on _MyTabViews {}
