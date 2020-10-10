import 'package:dar_sudan/config/provider_manager.dart';
import 'package:dar_sudan/config/router_manager.dart';
import 'package:dar_sudan/config/storage_manager.dart';
import 'package:dar_sudan/model/local_view_model.dart';
import 'package:dar_sudan/model/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer2<ThemeModel, LocaleModel>(
        builder: (context, themeModel, localeModel, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeModel.themeData(),
            darkTheme: themeModel.themeData(platformDarkMode: true),
            locale: localeModel.locale,
            onGenerateRoute: Router.generateRoute,
            initialRoute: RouteName.splash,
          );
        },
      ),
    );
  }
}
