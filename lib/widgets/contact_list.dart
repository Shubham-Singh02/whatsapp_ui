import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/screens/mobile_chat_screen.dart';
import 'package:whatsapp_ui/info.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final List<Map<String,dynamic>> _allUsers=info;

  List<Map<String,dynamic>> _foundUsers=[];
  @override
  void initState() {
    _foundUsers=_allUsers;
    super.initState();
  }
  void _runFilter(String eneteredKeyword){
    List<Map<String,dynamic>> results=[];
    if (eneteredKeyword.isEmpty){
      results=_allUsers;
    }
    else{
      results=_allUsers
      .where((info)=>info["name"].toLowerCase().contains(eneteredKeyword.toLowerCase())).toList();
    }
    setState(() { _foundUsers = results; });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10), // Reduce space
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            onChanged: (value) => _runFilter(value),
            decoration: InputDecoration(
              hintText: 'Ask Beta AI or Search',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(color: searchBarColor),
              ),
              fillColor: searchBarColor,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(color: searchBarColor),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10), 
            ),
          ),
        ),
        const SizedBox(height: 15),

        Flexible(
          child: ListView.builder(
            itemCount: _foundUsers.length,
            itemBuilder: (context, index) {
              
             return Column(
              
                children: [
                  InkWell(
                    onTap: () {
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return MobileChatScreen(
                      index: index,
                      image: NetworkImage(info[index]['profilePic'].toString()),
                    );
                  },));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0), 
                      child: ListTile(
                        dense: true, 
                        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                        title: Text(
                          _foundUsers[index]['name'].toString(),
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500), 
                        ),
                        subtitle: Text(
                          _foundUsers[index]['message'].toString(),
                          style: const TextStyle(fontSize: 14, color: Colors.grey), 
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: CircleAvatar(
                          radius: 25, 
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(_foundUsers[index]['profilePic'].toString()),
                        ),
                        trailing: Text(
                          _foundUsers[index]['time'].toString(),
                          style: const TextStyle(color: Colors.grey, fontSize: 13), 
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    color: dividerColor,
                    indent: 60, 
                    thickness: 0.5, 
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
