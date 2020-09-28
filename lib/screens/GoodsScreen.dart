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

    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        children: candidate.goods.length > 0
            ? candidate.goods.mapIndex<Widget>(
                (Goods good, int index) {
                  return Container(
                    margin: EdgeInsets.only(
                      bottom: 15,
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            good.type,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: Text(good.description,
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14)),
                        ),
                        Container(
                          child: AutoSizeText(
                              "${formatCurrency.format(good.amount)}",
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                  );
                },
              ).toList()
            : [],
      ),
    ));
  }
}
