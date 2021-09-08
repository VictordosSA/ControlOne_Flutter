import 'dart:math';
import 'package:flutter/material.dart';
import 'package:control/data/dummy_produtos.dart';
import 'package:control/models/produto.dart';

class Produtos with ChangeNotifier{
  final Map<String, Produto> _items = {...DUMMY_PRODUTOS};

  List<Produto> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Produto byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(Produto produto){
    // ignore: unnecessary_null_comparison
    if(produto == null){
      return;
    }

    // ignore: unnecessary_null_comparison
    if(produto.id != null && 
    produto.id.trim().isNotEmpty && 
    _items.containsKey(produto.id)){
      _items.update(produto.id, 
      (_) => Produto(
        id: produto.id,
        name: produto.name,
        email: produto.email,
        avatarUrl: produto.avatarUrl,
        ),
      );
    }else{
      //adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id, 
        () => Produto(
          id: id,
          name: produto.name,
          email: produto.email,
          avatarUrl: produto.avatarUrl,
        ),
      );
    }
     notifyListeners();
  }

  void remove(Produto produto){
    // ignore: unnecessary_null_comparison
    if(produto != null && produto.id != null){
      _items.remove(produto.id);
      notifyListeners();
    }
  }
}