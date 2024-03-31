import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/models/images.dart';
import 'package:project/main.dart';

const String IMAGES_COLLECTION_REF = "Images";

class ImagesDBService{
  final _firestore = FirebaseFirestore.instanceFor(app: app);
  late final CollectionReference _imagesRef;

  ImagesDBService(){
    _imagesRef = fireStore.collection(IMAGES_COLLECTION_REF).withConverter<Images>(
      fromFirestore: (snapshots, _) => Images.fromJson(
        snapshots.data()!,
      ),
      toFirestore: (images, _) => images.toJson());
  }

  Stream<QuerySnapshot> getImage() {
    return _imagesRef.snapshots();
  }

  Future<String?> getUrl(String docName) async {
    try {
      var snapshot = await _imagesRef.doc(docName).get();
      if (snapshot.exists) {
        var imageData = snapshot.data();
        if (imageData != null) {
          var image = imageData as Images;
          return image.getUrl();
        }
      }
    } catch (e) {
      print("Error getting url: $e");
    }
    return null;
  }

    Future<String?> getName(String docName) async {
    try {
      var snapshot = await _imagesRef.doc(docName).get();
      if (snapshot.exists) {
        var imageData = snapshot.data();
        if (imageData != null) {
          var image = imageData as Images;
          return image.getName();
        }
      }
    } catch (e) {
      print("Error getting image name: $e");
    }
    return null;
  }
}