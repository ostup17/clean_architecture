import 'package:architecture/features/presentation/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:architecture/locator_service.dart' as di;
import 'features/presentation/pages/cart/cart.dart';
import 'features/presentation/pages/details/details.dart';
import 'features/presentation/pages/splash_screen/splash.dart';



//screen


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(App());

}
class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(

    debugShowCheckedModeBanner: false,
    routeInformationParser: _router.routeInformationParser,
    routerDelegate: _router.routerDelegate,
    routeInformationProvider: _router.routeInformationProvider,
    title: 'GoRouter Example',
  );

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) => HomePage(),
      ),
      GoRoute(
        path: '/Details',
        builder: (BuildContext context, GoRouterState state) => Details(),
      ),
      GoRoute(
        path: '/cart',
        builder: (BuildContext context, GoRouterState state) => Cart(),
      ),
    ],
  );
}



// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await di.init();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<HotSalesCubit>(create: (context) => sl<HotSalesCubit>()..loadHotSales()),
//         BlocProvider<BestSellerCubit>(create: (context) => sl<BestSellerCubit>()..loadBestSeller())
//       ],
//       child: MaterialApp(
//         home: HomePage(),
//       ),
//     );
//   }
// }