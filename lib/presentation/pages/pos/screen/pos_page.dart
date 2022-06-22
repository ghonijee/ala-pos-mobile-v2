import 'package:ala_pos/presentation/pages/pos/cubit/list_product/list_product_cubit.dart';
import 'package:ala_pos/presentation/pages/pos/screen/pos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class PosPage extends StatelessWidget {
  const PosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => GetIt.I.get<ListProductCubit>()),
    ], child: PosScreen());
  }
}
