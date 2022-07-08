import 'package:ala_pos/presentation/pages/product/cubit/master_product_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MasterProductWrapper extends StatelessWidget {
  const MasterProductWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => GetIt.I.get<MasterProductCubit>()),
    ], child: AutoRouter());
  }
}
