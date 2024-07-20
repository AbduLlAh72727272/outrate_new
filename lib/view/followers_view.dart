import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FollowersView extends StatefulWidget {
  const FollowersView({Key? key}) : super(key: key);

  @override
  _FollowersViewState createState() => _FollowersViewState();
}

class _FollowersViewState extends State<FollowersView> {
  bool isPendingRequestsSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.back, color: Colors.black),
          onPressed: () {
            // Handle back action
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Brian David',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Handle more actions
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isPendingRequestsSelected = false;
                      });
                      // Handle Followers tab action
                    },
                    child: Column(
                      children: [
                        Text(
                          '300k Followers',
                          style: TextStyle(
                            color: isPendingRequestsSelected
                                ? Colors.grey
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 2,
                          width: 80,
                          color: isPendingRequestsSelected
                              ? Colors.transparent
                              : Colors.black,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isPendingRequestsSelected = false;
                      });
                      // Handle Following tab action
                    },
                    child: Column(
                      children: [
                        Text(
                          '130 Following',
                          style: TextStyle(
                              color: isPendingRequestsSelected
                                  ? Colors.grey
                                  : Colors.grey),
                        ),
                        Container(
                          height: 2,
                          width: 30,
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isPendingRequestsSelected = true;
                      });
                      // Handle Pending Requests tab action
                    },
                    child: Column(
                      children: [
                        Text(
                          'Pending Requests',
                          style: TextStyle(
                            color: isPendingRequestsSelected
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                        Container(
                          height: 2,
                          width: 30,
                          color: isPendingRequestsSelected
                              ? Colors.black
                              : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Replace with your dynamic count
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/dummy_1.png'),
                  ),
                  title: const Text('Julia Linwood'),
                  trailing: isPendingRequestsSelected
                      ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xffFF6600),
                         // side: BorderSide(color: Colors.green.shade300),
                        ),
                        onPressed: () {
                          // Handle confirm request action
                        },
                        child: const Text('Confirm'),
                      ),
                      SizedBox(width: 8),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.grey,
                          side: BorderSide(color: Colors.grey),
                        ),
                        onPressed: () {
                          // Handle delete request action
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  )
                      : TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    onPressed: () {
                      // Handle remove follower action
                    },
                    child: const Text('Remove'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
