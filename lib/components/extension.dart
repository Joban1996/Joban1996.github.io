import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

import '../apis/utils.dart';

extension RoundedHelper on Widget {
  ClipRRect round(double value) => ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(value)),
    child: this,
  );
}

extension CircularHelper on Widget {
  ClipRRect get circular => ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(1000)),
    child: this,
  );
}

extension KeyboardHide on Widget {
  Widget get hideKeyboard => GestureDetector(
    onTap: () {
      Util.hideKeyboard(Get.context!);
    },
    child: this,
  );
}

extension ShimmerView on Widget {
  Shimmer addShimmer(BuildContext context) => Shimmer.fromColors(
    enabled: true,
    baseColor: Theme.of(context).highlightColor.withOpacity(0.1),
    highlightColor: Theme.of(context).highlightColor.withOpacity(0.2),
    child: this,
  );
}

extension OnPressed on Widget {
  Widget ripple(Function onPressed,
      {BorderRadiusGeometry borderRadius =
      const BorderRadius.all(Radius.circular(5))}) =>
      GestureDetector(
        onTap: () {
          onPressed();
        },
        child: this,
      );
}

extension RoundedBorder on Widget {
  Container roundedBorder(double value) => Container(
    decoration: BoxDecoration(
        border: Border.all(width: .5,color: Colors.grey),
        borderRadius: BorderRadius.circular(value)),
    child: this,
  );
}

extension PulltoRefresh on Widget {
  Widget addPullToRefresh({
    required RefreshController refreshController,
    required VoidCallback onRefresh,
    required VoidCallback onLoading,
    required bool enablePullUp,
  }) =>
      SmartRefresher(
        enablePullDown: true,
        enablePullUp: enablePullUp,
        header: const WaterDropHeader(),
        controller: refreshController,
        onRefresh: onRefresh,
        onLoading: onLoading,
        child: this,
      );
}

extension SizeExtension on double {
  double get px => Util.scaleSize(this);
}
