import 'package:flutter/material.dart';
import 'package:control/components/user_tile.dart';
import 'package:control/provider/users.dart';
import 'package:control/routes/app_routes.dart';




class MenuList extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text ('Menu')),
      body: const Center(
        child: Text('Menu!'),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu Lista'),
            ),
            ListTile(
              title: const Text('Lista de Usuário'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context).pushNamed(
                AppRoutes.HOME_USER
              );
              },
            ),
            ListTile(
              title: const Text('Lista de Fornecedor'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context).pushNamed(
                AppRoutes.HOME_FORNECEDOR
              );
              },
            ),
            ListTile(
              title: const Text('Lista de Produto'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context).pushNamed(
                AppRoutes.HOME_PRODUTO
              );
              },
            ),
            ListTile(
              title: const Text('Adicionar Usuário'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM
              );
              },
            ),
          ],
        ),
      ),
    );
  }
}