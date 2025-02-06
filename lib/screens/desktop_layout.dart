import 'package:flutter/material.dart';
import 'package:whatsapp_ui/widgets/contact_list.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Column(
            children: [
              //WebaPPbar
             ContactList(),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.75,
            decoration:const  BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/backgroundImage.png'),fit: BoxFit.cover),
              
            ),
          )
        ],
      )
    );
  }
}