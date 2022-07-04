import 'package:ala_pos/presentation/pages/pages.dart';
import 'package:ala_pos/presentation/pages/pos/cubit/cart/cart_cubit.dart';
import 'package:ala_pos/presentation/pages/pos/cubit/list_product/list_product_cubit.dart';
import 'package:ala_pos/presentation/pages/pos/cubit/payment/payment_cubit.dart';
import 'package:ala_pos/presentation/pages/pos/screen/pos_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class PosWrapperPage extends StatelessWidget {
  const PosWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I.get<ListProductCubit>()),
        BlocProvider(create: (_) => GetIt.I.get<CartCubit>()),
        BlocProvider(create: (_) => GetIt.I.get<PaymentCubit>()),
        BlocProvider(create: (_) => GetIt.I.get<TransactionResumeCubit>()),
      ],
      child: AutoRouter(),
    );
  }
}
