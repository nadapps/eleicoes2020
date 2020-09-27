import 'package:auto_size_text/auto_size_text.dart';
import 'package:eleicoes2020/components/Digits.dart';
import 'package:eleicoes2020/components/Social.dart';
import 'package:eleicoes2020/enuns/Sex.dart';
import 'package:eleicoes2020/models/Candidate.dart';
import 'package:eleicoes2020/components/TitledText.dart';
import 'package:flutter/material.dart';
import 'package:eleicoes2020/extension/string.dart';

class CandidateDetailsScreen extends StatelessWidget {
  final Candidate candidate;

  CandidateDetailsScreen({this.candidate});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Container(
                child: Column(
                  children: [
                    Column(
                      children: <Widget>[
                        Container(
                          child: AutoSizeText(
                            candidate.nickname,
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Center(
                              child: Digits(
                                number: candidate.number,
                                small: false,
                              ),
                            ))
                      ],
                    ),
                    if (candidate.vice != null) ...<Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Divider(
                          height: 1,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Vice',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(32),
                                    child: Image.network(
                                      candidate.vice.photo,
                                      fit: BoxFit.cover,
                                      height: 30,
                                      width: 30,
                                    )),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      candidate.vice.nickname,
                                      style: TextStyle(fontSize: 14),
                                      textAlign: TextAlign.center,
                                    )),
                              ]))
                    ],
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Divider(
                        height: 1,
                        color: Colors.grey[600],
                      ),
                    ),
                    if (candidate.socials.length > 0) ...<Widget>[
                      Text(
                        'Redes sociais',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 15, bottom: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: candidate.socials
                                  .map<Widget>((String social) {
                                return Social(url: social);
                              }).toList())),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Divider(
                          height: 1,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                    Column(children: [
                      Text(
                        candidate.sex == Sex.MALE
                            ? 'Dados do candidato'
                            : 'Dados da candidata',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            TitledText(
                              title: 'Nome completo',
                              text: candidate.name,
                            ),
                            TitledText(
                              title: 'Ocupação',
                              text: candidate.officeName,
                            ),
                            TitledText(
                                title: 'Cor/Raça',
                                text: candidate.breed.capitalize()),
                            TitledText(
                              title: 'Sexo',
                              text: candidate.sex == Sex.MALE
                                  ? 'Masculino'
                                  : 'Feminino',
                            ),
                            TitledText(
                              title: 'Coligação',
                              text: candidate.coalition,
                            ),
                            TitledText(
                              title: 'Naturalidade',
                              text: candidate.naturalness,
                            ),
                          ],
                        ),
                      )
                    ]),
                  ],
                ),
              ),
            )));
  }
}
