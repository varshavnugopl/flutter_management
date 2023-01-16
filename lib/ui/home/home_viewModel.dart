import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluuter_mt/helper/base_view_model.dart';
import 'package:fluuter_mt/service/sharedprefs_services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeViewModel extends BaseViewModel {
  Ref ref;
  HomeViewModel(this.ref);


}

final homeViewModelProvider = StateProvider.autoDispose((ref) {
  return HomeViewModel(
    ref,
  );
});
