import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keekz_application/utilities/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'local_widgets/indicator.dart';
import 'local_widgets/textField.dart';

class KeekzScreen extends StatefulWidget {
  static final String id = 'map_screen';
  @override
  _KeekzScreenState createState() => _KeekzScreenState();
}

class _KeekzScreenState extends State<KeekzScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _inputController = TextEditingController();
  String _keekzName;
  bool _autoValidate = true;
  final _picker = ImagePicker(); //added
  File _image1;
  File _image2;
  File _image3;
  String _caption = '';
  final int _numPages = 2;
  int _currentPage = 0;
  List<String> _filtersProperties;
  List<String> _filtersOccasions;

  @override
  void initState() {
    super.initState();
    _filtersProperties = <String>[];
    _filtersOccasions = <String>[];
    // _properties.sort();
  }

  List<KeekzProperties> _properties = <KeekzProperties>[
    const KeekzProperties('Idyllisch'),
    const KeekzProperties('Städtisch'),
    const KeekzProperties('Historisch'),
  ];
  List<KeekzOccasion> _occasion = <KeekzOccasion>[
    const KeekzOccasion('Spazieren'),
    const KeekzOccasion('Joggen'),
    const KeekzOccasion('Gassi gehen'),
    const KeekzOccasion('Entspannung'),
    const KeekzOccasion('Gegend erkunden'),
    const KeekzOccasion('Aussicht'),
    const KeekzOccasion('Sonnenuntergang'),
    const KeekzOccasion('Date'),
    const KeekzOccasion('Chillen'),
    const KeekzOccasion('Kultur'),
    const KeekzOccasion('Regional Essen'),
    const KeekzOccasion('See'),
    const KeekzOccasion('Picknick'),
  ];

  Iterable<Widget> get _keekzProperties sync* {
    for (KeekzProperties _keekzProperties in _properties) {
      yield Padding(
        padding: const EdgeInsets.all(0),
        child: FilterChip(
          avatar: CircleAvatar(
            child: Text("E"),
            backgroundColor: Colors.blueAccent,
          ),
          label: Text(_keekzProperties.name),
          labelPadding: EdgeInsets.symmetric(horizontal: 3),
          selectedColor: Colors.orangeAccent,
          elevation: 3.0,
          shadowColor: Colors.grey[60],
          padding: EdgeInsets.all(6.0),
          selected: _filtersProperties.contains(_keekzProperties.name),
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                _filtersProperties.add(_keekzProperties.name);
              } else {
                _filtersProperties.removeWhere((String name) {
                  return name == _keekzProperties.name;
                });
              }
            });
          },
        ),
      );
    }
  }

  Iterable<Widget> get _keekzOccasions sync* {
    for (KeekzOccasion _keekzOccasions in _occasion) {
      yield Padding(
        padding: const EdgeInsets.all(0),
        child: FilterChip(
          avatar: CircleAvatar(
            child: Text("A"), //Text(_keekzOccasions.name[0].toUpperCase()),
            backgroundColor: Colors.greenAccent,
          ),
          label: Text(_keekzOccasions.name),
          labelPadding: EdgeInsets.symmetric(horizontal: 3),
          selected: _filtersOccasions.contains(_keekzOccasions.name),
          //backgroundColor: Colors.greenAccent,
          selectedColor: Colors.orangeAccent,
          elevation: 3.0,
          shadowColor: Colors.grey[60],
          padding: EdgeInsets.all(6.0),
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                _filtersOccasions.add(_keekzOccasions.name);
              } else {
                _filtersOccasions.removeWhere((String name) {
                  return name == _keekzOccasions.name;
                });
              }
            });
          },
        ),
      );
    }
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage
          ? Indicator(isActive: true)
          : Indicator(isActive: false));
    }
    return list;
  }

  _androidDialog(String key) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Add Photo'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Take Photo'),
              onPressed: () => _handleImage(ImageSource.camera, key),
            ),
            SimpleDialogOption(
              child: Text('Choose From Gallery'),
              onPressed: () => _handleImage(ImageSource.gallery, key),
            ),
            SimpleDialogOption(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
              onPressed: () => {},
            ),
          ],
        );
      },
    );
  }

  _handleImage(ImageSource source, String key) async {
    Navigator.pop(context);
    PickedFile imageFile = await _picker.getImage(source: source);
    if (imageFile != null) {
      File imageTmp = await _cropImage(File(imageFile.path));
      setState(() {
        key == "1"
            ? _image1 = imageTmp
            : key == "2"
                ? _image2 = imageTmp
                : _image3 = imageTmp;
      });
    }
  }

  _cropImage(File imageFile) async {
    File croppedImage = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      androidUiSettings: AndroidUiSettings(
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          activeControlsWidgetColor: Colors.white,
          lockAspectRatio: false),
    );
    return croppedImage;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            color: kBlue, onPressed: () {}, icon: Icon(Icons.chevron_left)),
        title: Text(
          'KeekzCreation',
          style: TextStyle(
            color: kBlack,
            fontSize: 35.0,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _buildPageIndicator(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => {_androidDialog("1")},
                    child: Container(
                      height: width * 0.3,
                      width: width * 0.3,
                      color: Colors.grey[300],
                      child: _image1 == null
                          ? Icon(
                              Icons.add_a_photo,
                              color: Colors.white70,
                              size: 50.0,
                            )
                          : Image(
                              image: FileImage(_image1),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {_androidDialog("2")},
                    child: Container(
                      height: width * 0.3,
                      width: width * 0.3,
                      color: Colors.grey[300],
                      child: _image2 == null
                          ? Icon(
                              Icons.add_a_photo,
                              color: Colors.white70,
                              size: 50.0,
                            )
                          : Image(
                              image: FileImage(_image2),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {_androidDialog("3")},
                    child: Container(
                      height: width * 0.3,
                      width: width * 0.3,
                      color: Colors.grey[300],
                      child: _image3 == null
                          ? Icon(
                              Icons.add_a_photo,
                              color: Colors.white70,
                              size: 50.0,
                            )
                          : Image(
                              image: FileImage(_image3),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Form(
                autovalidateMode: _autoValidate
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    CustomTextField(
                      onSaved: (input) {
                        _keekzName = input;
                      },
                      validator: (input) => input.length < 4
                          ? 'Dein Name muss mindestens 4 Zeichen lang sein'
                          : input.length > 15
                              ? 'Dein Name darf maximal 15 Zeichen lang sein'
                              : null,
                      icon: Icon(MdiIcons.cookie),
                      hint: "Gib deinem Keekz einen Namen",
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 190,
                  color: Colors.grey[300],
                  child: Icon(Icons.map)),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 0,
                    children: _keekzProperties.toList(),
                  ),
                ),
              ),
              //Text("Anlass"),
              Divider(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 3,
                    runSpacing: 0,
                    children: _keekzOccasions.toList(),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text('Selected Properties: ${_filtersProperties.join(', ')}'),
              Text('Selected Occasions: ${_filtersOccasions.join(', ')}'),
              SizedBox(
                height: 40,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    style: ButtonStyle(),
                    child: Text("Weiter"),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Danke für deine Hilfe!')));
                      }
                      _formKey.currentState.save();
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class KeekzOccasion {
  const KeekzOccasion(this.name);
  final String name;
}

class KeekzProperties {
  const KeekzProperties(this.name);
  final String name;
}
