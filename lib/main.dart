import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:newdemo/page_routes.dart';
import 'package:newdemo/preference/preference.dart';
import 'package:newdemo/repository/list_movie_repository.dart';
import 'package:newdemo/view/list_film_page.dart';
import 'package:newdemo/view/list_film_view_model.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';


final GlobalKey<NavigatorState> mainKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await PreferenceManager.init();
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => ListMovieRepository()),
    ],
    child: const MyApp(
    ),
  ));
}

class MyApp extends StatelessWidget {
  final bool isUserLogged;
  const MyApp({Key? key, this.isUserLogged = false}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData.light();
    return RefreshConfiguration(
      footerBuilder: () => CustomFooter(
        height: 1,
        builder: (_, __) => const SizedBox(),
      ),
      headerBuilder: () => const MaterialClassicHeader(),
      // Configure default bottom indicator
      headerTriggerDistance: 80.0,
      // header trigger refresh trigger distance
      springDescription: const SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
      // custom spring back animate,the props meaning see the flutter api
      maxOverScrollExtent: 100,
      //The maximum dragging range of the head. Set this property if a rush out   of the view area occurs
      maxUnderScrollExtent: 0,
      footerTriggerDistance: 2000,
      // Maximum dragging range at the bottom
      enableScrollWhenRefreshCompleted: true,
      //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
      enableLoadingWhenFailed: true,
      //In the case of load failure, users can still trigger more loads by gesture pull-up.
      hideFooterWhenNotFull: true,
      // Disable pull-up to load more functionality when Viewport is less than one screen
      enableBallisticLoad: true,
      child: MaterialApp(
        navigatorKey: mainKey,
        builder: (context, child) {
          return ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, child!),
            maxWidth: 1200,
            minWidth: 375,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1600, name: TABLET),
              const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
          );
        },
        darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.black45,
          cardColor: Colors.black87,
        ),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        initialRoute: PageRoutes.listFilmPage,
        routes: _pageMap(),
      ),
    );
  }

  _pageMap() {
    return <String, WidgetBuilder>{
      PageRoutes.listFilmPage: (BuildContext context) {
        return ChangeNotifierProvider(create: (_) => ListFilmViewModel(context.read()), child: const ListFilmPage());
      },
    };
  }
}