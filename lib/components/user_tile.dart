import 'package:flutter/material.dart';
import 'package:control/models/user.dart';
import 'package:control/provider/users.dart';
import 'package:control/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  
  final User user;
  
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl.isEmpty
    ? CircleAvatar(child: Icon(Icons.person))
    : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
        children: <Widget>[
        IconButton(
          icon: Icon(Icons.edit),
          color: Colors.orange,
          onPressed: () {
            Navigator.of(context).pushNamed(
              AppRoutes.USER_FORM,
              arguments: user, 
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
                Provider.of<Users>(context, listen: false).remove(user);
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