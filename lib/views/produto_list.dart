import 'package:flutter/material.dart';
import 'package:control/components/produto_tile.dart';
import 'package:control/provider/produtos.dart';
import 'package:control/routes/app_routes.dart';
import 'package:provider/provider.dart';


class ProdutoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Produtos produtos = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text ('Lista de Produto'),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(
                AppRoutes.PRODUTO_FORM
              );
            },
          ),
        ],
        ),
        body: ListView.builder(
          itemCount: produtos.count, 
          itemBuilder: (ctx, i) => ProdutoTile(produtos.byIndex(i)),
        ),
    );
  }
}
