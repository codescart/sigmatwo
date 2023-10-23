import 'package:Sigma/auth/splashscreen.dart';
import 'package:Sigma/auth/web_register.dart';
import 'package:Sigma/test.dart';
import 'package:Sigma/webroutes.dart';
import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:Sigma/auth/backgrounddesigen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_strategy/url_strategy.dart';

double width = 350;
double height = 700;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyALpCKUggzx_XcLDhCFC55KR97ZQZKG5Yc",
        appId: "1:259129655075:web:7951c96c64c93d85d75696",
        messagingSenderId: "G-WXTF97CCF1",
        projectId: "sigma-4c991",
      ), );
     runApp( MyApp());
    // final runnableApp = _buildRunnableApp(
    //   isWeb: kIsWeb,
    //   webAppWidth: 360.0,
    //   webAppheight: 690,
    //
    //   app:  MyApp(),
    // );
    //
    // runApp(runnableApp);
    // setPathUrlStrategy();
  }else{
    await Firebase.initializeApp();

    // runApp(
    //
    //     ScreenUtilInit(
    //   designSize: const Size(360, 690),
    //   minTextAdapt: true,
    //   splitScreenMode: true,
    //       builder: (context , child) {
    //     return
    //       MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       title: 'Sigma',
    //       theme: ThemeData(
    //         primarySwatch: Colors.blue,
    //       ),
    //
    //      home: child,
    //     );
    //   },
    //   child: Splash_SCreen(),
    // )
    // );
  }

  runApp( MyApp());
  setPathUrlStrategy();


}
// Widget _buildRunnableApp({
//   required bool isWeb,
//   required double webAppWidth,
//   required double webAppheight,
//   required Widget app,
// }) {
//   if (!isWeb) {
//     return app;
//   }
//
//   return Center(
//     child: ClipRect(
//       child: SizedBox(
//         width: webAppWidth,
//         child: app,
//       ),
//     ),
//   );
// }

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [BooksLocation()],
    ),
    notFoundRedirectNamed: '/registration',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: routerDelegate,

      //supportedLocales: S.delegate.supportedLocales,

      routeInformationParser: BeamerParser(),
      backButtonDispatcher:
      BeamerBackButtonDispatcher(delegate: routerDelegate),
    );
  }
}

class BooksLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['/Register/:code'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final String? id = state.pathParameters['code'];
  //  final String? oid = state.pathParameters['pool'];
    final pages = [
      BeamPage(
        key: ValueKey('home'),
        title: 'Home',
        child: web_register(Code: '',),
      ),
      BeamPage(
        key: ValueKey('registration'),
        title: 'registration',
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Splash_SCreen()),
      ),
    ];

    // final String type = state.pathParameters['type'];
    // final String roomcode = state.pathParameters['roomcode'];
    if (id != null) {
      // final bookId = int.tryParse(bookIdParameter);
      // final book = books.firstWhereOrNull((book) => book.id == bookId);
      pages.add(
        BeamPage(
          key: ValueKey('Code-$id'),
          title: 'Code #$id',
          child: web_register(Code: id, ),
        ),
      );
    }
    return pages;
  }
}


