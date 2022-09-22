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
    final itemid = ModalRoute.of(context)?.settings.arguments as String;
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
            Expanded(
                child: FutureBuilder<List<FollowList>>(
                    future: FollowService.getFollowList(itemid),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // print(snapshot.data);
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.connectionState ==
                              ConnectionState.done &&
                          snapshot.data != null) {
                        List<FollowList> listFollow = snapshot.data!;
                        if (snapshot.data == null) {
                          return const Center(
                            child: Text('Data not available!'),
                          );
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return FollowListCard(
                                  labelNumber: (index + 1).toString(),
                                  dateFO: listFollow[index].dateFo == null ||
                                          listFollow[index].dateFo == ''
                                      ? '-'
                                      : DateFormat('y-M-d H:m')
                                          .format(listFollow[index].dateFo),
                                  unit: listFollow[index].unitFo == null ||
                                          listFollow[index].unitFo == '   '
                                      ? '-'
                                      : listFollow[index].unitFo.toString(),
                                  byPerson: listFollow[index].nameFo == null ||
                                          listFollow[index].nameFo == ''
                                      ? '-'
                                      : listFollow[index].nameFo.toString(),
                                  nextUnit: listFollow[index].nextFo == null ||
                                          listFollow[index].nextFo == ''
                                      ? '-'
                                      : listFollow[index].nextFo.toString(),
                                  followOn: listFollow[index].follow == null ||
                                          listFollow[index].follow == ''
                                      ? '-'
                                      : listFollow[index].follow.toString(),
                                );
                              });
                        }
                      } else {
                        return const Center(
                          child: Text(
                            'Connection failed!',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      }
                    }))
          ],
        ),
      )),
    );
  }
}
