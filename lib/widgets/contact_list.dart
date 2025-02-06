import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/widgets/info.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10), // Reduce space
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
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
              contentPadding: const EdgeInsets.symmetric(vertical: 10), // Compact search bar
            ),
          ),
        ),
        const SizedBox(height: 15),

        Flexible(
          child: ListView.builder(
            itemCount: info.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0), // Reduce padding
                      child: ListTile(
                        dense: true, 
                        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                        title: Text(
                          info[index]['name'].toString(),
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500), 
                        ),
                        subtitle: Text(
                          info[index]['message'].toString(),
                          style: const TextStyle(fontSize: 14, color: Colors.grey), 
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: CircleAvatar(
                          radius: 25, // Smaller avatar
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(info[index]['profilePic'].toString()),
                        ),
                        trailing: Text(
                          info[index]['time'].toString(),
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
