import 'package:flutter/material.dart';
import 'package:flutter_full/product/constant/duration_items.dart';
import 'package:flutter_full/product/constant/lottie_item.dart';
import 'package:flutter_full/product/global/theme_notifier.dart';
import 'package:flutter_full/product/navigator/navigator_routes.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

// https://assets6.lottiefiles.com/packages/lf20_ydo1amjm.json
class LottieLearn extends StatefulWidget {
  const LottieLearn({Key? key}) : super(key: key);

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn> with TickerProviderStateMixin {
  late AnimationController lottieController;
  bool isLight = false;

  void _changeLight() {
    isLight = !isLight;
  }

  @override
  void initState() {
    lottieController = AnimationController(vsync: this, duration: DurationItems.durationNormal());
    super.initState();
    navigateToHome();
  }

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushReplacementNamed(NavigateRoutes.home.withParaf);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () async {
                await lottieController.animateTo(isLight ? 0.5 : 0);
                context.read<ThemeNotifier>().changeTheme();
                _changeLight();
              },
              child: Lottie.asset(LottieItems.themeChange.lottiePath, repeat: false, controller: lottieController))
        ],
      ),
      body: const LoadingLottie(),
    );
  }
}

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    Key? key,
  }) : super(key: key);

  final _loadingLottie = 'https://assets6.lottiefiles.com/packages/lf20_ydo1amjm.json';

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(_loadingLottie));
  }
}
