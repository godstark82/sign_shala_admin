import 'package:admin_sign_shala/core/constants/routes.dart';
import 'package:admin_sign_shala/features/courses/presentation/pages/add_course.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:admin_sign_shala/depency_container.dart';
import 'package:admin_sign_shala/features/home/presentation/bloc/home_bloc.dart';
import 'package:admin_sign_shala/features/home/presentation/pages/home.dart';
import 'package:admin_sign_shala/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependency();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(create: (context) => HomeBloc(sl(), sl())),
        ],
        child: GetMaterialApp(
            title: 'Admin Sign Shala',
            debugShowCheckedModeBanner: false,
            home: Home(),
            getPages: [
              GetPage(name: Routes.root, page: () => Home()),
              GetPage(name: Routes.addCourse, page: () => AddNewCoursePage())
            ]));
  }
}
