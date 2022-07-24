import 'package:ala_pos/presentation/pages/transaction/cubit/transaction_list/transaction_list_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../cubit/transaction_detail/transaction_detail_cubit.dart';

class TransactionWrapper extends StatelessWidget {
  const TransactionWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I.get<TransactionListCubit>(),
        ),
        BlocProvider(
          create: (context) => GetIt.I.get<TransactionDetailCubit>(),
        ),
      ],
      child: AutoRouter(),
    );
  }
}
