import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

class CreatePostView extends StatefulWidget {
  @override
  _CreatePostViewState createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _captionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    await Permission.photos.request();
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<List<File>> _fetchRecentImages() async {
    final PermissionState permissionState = await PhotoManager.requestPermissionExtend();
    if (permissionState != PermissionState.authorized && permissionState != PermissionState.limited) {
      return [];
    }

    final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      filterOption: FilterOptionGroup(
        orders: [
          OrderOption(type: OrderOptionType.createDate, asc: false),
        ],
      ),
    );

    final AssetPathEntity? recentAlbum = albums.isNotEmpty ? albums.first : null;
    if (recentAlbum == null) {
      return [];
    }

    final List<AssetEntity> recentImages = await recentAlbum.getAssetListPaged(page: 0, size: 100);

    final List<File> imageFiles = [];
    for (final AssetEntity asset in recentImages) {
      final File? file = await asset.file;
      if (file != null) {
        imageFiles.add(file);
      }
    }

    return imageFiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CupertinoNavigationBarBackButton(
          color: Colors.black,
        ),
        title: Text(
          'New Post',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle the post action
            },
            child: Text(
              'Next',
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _selectedImage != null
                ? Image.file(
              _selectedImage!,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            )
                : Container(
              width: double.infinity,
              height: 250,
              color: Colors.grey[200],
              child: Icon(
                Icons.camera_alt,
                color: Colors.grey[800],
                size: 100,
              ),
            ),
            ListTile(
              title: Text('New Post'),
            ),
            if (_selectedImage != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _captionController,
                      decoration: InputDecoration(
                        hintText: 'Write your caption here...',
                      ),
                    ),
                  ],
                ),
              ),
            if (_selectedImage == null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _pickImage(ImageSource.camera),
                    child: Text('Camera'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    child: Text('Gallery'),
                  ),
                ],
              ),
            if (_selectedImage == null)
              FutureBuilder<List<File>>(
                future: _fetchRecentImages(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error fetching images');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text('No recent images');
                  }

                  final recentImages = snapshot.data!;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: recentImages.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                    ),
                    itemBuilder: (context, index) {
                      final image = recentImages[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedImage = image;
                          });
                        },
                        child: Image.file(image, fit: BoxFit.cover),
                      );
                    },
                  );
                },
              ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle the share action
            final caption = _captionController.text;
            // Perform the share action with _selectedImage and caption
          },
          child: Text('Share'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xffFF6600),
            minimumSize: Size(double.infinity, 50),
          ),
        ),
      ),
    );
  }
}
