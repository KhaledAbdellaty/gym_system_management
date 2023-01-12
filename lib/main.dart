import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_managment/core/color.dart';
import 'package:gym_managment/core/object_box.dart';
import 'package:gym_managment/core/router.dart';
import 'package:sizer/sizer.dart';
import 'package:window_size/window_size.dart';

import 'core/theme.dart';

late ObjectBox objectBox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  setWindowTitle('X Large Gym');
  setWindowMinSize(Size(1200, 900));

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('====================Home Screen==================');

    return Sizer(builder: (context, orientation, deviceType) {
      return ScreenUtilInit(
        designSize: const Size(1200, 900),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar', 'AE'),
          ],
        ),
      );
    });
  }
}
