import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/models/account.dart';
import 'package:project/models/history.dart';
import 'package:project/services/auth.dart';
import 'package:project/services/database_history.dart';
import 'package:project/services/database_users.dart';
import 'package:project/views/history/history_card.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  DatabaseUser databaseUser = DatabaseUser();
  DatabaseHistory databaseHistory = DatabaseHistory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "History",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder(
          stream: databaseUser.getAccounts(),
          builder: (context, snapshot) {
            List userss = snapshot.data?.docs ?? [];
            Account account = Account("No user", "No email");
            for (var i in userss) {
              if (i.id == Auth().currentUser!.uid) {
                account = i.data();
              }
            }

            if (userss.isEmpty) {
              return const Center(
                child: Text("Please add some users."),
              );
            }

            return StreamBuilder(
                stream: databaseHistory.getHistories(),
                builder: ((context, snapshot) {
                  List histories = snapshot.data?.docs ?? [];

                  if (histories.isEmpty) {
                    return const Center(
                      child: Text("Please add some histories."),
                    );
                  }
                  return ListView.builder(
                    itemCount: account.getHistoryKey().length,
                    itemBuilder: (context, index) {
                      for (var i in histories) {
                        if (i.id == account.getHistoryKey()[index]) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              child: HistoryCard(
                                date: i.data().getDate(),
                                name: i.data().getName(),
                                time: i.data().getTime(),
                                calories: i.data().getCalories(),
                              ));
                        }
                      }
                      return const SizedBox(
                        height: 0,
                      );
                    },
                  );
                }));
          }),
    );
  }
}
