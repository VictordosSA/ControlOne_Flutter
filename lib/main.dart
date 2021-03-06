import 'package:flutter/material.dart';
import 'package:control/provider/users.dart';
import 'package:control/routes/app_routes.dart';
import 'package:control/views/user_form.dart';
import 'package:control/views/user_list.dart';
import 'package:control/views/produto_form.dart';
import 'package:control/views/produto_list.dart';
import 'package:control/provider/produtos.dart';
import 'package:control/views/fornecedor_form.dart';
import 'package:control/views/fornecedor_list.dart';
import 'package:control/provider/fornecedores.dart';
import 'package:control/views/menu_list.dart';
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
        ChangeNotifierProvider(
          create: (ctx) => Produtos(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Fornecedores(),
        ),
      ],
      child: MaterialApp(
        title: 'Menu',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => MenuList(),
          AppRoutes.HOME_USER: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm(),
          AppRoutes.HOME_PRODUTO: (_) => ProdutoList(),
          AppRoutes.PRODUTO_FORM: (_) => ProdutoForm(),
          AppRoutes.HOME_FORNECEDOR: (_) => FornecedorList(),
          AppRoutes.FORNECEDOR_FORM: (_) => FornecedorForm() 
        },
      ),
    );
  }
}