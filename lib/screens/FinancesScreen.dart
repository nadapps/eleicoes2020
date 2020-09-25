import 'package:eleicoes2020/components/EmptyState.dart';
import 'package:eleicoes2020/components/NumberDescription.dart';
import 'package:eleicoes2020/models/Candidate.dart';
import 'package:eleicoes2020/models/Finance.dart';
import 'package:eleicoes2020/services/candidate.dart';
import 'package:flutter/material.dart';

class FinancesScreen extends StatefulWidget {
  final Candidate candidate;
  final String cityCode;
  final String officeCode;

  FinancesScreen(
      {Key key,
      @required this.candidate,
      @required this.cityCode,
      @required this.officeCode})
      : super(key: key);

  @override
  _FinancesScreenState createState() => _FinancesScreenState();
}

class _FinancesScreenState extends State<FinancesScreen> {
  Future<Finance> futureFinance;

  @override
  void initState() {
    super.initState();

    futureFinance = getFinances(
        number: widget.candidate.number,
        partyNumber: widget.candidate.party.number,
        candidateCode: widget.candidate.id,
        city: widget.cityCode,
        officeCode: widget.officeCode);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: FutureBuilder(
            future: futureFinance,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Finance finance = snapshot.data;

                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      NumberDescription(
                          large: true,
                          description: "Total de receita",
                          value: finance.recipeAmmount,
                          color: Colors.green),
                      NumberDescription(
                          large: true,
                          description: "Total de despesas",
                          value: finance.expenseAmmount,
                          color: Colors.red),
                      Expanded(
                          child: Container(
                              margin: EdgeInsets.only(top: 20),
                              child: GridView.count(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2.7,
                                  children: <Widget>[
                                    NumberDescription(
                                        description:
                                            "Receita através do partido",
                                        value: finance.recipeParty,
                                        color: Colors.green),
                                    NumberDescription(
                                        description: "Limite de despesas",
                                        value: finance.expenseLimit),
                                    NumberDescription(
                                        description: "Receita de pessoa física",
                                        value: finance.recipePF,
                                        color: Colors.green),
                                    NumberDescription(
                                      description: "Despesas pagas",
                                      value: finance.expensePaid,
                                    ),
                                  ])))
                    ]);
              } else if (snapshot.hasError) {
                return EmptyState(
                    title: "Oops...",
                    description:
                        'Ocorreu um erro ao buscar os dados, tente novamente mais tarde.',
                    icon: Icons.portable_wifi_off);
              }

              return Center(child: CircularProgressIndicator());
            }));
  }
}
