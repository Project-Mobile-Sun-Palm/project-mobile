import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/models/account.dart';
import 'package:project/services/auth.dart';
import 'package:project/services/database_services.dart';
import 'package:project/services/database_users.dart';
import 'package:project/views/login_screen.dart';
import 'package:project/models/todo.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _textEditingController = TextEditingController();

  final DatabaseService _databaseService = DatabaseService();
  final DatabaseUser _databaseUser = DatabaseUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: Auth().authStateChanges,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return LogInScreen();
              } else {
                return LogInScreen();
              }
            }));
  }

  Widget _messagesListView() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.80,
      width: MediaQuery.sizeOf(context).width,
      child: StreamBuilder(
        stream: _databaseService.getTodos(),
        builder: (context, snapshot) {
          List todos = snapshot.data?.docs ?? [];
          if (todos.isEmpty) {
            return const Center(
              child: Text("Add a todo!"),
            );
          }
          return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                Todo todo = todos[index].data();
                String todoId = todos[index].id;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: ListTile(
                    tileColor: Theme.of(context).colorScheme.primaryContainer,
                    title: Text(todo.task),
                    subtitle: Text(
                      todo.updatedOn.toDate().toString(),
                    ),
                    trailing: Checkbox(
                      value: todo.isDone,
                      onChanged: (value) {
                        Todo updatedTodo = todo.copyWith(
                            isDone: !todo.isDone, updatedOn: Timestamp.now());
                        _databaseService.updateTodo(todoId, updatedTodo);
                      },
                    ),
                    onLongPress: () {
                      _databaseService.deleteTodo(todoId);
                    },
                  ),
                );
              });
        },
      ),
    );
  }

  void _displayTextInputDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Add a Account"),
            content: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(hintText: "Account...."),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Account account = Account(_textEditingController.text,
                        _textEditingController.text);
                    _databaseUser.addAccount(account);
                    Navigator.pop(context);
                    _textEditingController.clear();
                  },
                  child: Text("OK!"))
            ],
          );
        });
  }

  Widget _ShowALLAccount() {
    return SizedBox(
      child: StreamBuilder(
        stream: _databaseUser.getAccounts(),
        builder: (context, snapshot) {
          List accounts = snapshot.data?.docs ?? [];
          if (accounts.isEmpty) {
            return const Center(
              child: Text("Add a accounts!"),
            );
          }
          return ListView.builder(
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                Account account = accounts[index].data();
                String accountID = accounts[index].id;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: ListTile(
                    tileColor: Theme.of(context).colorScheme.primaryContainer,
                    title: Text(account.getUsername()),
                    subtitle: Text(account.getEmail()),
                    onLongPress: () {
                      _databaseUser.deleteAccount(accountID);
                    },
                  ),
                );
              });
        },
      ),
    );
  }
}
