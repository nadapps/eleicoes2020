import 'package:eleicoes2020/enuns/Sex.dart';
import 'package:eleicoes2020/models/Candidate.dart';
import 'package:eleicoes2020/models/Election.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:eleicoes2020/extension/iterable.dart';

class ElectionsScreen extends StatelessWidget {
  final Candidate candidate;

  ElectionsScreen({this.candidate});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            children: candidate.elections
                .mapIndex<Widget>((Election election, int index) {
      String nameSex = candidate.sex == Sex.MALE ? 'Candidato' : 'Candidata';

      return TimelineTile(
        isFirst: index == 0,
        alignment: TimelineAlign.manual,
        lineXY: 0.2,
        indicatorStyle: IndicatorStyle(
          width: 30,
          indicatorXY: 0,
          color: Colors.grey[700],
          padding: EdgeInsets.all(0),
          iconStyle: IconStyle(
            color: Colors.white,
            iconData: Icons.star,
          ),
        ),
        endChild: Container(
            padding: EdgeInsets.only(left: 8, bottom: 32, top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$nameSex a ${election.office}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w700),
                ),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(election.location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ))),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text("Partido: ${election.party}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500)))
              ],
            )),
        startChild: Container(
          height: double.infinity,
          margin: EdgeInsets.only(top: 4),
          child: Text(
            "${election.year}",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w900,
                fontSize: 16),
          ),
        ),
      );
    }).toList()));
  }
}
