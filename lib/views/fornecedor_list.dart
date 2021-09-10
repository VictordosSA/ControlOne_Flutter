import 'package:flutter/material.dart';
import 'package:control/components/fornecedor_tile.dart';
import 'package:control/provider/fornecedores.dart';
import 'package:control/routes/app_routes.dart';
import 'package:provider/provider.dart';


class FornecedorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Fornecedores fornecedores = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text ('Lista de Fornecedores'),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(
                AppRoutes.FORNECEDOR_FORM
              );
            },
          ),
        ],
        ),
        body: ListView.builder(
          itemCount: fornecedores.count, 
          itemBuilder: (ctx, i) => FornecedorTile(fornecedores.byIndex(i)),
        ),
    );
  }
}