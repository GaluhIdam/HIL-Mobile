import 'package:flutter/material.dart';
import 'package:hil_mobile/Models/followlistModel.dart';
import 'package:hil_mobile/Models/taskModel.dart';
import 'package:hil_mobile/Services/followService.dart';
import 'package:hil_mobile/Widgets/cardTask.dart';
import 'package:hil_mobile/Widgets/followlList.dart';
import 'package:intl/intl.dart';

class FollowOnListPage extends StatelessWidget {
  static const routeName = "/follow_on_list_page";
  const FollowOnListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passing = ModalRoute.of(context)?.settings.arguments as Map;
    final itemid = passing['itemid'];
    final labelNumber = 0.toString();
    final dateFO =
        DateFormat('y-m-d H:m').format(DateTime.parse(passing['dateFo']));
    final unit = passing['unitFo'];
    final byPerson = passing['by'];
    final nextUnit = passing['nextUnit'];
    final followOn = passing['follow'];
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          size: 35,
                        ),
                        Text(
                          itemid,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
              ),
            ),
            FollowListCard(
                labelNumber: labelNumber,
                dateFO: dateFO.toString(),
                unit: unit ?? '-',
                byPerson: byPerson ?? '-',
                nextUnit: nextUnit ?? '-',
                followOn: followOn ?? '-')
          ],
        ),
      )),
    );
  }
}
