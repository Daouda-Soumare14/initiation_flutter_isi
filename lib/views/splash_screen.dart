import 'package:flutter/material.dart';
import 'package:initiation_flutter/common/constants_assets.dart';
import 'package:initiation_flutter/common/constants_color.dart';
import 'package:initiation_flutter/common/size_config.dart';
import 'package:initiation_flutter/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    _rotationAnimate =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);

    _startAnimation();
  }

  void _startAnimation() {
    // permet de demarrer notre animation
    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // _animationController.reset();
        // _animationController.repeat();

        // si la navigation termine a le redirige vers la page home
        Navigator.pushReplacementNamed(context, NavigationRoutes.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        backgroundColor: kWhiteColor,
        body: Center(
          child: SizedBox(
            width: SizeConfig.orientation == Orientation.portrait
                ? SizeConfig.getProportionateScreenWidth(300)
                : SizeConfig.getProportionateScreenWidth(300),
            child: AnimatedBuilder(
                animation: _rotationAnimate,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotationAnimate.value * 6.283,
                    child: Image.asset(
                      kAppLogo,
                      fit: BoxFit.contain,
                    ),
                  );
                }),
          ),
        ));
  }
}
