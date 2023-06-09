import 'package:flutter/material.dart';
import 'package:hil_mobile/Models/followlistModel.dart';
import 'package:hil_mobile/Services/authService.dart';
import 'package:hil_mobile/Services/followService.dart';
import 'package:hil_mobile/Widgets/followlList.dart';

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
          child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
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
                      } else if (snapshot.data!.isNotEmpty) {
                        List<DetailFollowList> listFollow = snapshot.data!;
                        return ListView.builder(
                            itemCount: listFollow.length,
                            itemBuilder: (context, index) {
                              if (listFollow.isNotEmpty) {
                                return FollowListCard(
                                    labelNumber: index.toString(),
                                    dateFO: listFollow[index].dateFo.length > 11
                                        ? listFollow[index]
                                            .dateFo
                                            .substring(0, 10)
                                        : listFollow[index].dateFo.substring(
                                            0, listFollow[index].dateFo.length),
                                    unit: listFollow[index].unitFo == "   "
                                        ? '-'
                                        : listFollow[index].unitFo ?? '-',
                                    byPerson: listFollow[index].nameFo ?? '-',
                                    nextUnit: listFollow[index].nextFo ?? '-',
                                    followOn: listFollow[index].follow ?? '-');
                              } else {
                                return Center(
                                  child: Text('data not available'),
                                );
                              }
                            });
                      } else {
                        return Center(
                          child: Text('Data not available'),
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      )),
    );
  }
}
