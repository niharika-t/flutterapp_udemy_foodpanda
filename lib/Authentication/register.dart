import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterapp_udemy_foodpanda/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();



  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
         children: [
           const SizedBox(height: 10,),
           InkWell(
             child: CircleAvatar(
               radius: MediaQuery.of(context).size.width * 0.20,
               backgroundColor: Colors.lightBlueAccent,
               backgroundImage: imageXFile==null ? null : FileImage(File(imageXFile!.path)),
               child: imageXFile == null
                   ?
                 Icon(
                   Icons.add_photo_alternate,
                   size: MediaQuery.of(context).size.width * 0.20,
                   color: Colors.cyanAccent,
                 ) : null,
             ),
           ),
           const  SizedBox(height: 10,),
           Form(
             key: _formKey,
             child: Column(
               children: [
                  CustomTextField(
                    data: Icons.people,
                    controller: nameController,
                    hintText: 'Name',
                    isObsecre: false,
                  ),
                 CustomTextField(
                   data: Icons.email,
                   controller: emailController,
                   hintText: 'Email',
                   isObsecre: false,
                 ),
                 CustomTextField(
                   data: Icons.lock,
                   controller: passwordController,
                   hintText: 'Password',
                   isObsecre: true,
                 ),
                 CustomTextField(
                   data: Icons.lock,
                   controller: confirmPasswordController,
                   hintText: 'Confirm Password',
                   isObsecre: true,
                 ),
                 CustomTextField(
                   data: Icons.phone,
                   controller: passwordController,
                   hintText: 'Phone',
                   isObsecre: true,
                 ),
                 CustomTextField(
                   data: Icons.my_location,
                   controller: locationController,
                   hintText: 'Cafe/Restaurant Address',
                   isObsecre: false,
                   enabled: false,
                 ),
                 Container(
                   width: 400,
                   height: 40,
                   alignment: Alignment.center,
                   child: ElevatedButton.icon(
                     label: const Text(
                       "Get my current location",
                       style: TextStyle(color: Colors.black),
                     ),
                     icon: const Icon(
                       Icons.location_on,
                       color: Colors.cyanAccent,
                     ),
                     onPressed: ()=> print("Clicked"),
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.grey,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),
           const SizedBox(height: 30,),
           ElevatedButton(
             child: const Text(
               "Sign Up",
               style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
             ),
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.yellowAccent,
             ),
             onPressed: ()=> print("clicked"),
           ),
           const SizedBox(height: 30,),
         ],
      ),
    );
  }
}
