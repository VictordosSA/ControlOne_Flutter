import 'package:flutter/material.dart';
import 'package:control/models/produto.dart';
import 'package:control/provider/produtos.dart';
import 'package:control/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ProdutoTile extends StatelessWidget {
  
  final Produto produto;
  
  const ProdutoTile(this.produto);

  @override
  Widget build(BuildContext context) {
    final avatar = produto.avatarUrl.isEmpty
    ? CircleAvatar(child: Icon(Icons.person))
    : CircleAvatar(backgroundImage: NetworkImage(produto.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(produto.name),
      subtitle: Text(produto.email),
      trailing: Container(
        width: 100,
        child: Row(
        children: <Widget>[
        IconButton(
          icon: Icon(Icons.edit),
          color: Colors.orange,
          onPressed: () {
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUTO_FORM,
              arguments: produto, 
            );

          }, 
        ),
        IconButton(
          icon: Icon(Icons.delete),
          color: Colors.red,
          onPressed: () {
            showDialog(context: context, 
            builder: (ctx) => AlertDialog(
              title: Text('Exclusão de Usuário'),
              content: Text('Deseja realmente excluir esse usuário?'),
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
                Provider.of<Produtos>(context, listen: false).remove(produto);
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