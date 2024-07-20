// views/search_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:out_rate/themes/colors.dart';
import '../controllers/search_controller.dart' as custom;

class SearchScreen extends StatefulWidget {
  final void Function(int) onItemSelected;
  final String token;
  final List<int> recentUserIds; // Pass recent user IDs

  const SearchScreen({
    super.key,
    required this.onItemSelected,
    required this.token,
    required this.recentUserIds,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late custom.SearchController searchController;

  void _removeItem(int index) {
    setState(() {
      searchController.recentUsers.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    searchController = Get.put(custom.SearchController());
    searchController.token = widget.token;
    searchController.fetchRecentUsers(widget.recentUserIds); // Fetch recent users on init
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Returning false disables the back button
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              size: 16,
              Icons.arrow_back_ios_new,
              color: darkBackgroundColor,
            ),
            onPressed: () {
              widget.onItemSelected(0);
            },
          ),
          title: const Text(
            'Search',
            style: TextStyle(color: darkBackgroundColor, fontSize: 19),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
          child: Column(
            children: [
              TextField(
                controller: searchController.searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  suffixIcon: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8.0),
                    child: Image.asset(
                      'assets/icons/icon_search.png',
                    ),
                  ),
                  suffixIconConstraints:
                  const BoxConstraints(maxHeight: 32, maxWidth: 32),
                  filled: true,
                  fillColor: Color(0xFF9797BD).withOpacity(0.15),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Colors.transparent, // default border color
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Colors.transparent, // default border color
                    ),
                  ),
                ),
                onSubmitted: (query) {
                  searchController.searchUsers(query);
                },
              ),
              SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: darkBackgroundColor,
                      ),
                    ),
                    Text(
                      'See All',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() {
                if (searchController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: searchController.recentUsers.length,
                    itemBuilder: (context, index) {
                      final user = searchController.recentUsers[index];
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16)
                            .copyWith(right: 0),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              user.profilePicUrl ??
                                  'assets/images/dummy_1.png'),
                        ),
                        title: Text(user.username),
                        trailing: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            _removeItem(index);
                          },
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
