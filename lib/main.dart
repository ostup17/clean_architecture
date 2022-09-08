import 'package:architecture/features/presentation/cubit/best_seller_list_cubit.dart';
import 'package:architecture/features/presentation/pages/home/home.dart';
import 'package:architecture/locator_service.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/presentation/cubit/hot_sales_list_cubit.dart';
import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HotSalesCubit>(create: (context) => sl<HotSalesCubit>()..loadHotSales()),
        BlocProvider<BestSellerCubit>(
            create: (context) => sl<BestSellerCubit>())
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}