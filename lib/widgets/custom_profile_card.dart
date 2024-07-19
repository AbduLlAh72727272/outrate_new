import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'custom_asset_icon.dart';

class CustomProfileCard extends StatefulWidget {
  final String name;
  final String username;
  final String profileImageUrl;
  final List<String> imageUrls;
  final int likeCount;
  final int commentCount;
  final VoidCallback onActionPressed;

  const CustomProfileCard({
    Key? key,
    required this.name,
    required this.username,
    required this.profileImageUrl,
    required this.imageUrls,
    required this.likeCount,
    required this.commentCount,
    required this.onActionPressed,
  }) : super(key: key);

  @override
  _CustomProfileCardState createState() => _CustomProfileCardState();
}

class _CustomProfileCardState extends State<CustomProfileCard> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            children: [
              ListTile(
                leading: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.profileImageUrl),
                      radius: 20,
                    ),

                  ],
                ),
                title: Text(
                  widget.name,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  widget.username,
                  style: GoogleFonts.roboto(
                    color: Colors.grey,
                  ),
                ),
                trailing: IconButton(
                  icon: Image.asset(
                    'assets/icons/straight_action.png',
                    width: 30,
                    height: 30,
                  ),
                  onPressed: widget.onActionPressed,
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 350,
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  autoPlay: false,
                  enableInfiniteScroll: false, // Stops infinite loop
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: widget.imageUrls.map((url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Image.network(
                        url,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.imageUrls.length, (index) {
                  return Container(
                    width: _current == index ? 10.0 : 8.0,
                    height: _current == index ? 10.0 : 8.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Color(0xFFFF6600)
                          : Color(0xFFFF6600).withOpacity(0.5),
                    ),
                  );
                }),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 15,
            right: 15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFF6600).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Row(
                          children: [
                            AssetIcon(
                              assetName: 'assets/icons/like_icon.png',
                              color: Colors.black,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '${widget.likeCount}/5',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Row(
                        children: [
                          AssetIcon(
                            assetName: 'assets/icons/comment_icon.png',
                            color: Colors.black,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '${widget.commentCount}',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      AssetIcon(
                        assetName: 'assets/icons/share_icon.png',
                        color: Colors.black,
                      ),
                      SizedBox(width: 15),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}