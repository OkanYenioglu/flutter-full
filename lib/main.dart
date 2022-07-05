import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full/101/app_bar_learn.dart';
import 'package:flutter_full/101/button_learn.dart';
import 'package:flutter_full/101/card_learn.dart';
import 'package:flutter_full/101/column_row.dart';
import 'package:flutter_full/101/custom_widget_learn.dart';
import 'package:flutter_full/101/icon_learn.dart';
import 'package:flutter_full/101/image_learn.dart';
import 'package:flutter_full/101/indicator_widget_learn.dart';
import 'package:flutter_full/101/list_tile_learn.dart';
import 'package:flutter_full/101/list_view_builder_learn.dart';
import 'package:flutter_full/101/list_view_learn.dart';
import 'package:flutter_full/101/navigation_learn.dart';
import 'package:flutter_full/101/padding_learn.dart';
import 'package:flutter_full/101/page_view_learn.dart';
import 'package:flutter_full/101/stack_learn.dart';
import 'package:flutter_full/101/statefull_learn.dart';
import 'package:flutter_full/101/statefull_life_cycle.dart';
import 'package:flutter_full/101/stateless_learn.dart';
import 'package:flutter_full/101/text_field_learn.dart';
import 'package:flutter_full/101/text_learn.dart';
import 'package:flutter_full/202/cache/shared_learn_cache.dart';
import 'package:flutter_full/202/cache/shared_list_cache.dart';
import 'package:flutter_full/202/model_learn_view.dart';
import 'package:flutter_full/202/package_learn_view.dart';
import 'package:flutter_full/202/services/service_learn_get_view.dart';
import 'package:flutter_full/202/services/service_post_learn_view.dart';
import 'package:flutter_full/202/tab_learn.dart';
import 'package:flutter_full/202/theme/light_theme.dart';
import 'package:flutter_full/202/theme_learn_view.dart';
import 'package:flutter_full/demos/color_demos_view.dart';
import 'package:flutter_full/demos/colors_life_cycle.dart';
import 'package:flutter_full/demos/my_collections_demo.dart';
import 'package:flutter_full/demos/note_demos.dart';
import 'package:flutter_full/demos/stack_demo_view.dart';
import 'package:flutter_full/product/global/resource_context.dart';
import 'package:flutter_full/product/global/theme_notifier.dart';
import 'package:provider/provider.dart';

import '202/alert_learn.dart';
import '202/animated_learn.dart';
import '202/cache/secure_context/secure_context_learn.dart';
import '202/form_learn_view.dart';
import '202/image_learn_202.dart';
import '202/oop_learn_view.dart';
import '202/sheet_learn.dart';
import '202/state_manage/state_manage_learn.dart';
import '303/callback_learn.dart';
import '303/feed_view.dart';
import '303/part/part_of_learn.dart';
import '303/reqrest_resource/view/reqres_view.dart';
import '303/tabbar_advance.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: ((_) => ResourceContext())),
      ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier()),
    ],
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<ThemeNotifier>().currentTheme,

      // ThemeData.dark().copyWith(
      //   bottomAppBarTheme: const BottomAppBarTheme(
      //     shape: CircularNotchedRectangle(),
      //   ),
      //   tabBarTheme: const TabBarTheme(
      //     labelColor: Colors.white,
      //     unselectedLabelColor: Colors.red,
      //     indicatorSize: TabBarIndicatorSize.label,
      //   ),
      //   listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
      //   textSelectionTheme: const TextSelectionThemeData(
      //     selectionColor: Colors.red,
      //     cursorColor: Colors.green,
      //   ),
      //   inputDecorationTheme: const InputDecorationTheme(
      //     filled: true,
      //     fillColor: Colors.white,
      //     iconColor: Colors.red,
      //     labelStyle: TextStyle(color: Colors.lime),
      //     border: OutlineInputBorder(),
      //     floatingLabelStyle: TextStyle(
      //       color: Colors.red,
      //       fontSize: 24,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
      //   textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.red)),
      //   appBarTheme: const AppBarTheme(
      //       centerTitle: true,
      //       systemOverlayStyle: SystemUiOverlayStyle.light,
      //       backgroundColor: Colors.transparent,
      //       elevation: 0),
      // ),
      home: ReqresView(),
    );
  }
}
