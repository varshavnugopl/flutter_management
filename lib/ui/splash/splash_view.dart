import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluuter_mt/ui/auth/auth_view.dart';
import 'package:fluuter_mt/service/sharedprefs_services.dart';
import 'package:fluuter_mt/ui/home/home_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp)async {
     await checkUserLogin();
    });
    super.initState();
  }

  Future<void> checkUserLogin() async {
   await Future.delayed(Duration(seconds: 2));
    //checking user authentication from shared preference
    bool isUserAuthenticated =
        await SharedPrefsService().read(SharedPrefsService.IS_AUTH) ?? false;
        log("::::::::: login $isUserAuthenticated");
    if (isUserAuthenticated) {
      //if user authenticate then move to 
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeView(),
          ),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => AuthView(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            CircularProgressIndicator(color: Color.fromARGB(185, 94, 0, 170)),
      ),
    );
  }
}
