


import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:schoolapp/controllers/appcontroller.dart';

extension LocalController on AppController{

  Future<String> getImageAndSave({required bool gallery}) async {
    // Use the image_picker package to open the device's image gallery

    final ImagePicker _picker = ImagePicker();
    final XFile? image = gallery
        ? await _picker.pickImage(source: ImageSource.gallery)
        : await _picker.pickImage(source: ImageSource.camera);

    File? file = File(image!.path);
    // Check if an image was selected
    if (file == null) {
      print('No image was selected.');
      return '';
    }

    final directory = await getApplicationDocumentsDirectory();

    final File newImageFile = File('${directory.path}/${DateTime.now()}.jpg');

    await file.copy(newImageFile.path);

    return newImageFile.path;
  }
}