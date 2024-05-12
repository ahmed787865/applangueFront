import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/category.dart';
import '../../services/api/api_list.dart';
import '../../services/api/api_service.dart';
import '../../services/storage/storage_service.dart';


class HomeController extends GetxController {

  TextEditingController searchController = TextEditingController();
  var username = StorageService.get().apiUserData?["username"] ?? "";

  final popularCategories = <Category>[].obs;
  final promoImagesUrls = <String>[].obs;
  var sliderCurrentIndex = 0.obs;

  @override
  void onReady() async {
    await getPopularCategories();
    await getPromoImages();
  }

  Future<void> getPopularCategories() async {
    final response = await ApiService.get()
        .getRequest(ApiList.POPULAR_CATEGORIES, isIsolate: false,
            converter: (data) {
      final fetchedCategories = <Category>[];
      for (var value in data) {
        fetchedCategories.add(Category.fromJson(value));
      }
      return fetchedCategories;
    });

    response.fold((l) {
      Get.snackbar("server-error", "Could not fetch categories");
    }, (r) {
      popularCategories.value = r;
    });
  }

  Future<void> getPromoImages() async {
    final response = await ApiService.get().getRequest(ApiList.GET_PROMOTIONS,
        converter: (data) {
      final promoImages = <String>[];
      for (var value in data) {
        promoImages.add(value['image']);
      }
      return promoImages;
    }, isIsolate: false);

    response.fold((l) {
      Get.snackbar("server-err", "Could not fetch promo images");
    }, (r) {
      promoImagesUrls.value = r;
    });
  }

  Future<void> search() async{


  }
}
