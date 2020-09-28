import 'dart:ffi';

import 'package:eleicoes2020/models/Candidate.dart';
import 'package:eleicoes2020/models/Goods.dart';
import 'package:flutter/material.dart';
import 'package:eleicoes2020/extension/iterable.dart';

class GoodsScreen extends StatelessWidget {
  final Candidate candidate;

  GoodsScreen({this.candidate});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 15),
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
                        Text(
                          good.type,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          good.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
