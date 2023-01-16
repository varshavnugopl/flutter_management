import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluuter_mt/helper/base_view_model.dart';
import 'package:fluuter_mt/service/sharedprefs_services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashViewModel extends BaseViewModel {
  Ref ref;
  SplashViewModel(this.ref);
}

final splashViewModelProvider = StateProvider.autoDispose((ref) {
  return SplashViewModel(
    ref,
  );
});
