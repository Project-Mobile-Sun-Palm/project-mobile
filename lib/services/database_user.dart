import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/models/account.dart';
import 'package:project/main.dart';

const String ACCOUNT_COLLECTION_REF = "User";

class DatabaseUser {
  final _firestore = FirebaseFirestore.instanceFor(app: app);

  late final CollectionReference _accountsRef;

  DatabaseUser() {
    _accountsRef =
        _firestore.collection(ACCOUNT_COLLECTION_REF).withConverter<Account>(
            fromFirestore: (snapshots, _) => Account.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (account, _) => account.toJson());
  }

  Stream<QuerySnapshot> getAccounts() {
    return _accountsRef.snapshots();
  }

  void addAccount(Account account) async {
    _accountsRef.add(account);
  }

  void updateAccount(String accountID, Account account) {
    _accountsRef.doc(accountID).update(account.toJson());
  }

  void updateBMI(String accountID, double bmi) {
    getAll(accountID).then((value) => {
      value?.setBMI(bmi),
      updateAccount(accountID, value ?? Account("NoUsername", "NoEmail"))
    });
  }

  void deleteAccount(String accountID) {
    _accountsRef.doc(accountID).delete();
  }

  Future<Account?> getAll(String userId) async {
    try {
      var snapshot = await _accountsRef.doc(userId).get();
      if (snapshot.exists) {
        var accountData = snapshot.data();
        if (accountData != null) {
          var account = accountData as Account;
          return account;
        }
      }
    } catch (e) {
      print("Error getting username: $e");
    }
    return null;
  }

  Future<String?> getUsername(String userId) async {
    try {
      var snapshot = await _accountsRef.doc(userId).get();
      if (snapshot.exists) {
        var accountData = snapshot.data();
        if (accountData != null) {
          var account = accountData as Account;
          return account
              .getUsername();
        }
      }
    } catch (e) {
      print("Error getting username: $e");
    }
    return null;
  }

  Future<String?> getEmail(String userId) async {
    try {
      var snapshot = await _accountsRef.doc(userId).get();
      if (snapshot.exists) {
        var accountData = snapshot.data();
        if (accountData != null) {
          var account = accountData as Account;
          return account
              .getEmail();
        }
      }
    } catch (e) {
      print("Error getting username: $e");
    }
    return null;
  }

  Future<double?> getTime(String userId) async {
    try {
      var snapshot = await _accountsRef.doc(userId).get();
      if (snapshot.exists) {
        var accountData = snapshot.data();
        if (accountData != null) {
          var account = accountData as Account;
          return account
              .getTime();
        }
      }
    } catch (e) {
      print("Error getting username: $e");
    }
    return null;
  }

  Future<double?> getBmi(String userId) async {
    try {
      var snapshot = await _accountsRef.doc(userId).get();
      if (snapshot.exists) {
        var accountData = snapshot.data();
        if (accountData != null) {
          var account = accountData as Account;
          return account
              .getBmi();
        }
      }
    } catch (e) {
      print("Error getting username: $e");
    }
    return null;
  }

  Future<double?> getCalories(String userId) async {
    try {
      var snapshot = await _accountsRef.doc(userId).get();
      if (snapshot.exists) {
        var accountData = snapshot.data();
        if (accountData != null) {
          var account = accountData as Account;
          return account
              .getCalories();
        }
      }
    } catch (e) {
      print("Error getting username: $e");
    }
    return null;
  }
}
