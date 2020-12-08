import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

class MediaGrid extends StatefulWidget {
  @override
  _MediaGridState createState() => _MediaGridState();
}

class _MediaGridState extends State<MediaGrid> {
  List<Widget> _mediaList = [];
  int currentPage = 0;
  int lastPage;
  File image;
  final _picker = ImagePicker();
  bool _chosen = false;

  @override
  void initState() {
    super.initState();
    _fetchNewMedia();
  }

  _handleImage(ImageSource source) async {
    //Navigator.pop(context);
    PickedFile imageFile = await _picker.getImage(source: source);
    if (imageFile != null) {
      File imageTmp =
          File(imageFile.path); //await _cropImage(File(imageFile.path));
      setState(() {
        image = imageTmp;
      });
    }
  }

  _handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        _fetchNewMedia();
      }
    }
  }

  _fetchNewMedia() async {
    lastPage = currentPage;
    var result = await PhotoManager.requestPermission();
    if (result) {
      // success
//load the album list
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
          onlyAll: true, type: RequestType.image);
      print(albums);
      List<AssetEntity> media =
          await albums[0].getAssetListPaged(currentPage, 60);
      print(media);
      List<Widget> temp = [];
      for (var asset in media) {
        temp.add(
          FutureBuilder(
            future: asset.thumbDataWithSize(200, 200),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done)
                return GestureDetector(
                    onTap: () async {
                      image = asset.type == AssetType.video
                          ? null
                          : await asset.file;
                      print("Tap");
                      setState(() {
                        _chosen = true;
                      });
                      //upload file to firebase
                    },
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Image.memory(
                            snapshot.data,
                            fit: BoxFit.cover,
                            // fit: _chosen ? null : BoxFit.cover,
                          ),
                        ),
                        if (asset.type == AssetType.video)
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 5, bottom: 5),
                              child: Icon(
                                Icons.videocam,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ));
              return Container();
            },
          ),
        );
      }
      setState(() {
        _mediaList.addAll(temp);
        currentPage++;
      });
    } else {
      // fail
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            _handleImage(ImageSource.camera);
          },
          backgroundColor: Colors.orangeAccent,
          child: new Icon(Icons.photo_camera),
          elevation: 4.0,
        ),
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text("Keekz"),
        ),
        body: Column(children: [
          Container(
            child: image == null
                ? GestureDetector(
                    onTap: () => {_handleImage(ImageSource.camera)},
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.black,
                      size: 100.0,
                    ),
                  )
                : Image(
                    image: FileImage(image),
                    fit: BoxFit.cover,
                  ),
            width: 500,
            height: 300,
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scroll) {
                _handleScrollEvent(scroll);
                return;
              },
              child: GridView.builder(
                  itemCount: _mediaList.length,
                  padding: EdgeInsets.all(0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: _mediaList[index],
                      onTap: () => {print(index.toString())},
                    );
                  }),
            ),
          )
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }
}
