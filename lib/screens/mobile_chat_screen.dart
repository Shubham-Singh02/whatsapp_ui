import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/info.dart';
import 'package:whatsapp_ui/widgets/chat_list.dart';

class MobileChatScreen extends StatelessWidget {
  final int index;
  final ImageProvider<Object> image;
  const MobileChatScreen({super.key, required this.index,required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text(info[index]["name"].toString(), style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 19,
        ),
        ),
        leadingWidth: 85,
        leading:  Row(
            children: [
              IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context); 
        },
              ),
              CircleAvatar(
        radius: 18, 
        backgroundImage: image,
              ),
            ],
          ),
          actions: [
           IconButton(onPressed: () {}, icon: const Icon(Icons.videocam, color: Colors.white,)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call,color: Colors.white,)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, color: Colors.white,))
          ],
        
      ),
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgroundImage.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const ChatList(),

                Container(
                  color: backgroundColor,
                  height: 60.0,
                  child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 6.0,bottom: 6.0,),
                        child: TextField(
                           decoration: InputDecoration(
                                      hintText: 'Message',
                                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
                                      prefixIcon: const Padding(
                                        padding:  EdgeInsets.only(bottom: 5.0),
                                        child:  Icon(Icons.emoji_emotions_outlined, color: Colors.grey, size: 25),
                                      ),
                                      suffixIcon: const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        
                                        children: [
                                        Icon(Icons.attach_file_sharp, color: Colors.grey, size: 25),
                                        SizedBox(width: 10.0,),
                                        Icon(Icons.currency_rupee, color: Colors.grey, size: 25),
                                        SizedBox(width: 10.0,),
                                        Icon(Icons.camera_alt_outlined, color: Colors.grey, size: 25),
                                        SizedBox(width: 10.0,)
                                        ]
                                      ),
                                      
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                        borderSide: const BorderSide(color: Color.fromRGBO(30, 43, 49, 1)),
                                      ),
                                      fillColor: const Color.fromRGBO(30, 43, 49, 1),
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                        borderSide: const BorderSide(color: Color.fromRGBO(30, 43, 49, 1)),
                                      ),
                                      
                                    ),),
                      ),
                    ),

                    const Padding(
                      padding:  EdgeInsets.only(left:6.0, right: 8.0),
                      child:  CircleAvatar(
                        radius: 25,
                        backgroundColor: Color.fromARGB(255, 10, 228, 35),
                        child: Icon(Icons.mic,color: Colors.black,),
                      ),
                    )

                    
                    
                  ],
                                ),
                ),
            
          ],
        )),

    );
    
  }
}
