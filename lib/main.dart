import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:womenwings/provider.dart';
import 'package:womenwings/routes.dart';
import 'package:womenwings/splashscreen.dart';
import 'package:womenwings/subcategories.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) async {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => CategoryCubit()), // Provide the CategoryCubit
        BlocProvider(
            create: (context) =>
                SubcategoryCubit()), // Provide the SubcategoryCubit
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WOMEN WINGS',
        initialRoute: MyRoutes.splashRoute,
        routes: {
          MyRoutes.splashRoute: (context) => const splashscreen(),
        },
      ),
    );
  }
}
