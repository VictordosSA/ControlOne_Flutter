import 'dart:math';
import 'package:flutter/material.dart';
import 'package:control/data/dummy_fornecedores.dart';
import 'package:control/models/fornecedor.dart';

class Fornecedores with ChangeNotifier{
  final Map<String, Fornecedor> _items = {...DUMMY_FORNECEDORES};

  List<Fornecedor> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Fornecedor byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(Fornecedor fornecedor){
    // ignore: unnecessary_null_comparison
    if(fornecedor == null){
      return;
    }

    // ignore: unnecessary_null_comparison
    if(fornecedor.id != null && 
    fornecedor.id.trim().isNotEmpty && 
    _items.containsKey(fornecedor.id)){
      _items.update(fornecedor.id, 
      (_) => Fornecedor(
        id: fornecedor.id,
        name: fornecedor.name,
        endereco: fornecedor.endereco,
        avatarUrl: fornecedor.avatarUrl,
        ),
      );
    }else{
      //adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id, 
        () => Fornecedor(
          id: id,
          name: fornecedor.name,
          endereco: fornecedor.endereco,
          avatarUrl: fornecedor.avatarUrl,
        ),
      );
    }
     notifyListeners();
  }

  void remove(Fornecedor fornecedor){
    // ignore: unnecessary_null_comparison
    if(fornecedor != null && fornecedor.id != null){
      _items.remove(fornecedor.id);
      notifyListeners();
    }
  }
}