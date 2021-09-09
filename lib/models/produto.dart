import 'package:flutter/material.dart';

class Produto {
  final String id;
  final String name;
  final String descricao;
  final String quantidade;
  final String avatarUrl;


  
  const Produto({
    required this.id,
    required this.name,
    required this.descricao,
    required this.quantidade,
    required this.avatarUrl,

  });
}