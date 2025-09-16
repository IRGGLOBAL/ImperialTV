import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/my_app.dart';
import 'config/firebase/push_notification_service.dart';

final storageBox = GetStorage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  await initializeDateFormatting();
  //await PushNotificationService.initialize();

  runApp(const MyApp());
}