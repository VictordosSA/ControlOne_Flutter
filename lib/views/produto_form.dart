import 'package:flutter/material.dart';
import 'package:control/models/produto.dart';
import 'package:control/provider/produtos.dart';
import 'package:provider/provider.dart';

class ProdutoForm extends StatefulWidget {

  @override
  _ProdutoFormState createState() => _ProdutoFormState();
}



class _ProdutoFormState extends State<ProdutoForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Produto produto){
      _formData['id'] = produto.id;
      _formData['name'] = produto.name;
      _formData['descricao'] = produto.descricao;
      _formData['quantidade'] = produto.quantidade;
      _formData['avatarUrl'] = produto.avatarUrl;
    
  }

@override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final produto = ModalRoute.of(context)!.settings.arguments as Produto;

    _loadFormData(produto);
  }

 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Produto'),
        actions: <Widget>[
          IconButton(
            icon: Icon (Icons.save),
            onPressed: (){
              final isValid = _form.currentState!.validate();
              
              if(isValid) {
              _form.currentState!.save();
              Provider.of<Produtos>(context, listen: false).put(
                Produto(
                id: _formData['id'] ?? '',
                name: _formData['name'] ?? '',
                descricao: _formData['descricao'] ?? '',
                quantidade: _formData['quantidade'] ?? '',
                avatarUrl: _formData['avatarUrl'] ?? '',
                ),
              );
              Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value){
                  if(value == null || value.isEmpty) {
                    return 'Nome Inválido';
                  }
                  
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['descricao'],
                decoration: InputDecoration(labelText: 'Descricao'),
                validator: (value){
                  if(value == null || value.isEmpty) {
                    return 'Descrição Inválido';
                  }
                  
                  return null;
                },
               onSaved: (value) => _formData['descricao'] = value!,
              ),
              TextFormField(
                initialValue: _formData['quantidade'],
                decoration: InputDecoration(labelText: 'Quantidade do Produto'),
                onSaved: (value) => _formData['quantidade'] = value!,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(labelText: 'Url da Imagem do produto'),
                onSaved: (value) => _formData['avatarUrl'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}