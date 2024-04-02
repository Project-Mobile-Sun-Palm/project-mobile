import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project/models/account.dart';
import 'package:project/main.dart';

const String ACCOUNT_COLLECTION_REF = "User";

class DatabaseUser {
  final _firestore = FirebaseFirestore.instanceFor(app: app);
  final _storage = FirebaseStorage.instanceFor(app: app);

  late final CollectionReference _accountsRef;
  late String imageUrl;

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

  void updateCalories(String accountID, double calories) {
    getAll(accountID).then((value) => {
      value?.setCalories(calories),
      updateAccount(accountID, value ?? Account("NoUsername", "NoEmail"))
    });
  }

  void updateUsername(String accountID, String username) {
    getAll(accountID).then((value) => {
      value?.setUsername(username),
      updateAccount(accountID, value ?? Account("NoUsername", "NoEmail"))
    });
  }

  void updateTime(String accountID, double time) {
    getAll(accountID).then((value) => {
      value?.setTime(time),
      updateAccount(accountID, value ?? Account("NoUsername", "NoEmail"))
    });
  }
  
  void updateImage(String accountID, Uint8List image) async {
      String imageUrl = await uploadImageToStorage("profile", image);
      getAll(accountID).then((value) => {
      value?.setImage(imageUrl),
      updateAccount(accountID, value ?? Account("NoUsername", "NoEmail"))
    });
  }

  void updateHistoryKey(String accountID, String historyKey) async {
      getAll(accountID).then((value) => {
      value?.addHistoryKey(historyKey),
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

  Future<String?> getImage(String userId) async {
    try {
      var snapshot = await _accountsRef.doc(userId).get();
      if (snapshot.exists) {
        var accountData = snapshot.data();
        if (accountData != null) {
          var account = accountData as Account;
          return account
              .getImagePath();
        }
      }
    } catch (e) {
      print("Error getting username: $e");
    }
    return null;
  }

  Future<List?> getHistoryKey(String userId) async {
    try {
      var snapshot = await _accountsRef.doc(userId).get();
      if (snapshot.exists) {
        var accountData = snapshot.data();
        if (accountData != null) {
          var account = accountData as Account;
          return account
              .getHistoryKey();
        }
      }
    } catch (e) {
      print("Error getting username: $e");
    }
    return null;
  }

  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

}
