import 'package:flutter/material.dart';
import 'package:control/components/user_tile.dart';
import 'package:control/provider/users.dart';
import 'package:control/routes/app_routes.dart';
import 'package:provider/provider.dart';


class ProdutoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text ('Lista de Produto'),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM
              );
            },
          ),
        ],
        ),
        body: ListView.builder(
          itemCount: users.count, 
          itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
        ),
    );
  }
}