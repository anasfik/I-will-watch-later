import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:watch_it_later/model/newItemNotificationModel.dart';
import '../helpers__controllers/dialogs__controller.dart';

class FavoritesController extends GetxController
    with GetTickerProviderStateMixin {


  // Dependencies injection
  DialogsController dialogsController = Get.put(DialogsController());

  // Favorite icon animation
  late AnimationController favIconController;
  late Animation scale;

  // Initializing the fav. list always to get it from the box by filtering it with where method, in first start of the app it will be just empty list so there is no need to null check for it
  /// ignore_if_you_know_where_method_very_well: the where return is iterable, so toList() make it list

  // Add a notification card to favoritesItemsNotificationList
  void addToFavorites(int passedIndex) {
    // notice the re-init of box
    Box<NewItemNotifcationModel> newNotificationsBox =
        Hive.box<NewItemNotifcationModel>("newNotificationsBox");

    // for better understanding see this as, currentNotification that it change with the passedIndex from widget
    NewItemNotifcationModel? currentNotification =
        newNotificationsBox.getAt(passedIndex);

    // toggle the isFavorite bool (this change it in the context of the app only)
    currentNotification!.isFavorite = !currentNotification.isFavorite!;

    // after the toggle we need to put it in the context of the box so it change in the db also so if we kill the app it still in the box
    // putAt method is like it update the box NewItemNotifcationModel
    newNotificationsBox.putAt(passedIndex, currentNotification);
  }

  animate(bool isChecked) {
    // card icon animation
    isChecked == true
        ? favIconController.forward()
        : favIconController.reverse();
  }

  @override
  void onInit() {
    
    favIconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 40),
    );

    scale = Tween(begin: 1.0, end: 1.2).animate(favIconController);
    favIconController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        favIconController.reverse();
      }
    });

    super.onInit();
  }

  // To-do: handle exceptions
}
