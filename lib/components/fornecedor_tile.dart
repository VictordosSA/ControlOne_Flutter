import 'package:flutter/material.dart';
import 'package:control/models/fornecedor.dart';
import 'package:control/provider/fornecedores.dart';
import 'package:control/routes/app_routes.dart';
import 'package:provider/provider.dart';

class FornecedorTile extends StatelessWidget {
  
  final Fornecedor fornecedor;
  
  const FornecedorTile(this.fornecedor);

  @override
  Widget build(BuildContext context) {
    final avatar = fornecedor.avatarUrl.isEmpty
    ? CircleAvatar(child: Icon(Icons.person))
    : CircleAvatar(backgroundImage: NetworkImage(fornecedor.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(fornecedor.name),
      subtitle: Text(fornecedor.endereco),
      trailing: Container(
        width: 100,
        child: Row(
        children: <Widget>[
        IconButton(
          icon: Icon(Icons.edit),
          color: Colors.orange,
          onPressed: () {
            Navigator.of(context).pushNamed(
              AppRoutes.FORNECEDOR_FORM,
              arguments: fornecedor, 
            );

          }, 
        ),
        IconButton(
          icon: Icon(Icons.delete),
          color: Colors.red,
          onPressed: () {
            showDialog(context: context, 
            builder: (ctx) => AlertDialog(
              title: Text('Exclusão de Produto'),
              content: Text('Deseja realmente excluir esse Fornecedor?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Não'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                 FlatButton(
                  child: Text('Sim'),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ],
            ),
            ).then((confirmed){
              if(confirmed){
                Provider.of<Fornecedores>(context, listen: false).remove(fornecedor);
              }

            });
            
          }, 
         
          )
        ],
      ),
    ),
    );
  }
}