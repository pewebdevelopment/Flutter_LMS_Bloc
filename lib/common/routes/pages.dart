import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/routes/observers.dart';
import 'package:ulearning/common/services/storage.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/application/bloc/application_bloc.dart';
import 'package:ulearning/pages/application/application.dart';
import 'package:ulearning/pages/course/bloc/course_bloc.dart';
import 'package:ulearning/pages/course/contibitor/bloc/contibitor_bloc.dart';
import 'package:ulearning/pages/course/contibitor/contibitor.dart';
import 'package:ulearning/pages/course/course.dart';
import 'package:ulearning/pages/course/course_detail/bloc/course_detail_bloc.dart';
import 'package:ulearning/pages/course/course_detail/course_detail.dart';
import 'package:ulearning/pages/course/lesson/bloc/lesson_bloc.dart';
import 'package:ulearning/pages/course/lesson/lesson.dart';
import 'package:ulearning/pages/frame/forget/bloc/forget_bloc.dart';
import 'package:ulearning/pages/frame/forget/forget.dart';
import 'package:ulearning/pages/frame/register/bloc/register_bloc.dart';
import 'package:ulearning/pages/frame/register/register.dart';
import 'package:ulearning/pages/frame/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning/pages/frame/sign_in/sign_in.dart';
import 'package:ulearning/pages/frame/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning/pages/frame/welcome/welcome.dart';
import 'package:ulearning/pages/home/bloc/home_bloc.dart';
import 'package:ulearning/pages/home/home.dart';
import 'package:ulearning/pages/message/bloc/message_bloc.dart';
import 'package:ulearning/pages/message/chat/bloc/chat_bloc.dart';
import 'package:ulearning/pages/message/chat/chat.dart';
import 'package:ulearning/pages/message/message.dart';
import 'package:ulearning/pages/message/photoview/bloc/photoview_bloc.dart';
import 'package:ulearning/pages/message/photoview/photoview.dart';
import 'package:ulearning/pages/message/videocall/bloc/videocall_bloc.dart';
import 'package:ulearning/pages/message/videocall/videocall.dart';
import 'package:ulearning/pages/message/voicecall/bloc/voicecall_bloc.dart';
import 'package:ulearning/pages/message/voicecall/voicecall.dart';
import 'package:ulearning/pages/profile/account/account.dart';
import 'package:ulearning/pages/profile/account/bloc/account_bloc.dart';
import 'package:ulearning/pages/profile/bloc/profile_bloc.dart';
import 'package:ulearning/pages/profile/profile.dart';
import 'package:ulearning/pages/profile/setting/bloc/setting_bloc.dart';
import 'package:ulearning/pages/profile/setting/setting.dart';
import 'package:ulearning/pages/search/bloc/search_bloc.dart';
import 'package:ulearning/pages/search/search.dart';
import 'package:ulearning/pages/unotification/bloc/unotification_bloc.dart';
import 'package:ulearning/pages/unotification/unotification.dart';

import 'routes.dart';

class AppPages {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static List<PageEntity> Routes(){
    return [
      PageEntity(
          path:AppRoutes.INITIAL,
          page:Welcome(),
          bloc:BlocProvider(create: (_) => WelcomeBloc())
      ),
      PageEntity(
          path:AppRoutes.Sign_in,
          page:SignIn(),
          bloc:BlocProvider(create: (_) => SignInBloc())
      ),
      PageEntity(
          path:AppRoutes.Register,
          page:Register(),
          bloc:BlocProvider(create: (_) => RegisterBloc())
      ),
      PageEntity(
          path:AppRoutes.Forget,
          page:Forget(),
          bloc:BlocProvider(create: (_) => ForgetBloc())
      ),
      PageEntity(
        path:AppRoutes.Application,
        page:Application(),
        bloc:BlocProvider(create: (_) => ApplicationBloc())
      ),
      PageEntity(
          path:AppRoutes.Home,
          page:Home(),
          bloc:BlocProvider(create: (_) => HomeBloc())
      ),
      PageEntity(
          path:AppRoutes.Course,
          page:Course(),
          bloc:BlocProvider(create: (_) => CourseBloc())
      ),
      PageEntity(
          path:AppRoutes.Contibitor,
          page:Contibitor(),
          bloc:BlocProvider(create: (_) => ContibitorBloc())
      ),
      PageEntity(
          path:AppRoutes.CourseDetail,
          page:CourseDetail(),
          bloc:BlocProvider(create: (_) => CourseDetailBloc())
      ),
      PageEntity(
          path:AppRoutes.Lesson,
          page:Lesson(),
          bloc:BlocProvider(create: (_) => LessonBloc())
      ),
      PageEntity(
          path:AppRoutes.Message,
          page:Message(),
          bloc:BlocProvider(create: (_) => MessageBloc())
      ),
      PageEntity(
          path:AppRoutes.Chat,
          page:Chat(),
          bloc:BlocProvider(create: (_) => ChatBloc())
      ),
      PageEntity(
          path:AppRoutes.Photoview,
          page:PhotoView(),
          bloc:BlocProvider(create: (_) => PhotoViewBloc())
      ),
      PageEntity(
          path:AppRoutes.VideoCall,
          page:VideoCall(),
          bloc:BlocProvider(create: (_) => VideoCallBloc())
      ),
      PageEntity(
          path:AppRoutes.VoiceCall,
          page:VoiceCall(),
          bloc:BlocProvider(create: (_) => VoiceCallBloc())
      ),
      PageEntity(
          path:AppRoutes.Unotification,
          page:Unotification(),
          bloc:BlocProvider(create: (_) => UnotificationBloc())
      ),
      PageEntity(
          path:AppRoutes.Profile,
          page:Profile(),
          bloc:BlocProvider(create: (_) => ProfileBloc())
      ),
      PageEntity(
          path:AppRoutes.Account,
          page:Account(),
          bloc:BlocProvider(create: (_) => AccountBloc())
      ),
      PageEntity(
          path:AppRoutes.Setting,
          page:Setting(),
          bloc:BlocProvider(create: (_) => SettingBloc())
      ),
      PageEntity(
          path:AppRoutes.Search,
          page:Search(),
          bloc:BlocProvider(create: (_) => SearchBloc())
      ),
    ];
  }

  static List<dynamic> Blocer(BuildContext context){
    List<dynamic> blocerList = <dynamic>[];
    for(var blocer in Routes()){
      blocerList.add(blocer.bloc);
    }
    return blocerList;
  }



  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {

      if(settings.name!=null){
        var result = Routes().where((element) => element.path==settings.name);
        if(result.isNotEmpty){
          // first open App
         bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
         if(result.first.path==AppRoutes.INITIAL && deviceFirstOpen){
           bool isLogin = Global.storageService.getIsLogin();
           //is login
           if(isLogin){
             return MaterialPageRoute<void>(builder: (_) => Application(),settings: settings);
           }
           return MaterialPageRoute<void>(builder: (_) => SignIn(),settings: settings);
         }
          return MaterialPageRoute<void>(builder: (_) => result.first.page,settings: settings);
        }
      }

    return MaterialPageRoute<void>(builder: (_) => SignIn(),settings: settings);
  }
}

class PageEntity<T> {
  String path;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.path,
    required this.page,
    required this.bloc,
  });
}
