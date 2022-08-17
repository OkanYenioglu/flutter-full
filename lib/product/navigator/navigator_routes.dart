import '../../303/lottie_learn.dart';
import '../../303/navigator/navigate_home_detail_view.dart';
import '../../303/navigator/navigate_home_view.dart';

class NavigatorRoutes {
  static const paraph = "/";
  final items = {
    paraph: (context) => const LottieLearn(),
    NavigateRoutes.home.withParaf: (context) => NavigateHomeView(),
    NavigateRoutes.detail.withParaf: (context) => NavigateHomeDetail(),
  };
}

enum NavigateRoutes { init, home, detail }

extension NavigateRoutesExtension on NavigateRoutes {
  String get withParaf => "/$name";
}
