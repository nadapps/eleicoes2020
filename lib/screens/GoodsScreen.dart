import 'package:auto_size_text/auto_size_text.dart';
import 'package:eleicoes2020/models/Candidate.dart';
import 'package:eleicoes2020/models/Goods.dart';
import 'package:flutter/material.dart';
import 'package:eleicoes2020/extension/iterable.dart';
import 'package:intl/intl.dart';

class GoodsScreen extends StatelessWidget {
  final Candidate candidate;

  GoodsScreen({this.candidate});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = new NumberFormat.simpleCurrency(locale: 'pt-BR');

    return Column(children: <Widget>[
      Padding(
          padding: EdgeInsets.only(bottom: 5, top: 15),
          child: Text(
              'Total de bens: ${formatCurrency.format(candidate.goodsTotal)}',
              style: TextStyle(fontWeight: FontWeight.w800))),
      Expanded(
          child: ListView(
              children: candidate.goods.mapIndex<Widget>(
        (Goods good, int index) {
          return Column(children: <Widget>[
            ListTile(
              title: Text(
                good.type,
                textAlign: TextAlign.left,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              subtitle: AutoSizeText(formatCurrency.format(good.amount),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
            ),
            if (index < candidate.goods.length - 1)
              Divider(
                height: 0,
                thickness: 1,
              )
          ]);
        },
      ).toList()))
    ]);
  }
}
