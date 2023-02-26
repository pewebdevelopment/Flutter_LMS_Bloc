import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/routes/routes.dart';
import 'package:ulearning/common/style/theme.dart';
import 'package:ulearning/global.dart';

void main() async {
  await Global.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [...AppPages.Blocer(context)],
        child: ScreenUtilInit(
            designSize: Size(375, 812),
            builder: (context, child) => MaterialApp(
              title: 'ulearning',
              theme: AppTheme.light,
              builder: EasyLoading.init(),
              debugShowCheckedModeBanner: false,
              navigatorObservers: [AppPages.observer],
              initialRoute: AppRoutes.INITIAL,
              onGenerateRoute: AppPages.GenerateRouteSettings,
            ))
    );
  }
}

