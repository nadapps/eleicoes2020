import 'dart:ffi';

class Goods {
  final int order;
  final String description;
  final String type;
  final double amount;

  Goods({this.order, this.description, this.type, this.amount});

// "ordem":5,
//          "descricao":"Quotas da empresa hamburgueria divino 2018 LTDA 08967954/0001-80",
//          "descricaoDeTipoDeBem":"Quotas ou quinhões de capital",
//          "valor":400.0,
//          "dataUltimaAtualizacao":"2020-09-21"

  factory Goods.fromJson(Map<String, dynamic> json) {
    return Goods(
      order: json['ordem'],
      description: json['descricao'],
      type: json['descricaoDeTipoDeBem'],
      amount: json['valor'],
    );
  }
}
