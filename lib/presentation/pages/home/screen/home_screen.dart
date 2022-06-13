import 'package:ala_pos/domain/models/user_model.dart';
import 'package:ala_pos/presentation/widgets/side_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenuWidget(
        logoutAction: () {
          // Action Logout
        },
        userModel: UserModel(fullname: "Ahmad Yunus Afghoni"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Alapos"),
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () {
        //     //
        //   },
        // ),
      ),
      body: SingleChildScrollView(
        child: Text("Home"),
      ),
    );
  }
}
