import 'package:flutter/material.dart';
import 'package:control/provider/users.dart';
import 'package:control/routes/app_routes.dart';
import 'package:control/views/user_form.dart';
import 'package:control/views/user_list.dart';
import 'package:control/views/produto_form.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm(),
          AppRoutes.PRODUTO_FORM: (_) => ProdutoForm() 
        },
      ),
    );
  }
}