import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/widgets/contact_list.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
   int _currentIndex = 0;

  final List<Widget> _screens = [
    const ContactList(),
    const Center(child: Text('Status', style: TextStyle(color: Colors.white))),
    const Center(child: Text('Communities', style: TextStyle(color: Colors.white))),
    const Center(child: Text('Calls', style: TextStyle(color: Colors.white))),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, 
    child: Scaffold(
      appBar: AppBar(
        elevation:0,
        scrolledUnderElevation: 0,
        backgroundColor: backgroundColor,
        title: const Text('WhatsApp',style: TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.w600,
        ),
        ),

        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code_scanner_outlined, color: Colors.white,)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined,color: Colors.white,)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, color: Colors.white,))
        ],
      ),

      body: _screens[_currentIndex],
      floatingActionButton: FloatingActionButton(onPressed: (){},
      backgroundColor:const Color.fromARGB(255, 10, 228, 35),
      child: const Icon(Icons.add_comment_sharp, color: Colors.black,),),
      bottomNavigationBar: Container(
        height: 70.0,
        color: backgroundColor,
        
        
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex=index;
            });
          } ,
          selectedItemColor: const Color.fromRGBO(203, 249, 207,1 ) ,
          unselectedItemColor: Colors.white,
          iconSize: 25.0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: const[
             BottomNavigationBarItem(
              
              icon: Icon(Icons.chat),
              label: "Chats",
            
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.update),
              label: "Status",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.groups_2_outlined),
              label: "Communities",
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: "Calls",
            ),
          ],
        ),
      ),
      ),

    );
    

}
}