import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rich_edit/rich_edit.dart';
import 'package:video_player/video_player.dart';

class SimpleRichEditController extends RichEditController {
  Map<String, ChewieController> controllers = Map();

  //添加视频方法
  @override
  Future<String> addVideo() async {
    var pickedFile = await ImagePicker().getVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      //模拟上传后返回的路径
      return pickedFile.path;
    }
    return null;
  }

  //添加图片方法
  @override
  Future addImage() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return pickedFile.path;
    }
  }

  //生成视频view方法
  @override
  Widget generateVideoView(RichEditData data) {
    if (!controllers.containsKey(data.data)) {
      var controller = ChewieController(
        videoPlayerController: VideoPlayerController.network(data.data),
        autoPlay: false,
        autoInitialize: true,
        aspectRatio: 16 / 9,
        looping: false,
        showControls: true,
        // 占位图
        placeholder: new Container(
          color: Colors.grey,
        ),
      );
      controllers[data.data] = controller;
    }
    var video = Chewie(
      controller: controllers[data.data],
    );
    return video;
  }

  @override
  Widget generateImageView(RichEditData data) =>
      Image.file(File(data.data), height: 200, width: 300);
}
