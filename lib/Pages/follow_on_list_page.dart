import 'package:flutter/material.dart';
import 'package:hil_mobile/Models/followlistModel.dart';
import 'package:hil_mobile/Services/authService.dart';
import 'package:hil_mobile/Services/followService.dart';
import 'package:hil_mobile/Widgets/followlList.dart';
import 'package:intl/intl.dart';

class FollowOnListPage extends StatefulWidget {
  static const routeName = "/follow_on_list_page";
  const FollowOnListPage({Key? key}) : super(key: key);

  @override
  State<FollowOnListPage> createState() => _FollowOnListPageState();
}

class _FollowOnListPageState extends State<FollowOnListPage> {
  String? token;

  @override
  void initState() {
    super.initState();
    AuthService.hasToken().then((value) {
      setState(() {
        token = value['token'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    final itemid = id;

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
              child: FutureBuilder<List<DetailFollowList>>(
                  future: FollowService.getFollowList(id, token),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List<DetailFollowList> listFollow = snapshot.data!;
                      return ListView.builder(
                          itemCount: listFollow.length,
                          itemBuilder: (context, index) {
                            if (listFollow.isNotEmpty) {
                              return FollowListCard(
                                  labelNumber: index.toString(),
                                  dateFO: DateFormat('y-MM-dd').format(
                                      DateTime.parse(listFollow[index].dateFo)),
                                  unit: listFollow[index].unitFo == "   "
                                      ? '-'
                                      : listFollow[index].unitFo ?? '-',
                                  byPerson: listFollow[index].by ?? '-',
                                  nextUnit: listFollow[index].nextFo ?? '-',
                                  followOn: listFollow[index].follow ?? '-');
                            } else {
                              return Center(
                                child: Text('data not available'),
                              );
                            }
                          });
                    }
                  }),
            )
          ],
        ),
      )),
    );
  }
}
