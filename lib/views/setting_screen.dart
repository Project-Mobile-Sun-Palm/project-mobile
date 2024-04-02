import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:project/services/auth.dart';
import 'package:project/services/database_users.dart';
import 'package:image_picker/image_picker.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  TextEditingController usernameController = TextEditingController();
  late String username = "";
  Uint8List? _image;
  File? selectedImage;

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.blue[100],
      context: context, builder: (builder) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/4.5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(Icons.image, size: 70,),
                          Text("Gallery")
                        ],
                      ),
                    ),
                  ),
                ),
          
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromCamera();
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(Icons.camera_alt, size: 70,),
                          Text("Camera")
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Future _pickImageFromGallery() async {
    final returnImage = 
      await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
        _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.pop(context);
  }

    Future _pickImageFromCamera() async {
    final returnImage = 
      await ImagePicker().pickImage(source: ImageSource.camera);
      if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
        _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60,),

            Row(
              children: [
                Text("   "),

                IconButton(
                  onPressed: goBack, 
                  icon: const Icon(Icons.arrow_back, size: 28, color: Colors.black,)
                ),

                const Text(" Setting", style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),

            const SizedBox(
              height: 100,
            ),

            Stack(
              children: [
                _image != null ?
                  CircleAvatar(
                    radius: 75,
                    backgroundImage: MemoryImage(_image!),
                  ) :
                const CircleAvatar(
                  radius:  75,
                  backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3Z1x2Gh1fwbXhqvNekPS4DfWm0rdweKQjA&usqp=CAU"
                  ),
                ),

                Positioned(
                  bottom: -3,
                  left: 98,
                  child: IconButton(
                    onPressed: () {
                      showImagePickerOption(context);
                    },
                    icon: const Icon(Icons.add_a_photo, size: 32,),
                  ),
                )
                
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            InkWell(
              onTap: () {
                print("updateImage");
                DatabaseUser().updateImage(Auth().currentUser!.uid, _image!);
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.deepOrange
                ),
                child: const Center(
                  child: Text("Save Profile", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),),
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),


            SizedBox(
              height: 70,
              width: 390,
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Username',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange)
                  )
                ),
              ),
            ),
 
            const SizedBox(
              height: 15,
            ),

            InkWell(
              onTap: () {
                username = usernameController.text;
                setState(() {
                  DatabaseUser().updateUsername(Auth().currentUser!.uid, username);
                });
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.deepOrange
                ),
                child: const Center(
                  child: Text("Save Username", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),),
                ),
              ),
            )
        ],
      )
    );
  }

  void goBack() {
    Navigator.pushNamed(context, '/bottomnavbar');
  }
}