import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:out_rate/models/message_model.dart';
import 'package:out_rate/themes/colors.dart';

class ChatScreen extends StatelessWidget {
  final List<Message> messages = [
    Message(
      sender: 'Brian',
      text: 'Hi David I saw your work and really am a big fan of your design',
      time: 'Thursday 12:40 AM',
      isSentByMe: false,
    ),
    Message(
      sender: 'David',
      text: 'Thank you! 😊',
      time: '',
      isSentByMe: true,
    ),
    Message(
      sender: 'Brian',
      text: 'Are you free for UI work?',
      time: '',
      isSentByMe: false,
    ),
    Message(
      sender: 'David',
      text: 'I have no availability before September',
      time: '',
      isSentByMe: true,
    ),
    Message(
      sender: 'Brian',
      text: 'We need some urgent basis. Thanks',
      time: '',
      isSentByMe: false,
    ),
    Message(
      sender: 'David',
      text: 'Maybe for a next project alors!',
      time: '',
      isSentByMe: true,
    ),
  ];
  BorderRadius _getMessageBorderRadius(bool isSentByMe) {
    return BorderRadius.circular(20).copyWith(
      topLeft: Radius.circular(20),
      topRight: isSentByMe ? Radius.circular(0) : Radius.circular(20),
      bottomLeft: isSentByMe ? Radius.circular(20) : Radius.circular(0),
      bottomRight: Radius.circular(20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor.withOpacity(0.2),
        leading: IconButton(
          icon: const Icon(
            size: 16,
            Icons.arrow_back_ios_new,
            color: darkBackgroundColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/dummy_1.png'), // Replace with your image asset
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Brian',
                  style: GoogleFonts.roboto(
                    color: darkBackgroundColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Active today',
                  style: GoogleFonts.roboto(
                    color: greyColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              height: 20,
              width: 20,
              'assets/icons/audio_call_icon.png',
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              height: 24,
              width: 24,
              'assets/icons/video_call_icon.png',
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Column(
                  crossAxisAlignment: message.isSentByMe
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    if (message.time.isNotEmpty)
                      Center(
                        child: Text(
                          message.time,
                          style: GoogleFonts.roboto(
                            color: greyColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: message.isSentByMe
                            ? primaryColor
                            : Color(0XFF0000FF).withOpacity(0.1),
                        borderRadius:
                            _getMessageBorderRadius(message.isSentByMe),
                      ),
                      child: Text(
                        message.text,
                        style: GoogleFonts.roboto(
                          color: message.isSentByMe
                              ? Colors.white
                              : darkBackgroundColor,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Message',
                      fillColor: primaryColor.withOpacity(0.1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          height: 36,
                          width: 36,
                          'assets/icons/picture_message_icon.png',
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          height: 24,
                          width: 24,
                          'assets/icons/send_icon.png',
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(width: 8),
                // FloatingActionButton(
                //   onPressed: () {
                //     // Handle send action
                //   },
                //   backgroundColor: primaryColor,
                //   child: Icon(
                //     Icons.send,
                //     color: Colors.white,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
