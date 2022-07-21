import 'package:ala_pos/presentation/pages/pages.dart';
import 'package:ala_pos/presentation/pages/pos/cubit/payment/payment_cubit.dart';
import 'package:ala_pos/presentation/pages/pos/cubit/submit_transaction/submit_transaction_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../cubit/scan_product/scan_product_cubit.dart';

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
        BlocProvider(create: (_) => GetIt.I.get<SubmitTransactionCubit>()),
        BlocProvider(create: (_) => GetIt.I.get<ScanProductCubit>()),
      ],
      child: AutoRouter(),
    );
  }
}
