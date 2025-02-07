import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';

class MyMessageCard extends StatelessWidget {
  final String message;
  final String date;
  
  const MyMessageCard({super.key, required this.message, required this.date});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 60, 
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), 
          ),
          color: messageColor,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), 
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Stack(
              children: [
                /// **Message Text**
                Padding(
                  padding: const EdgeInsets.only(bottom: 20), 
                  child: Text(
                    message,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Row(
                    children: [
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white60,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(Icons.done_all, color: Colors.blue, size: 18),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
  
    );
    
  }
}
