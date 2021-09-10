import 'package:flutter/material.dart';
import 'package:control/models/fornecedor.dart';
import 'package:control/provider/fornecedores.dart';
import 'package:provider/provider.dart';

class FornecedorForm extends StatefulWidget {

  @override
  _FornecedorFormState createState() => _FornecedorFormState();
}



class _FornecedorFormState extends State<FornecedorForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Fornecedor fornecedor){
      _formData['id'] = fornecedor.id;
      _formData['name'] = fornecedor.name;
      _formData['endereco'] = fornecedor.endereco;
      _formData['avatarUrl'] = fornecedor.avatarUrl;
    
  }

@override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final fornecedor = ModalRoute.of(context)!.settings.arguments as Fornecedor;

    _loadFormData(fornecedor);
  }

 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Fornecedor'),
        actions: <Widget>[
          IconButton(
            icon: Icon (Icons.save),
            onPressed: (){
              final isValid = _form.currentState!.validate();
              
              if(isValid) {
              _form.currentState!.save();
              Provider.of<Fornecedores>(context, listen: false).put(
                Fornecedor(
                id: _formData['id'] ?? '',
                name: _formData['name'] ?? '',
                endereco: _formData['endereco'] ?? '',
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
                initialValue: _formData['endereco'],
                decoration: InputDecoration(labelText: 'Endereço'),
                validator: (value){
                  if(value == null || value.isEmpty) {
                    return 'Endereço Inválido';
                  }
                  
                  return null;
                },
               onSaved: (value) => _formData['endereco'] = value!,
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