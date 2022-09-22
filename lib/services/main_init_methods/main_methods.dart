import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:watch_it_later/services/main_init_methods/extensions/hive_init_boxes_extension.dart';

import '../../model/newItemNotificationModel.dart';

typedef InitFuture = Future<void> Function();

class MainMethodsService {
  Future<void> _init() async {
    //
    WidgetsFlutterBinding.ensureInitialized();

    // init hive
    await Hive.initFlutter();
    await initHiveBoxes(shouldClearBoxesOnAppRestart: kDebugMode);

    // register model generated with hive generator to open in when the get username page is opened
    Hive.registerAdapter<NewItemNotifcationModel>(
        NewItemNotifcationModelAdapter());
  }



  /// init all needed methods
  InitFuture get init => _init;
}
