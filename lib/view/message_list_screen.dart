import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:out_rate/models/message_list_model.dart';
import 'package:out_rate/themes/colors.dart';
import 'package:out_rate/view/message_screen.dart';

class MessagesListScreen extends StatelessWidget {
  final List<MessageListModel> messages = [
    MessageListModel(
      name: 'Jessica Smith',
      message: 'Thanks I really appreciate it',
      time: '2 m ago',
      avatar: 'assets/images/dummy_1.png',
      isOnline: true,
      unreadMessages: 2,
    ),
    MessageListModel(
      name: 'Jake Pratt',
      message: 'Really am big fan of your design',
      time: '30 m ago',
      avatar: 'assets/images/dummy_1.png',
      isOnline: false,
      unreadMessages: 3,
    ),
    MessageListModel(
      name: 'Brian Robson',
      message: 'Let’s keep creating amazing things 😊',
      time: '42 m ago',
      avatar: 'assets/images/dummy_1.png',
      isOnline: true,
      unreadMessages: 0,
    ),
    MessageListModel(
      name: 'Julia Linwood',
      message: 'Mentioned you in their story',
      time: '1 h ago',
      avatar: 'assets/images/dummy_1.png',
      isOnline: false,
      unreadMessages: 0,
    ),
    MessageListModel(
      name: 'Anna Durand',
      message: 'Hello, I like your designs. I am searching for ...',
      time: '2 d ago',
      avatar: 'assets/images/dummy_1.png',
      isOnline: false,
      unreadMessages: 0,
    ),
    MessageListModel(
      name: 'John Dyson',
      message: 'I hope best for your journey and hope to ...',
      time: '3 d ago',
      avatar: 'assets/images/dummy_1.png',
      isOnline: false,
      unreadMessages: 0,
    ),
    MessageListModel(
      name: 'Mandy Robson',
      message: 'Mentioned you in their story',
      time: '1 w ago',
      avatar: 'assets/images/dummy_1.png',
      isOnline: false,
      unreadMessages: 0,
    ),
    MessageListModel(
      name: 'Terry Moore',
      message: 'You mentioned Terry in your story',
      time: '2 w ago',
      avatar: 'assets/images/dummy_1.png',
      isOnline: false,
      unreadMessages: 0,
    ),
  ];

  void _showBottomSheet(BuildContext context, MessageListModel message) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.15,
              child: Center(
                child: Text(
                  message.name,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                ListTile(
                  title: Text(
                    'Pin',
                    style: GoogleFonts.roboto(),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Handle Pin action
                  },
                ),
                ListTile(
                  title: Text(
                    'Delete',
                    style: GoogleFonts.roboto(),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Handle Delete action
                  },
                ),
                ListTile(
                  title: Text(
                    'Mute messages',
                    style: GoogleFonts.roboto(),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Handle Mute messages action
                  },
                ),
                ListTile(
                  title: Text(
                    'Mute calls',
                    style: GoogleFonts.roboto(),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Handle Mute calls action
                  },
                ),
              ],
            ),
          ],
        );
      },
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
          onPressed: () {},
        ),
        title: Text(
          'Messages',
          style: GoogleFonts.roboto(
              color: darkBackgroundColor,
              fontSize: 19,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/icons/icon_search.png',
              height: 24.0,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              print('Search button pressed');
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0).copyWith(top: 0),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return Column(
            children: [
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                tileColor: message.unreadMessages > 0
                    ? primaryColor.withOpacity(0.10)
                    : Colors.transparent,
                leading: Stack(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(message.avatar),
                    ),
                    if (message.isOnline)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 13,
                          height: 13,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
                title: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      message.name,
                      style: GoogleFonts.roboto(
                        color: message.unreadMessages > 0
                            ? primaryColor
                            : darkBackgroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      message.time,
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: message.unreadMessages > 0
                            ? primaryColor
                            : greyColor,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  message.message,
                  style: GoogleFonts.roboto(color: greyColor),
                ),
                trailing: message.unreadMessages > 0
                    ? Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${message.unreadMessages}',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      )
                    : null,
                onTap: () {
                  // Handle message tap
                  Get.to(() => ChatScreen());
                },
                onLongPress: () {
                  _showBottomSheet(context, message);
                },
              ),
              Container(
                color: Color(0XFF9797BD).withOpacity(.2),
                width: MediaQuery.of(context).size.width,
                height: 1,
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {
          // Handle FAB action
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
