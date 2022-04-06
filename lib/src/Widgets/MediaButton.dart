/*import 'dart:io';
import 'package:flutter/material.dart';

enum TypeMedia{
  GALLERY,
  CAMERA,
  VIDEO,
  DOCUMENT,
  AUDIO,
  IMAGEAUDIO,
  ANY
}

class MediaButton extends StatelessWidget{

  final Function onSelect;
  final TypeMedia type;
  final bool expanded;

  File? _currentFile;

  MediaButton({
    required this.onSelect,
    required this.type,
    this.expanded = false
  });

  File? get lastFile => _currentFile;

  @override
  Widget build(BuildContext context) {

    return (this.expanded)
        ? _expandedButton(context)
        : _flatButton(context);
  }

  Widget _expandedButton(context){
    return GestureDetector(
      onTap: this.type != null ? () => _openModal(context) : null,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.03),
              border: Border.all(
                  color: Colors.black12,
                  style: BorderStyle.solid,
                  width: 3
              ),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Text("Sin archivos", style: TextStyle(color: Colors.grey),)
      ),
    );
  }

  Widget _flatButton(context){
    return FlatButton.icon(
      onPressed: this.type != null ? () => _openModal(context) : null,
      color: Colors.green,
      label: Text('AGREGAR ARCHIVOS'),
      icon: Icon(Icons.attach_file),
      textColor: Colors.white,
      hoverColor: Colors.white,
      disabledColor: Colors.grey,
    );
  }

  void _openModal(context){

    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Seleccione archivos',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                fontFamily: 'arial',
                fontSize: 15.0,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.left,),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Visibility(
                    visible: this.type == TypeMedia.CAMERA ||
                        this.type == TypeMedia.ANY ||
                        this.type == TypeMedia.IMAGEAUDIO,
                    child: ListTile(
                      trailing: Icon(Icons.camera_alt, color: Colors.purple,),
                      title: Text('Cámara'),
                      subtitle: _drawLine(),
                      onTap: () async {
                        _currentFile = await ImagePicker.pickImage(source: ImageSource.camera);
                        if(_currentFile != null)
                          onSelect(_currentFile);
                        Navigator.of(context, rootNavigator: true).pop('dialog');
                      },
                    ),
                  ),
                  Visibility(
                    visible: this.type == TypeMedia.GALLERY ||
                        this.type == TypeMedia.ANY ||
                        this.type == TypeMedia.IMAGEAUDIO ||
                        this.type == TypeMedia.CAMERA,
                    child: ListTile(
                      trailing: Icon(Icons.image, color: Colors.purple,),
                      title: Text('Galería'),
                      subtitle: _drawLine(),
                      onTap: () async {
                        _currentFile = await ImagePicker.pickImage(source: ImageSource.gallery);
                        if(_currentFile != null)
                          onSelect(_currentFile);
                        Navigator.of(context, rootNavigator: true).pop('dialog');
                      },
                    ),
                  ),
                  Visibility(
                    visible: this.type == TypeMedia.VIDEO || this.type == TypeMedia.ANY,
                    child: ListTile(
                      trailing: Icon(Icons.video_library, color: Overskull.purple,),
                      title: Text('Video'),
                      subtitle: _drawLine(),
                      onTap: () async {
                        _currentFile = await ImagePicker.pickVideo(source: ImageSource.camera);
                        if(_currentFile != null)
                          onSelect(_currentFile);
                        Navigator.of(context, rootNavigator: true).pop('dialog');
                      },
                    ),
                  ),
                  Visibility(
                    visible: this.type == TypeMedia.DOCUMENT || this.type == TypeMedia.ANY,
                    child: ListTile(
                      trailing: Icon(Icons.insert_drive_file, color: Overskull.purple,),
                      title: Text('Documento'),
                      subtitle: _drawLine(),
                      onTap: () async {
                        _currentFile = await FilePicker.getFile(type: FileType.ANY);
                        /*if(_currentFile != null && _currentFile.path.split('.').last.toLowerCase() == 'pdf') {*/
                          onSelect(_currentFile);
                        /*} else {
                          show
                        }*/
                        Navigator.of(context, rootNavigator: true).pop('dialog');
                      },
                    ),
                  ),
                  Visibility(
                    visible: this.type == TypeMedia.AUDIO ||
                        this.type == TypeMedia.ANY ||
                        this.type == TypeMedia.IMAGEAUDIO,
                    child: ListTile(
                      trailing: Icon(Icons.library_music, color: Overskull.purple,),
                      title: Text('Audio'),
                      subtitle: _drawLine(),
                      onTap: () async {
                        _currentFile = await Navigator.push(
                            context, MaterialPageRoute(builder: (context) => RecorderPage()));
                        if(_currentFile != null)
                          onSelect(_currentFile);
                        Navigator.of(context, rootNavigator: true).pop('dialog');
                      },
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(Overskull.textCancelar,
                    style: Overskull.blueConfirmDialog),
                onPressed: () {
                  Navigator.of(context).pop();
                },)
            ],
          );
        }
    );
  }

  Widget _drawLine(){
    return Container(
      width: double.maxFinite,
      height: 2,
      color: Overskull.purple,
    );
  }
}*/