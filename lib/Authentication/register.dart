import 'package:flutter/material.dart';
import 'package:flutterapp_udemy_foodpanda/widgets/custom_text_field.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

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

  Position? _position;
  List<Placemark>? placeMarks;

  getCurrentLocation() async
  {
    Position newPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    var position = newPosition;
    placeMarks = await placemarkFromCoordinates(
      position!.latitude,
      position!.longitude,
    );

    Placemark pMark = placeMarks![0];

    String completeAdd = '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality} ${pMark.locality}, ${pMark.subAdministrativeArea}, ${pMark.administrativeArea} ${pMark.postalCode}, ${pMark.country}';

    locationController.text = completeAdd;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
         children: [
           const SizedBox(height: 10,),
           Container(
             alignment: Alignment.bottomCenter,
             child: CircleAvatar(
               radius: 80,
               backgroundColor: Colors.transparent,
               child: ClipOval(
                 child: Image.asset(
                   'images/cafe.jpeg',
                   fit: BoxFit.cover,
                   width: 250,
                   height: 250,
                 ),
               ),
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
                     onPressed: ()
                     {
                       getCurrentLocation();
                     },
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
               backgroundColor: Colors.white,
             ),
             onPressed: ()=> print("clicked"),
           ),
           const SizedBox(height: 30,),
         ],
      ),
    );
  }
}
