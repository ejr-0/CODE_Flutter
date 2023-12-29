import 'package:app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AvatarWidget extends StatefulWidget {
  final String? imageURL;
  final Function(String) onUpload;

  const AvatarWidget({
    super.key,
    required this.imageURL,
    required this.onUpload,
  });

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  bool isLoading = false;

  Future<void> upload() async {
    final imagePicker = ImagePicker();
    final imageFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 300,
      maxHeight: 300,
    );

    if (imageFile == null) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final bytes = await imageFile.readAsBytes();
      final fileExt = imageFile.path.split('.').last;
      final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
      final filePath = fileName;

      await client.storage.from('avatars').uploadBinary(
            filePath,
            bytes,
            fileOptions: FileOptions(contentType: imageFile.mimeType),
          );

      final imageUrlResponse = await client.storage
          .from('avatars')
          .createSignedUrl(filePath, 60 * 60 * 24 * 365 * 10);

      widget.onUpload(imageUrlResponse);
    } on StorageException catch (error) {
      if (!context.mounted) return;
      context.showErrorSnackBar(error.message);
    } catch (error) {
      if (!context.mounted) return;
      context.showErrorSnackBar('Unexpected error occured!');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              if (widget.imageURL == null || widget.imageURL!.isEmpty)
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(
                      Icons.person,
                      size: 120,
                    ),
                    Positioned(
                      top: 1,
                      right: 1,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: GestureDetector(
                          onTap: upload,
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ),
                  ],
                )
              else
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      widget.imageURL!,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 1,
                      right: 1,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: GestureDetector(
                          onTap: upload,
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          );
  }
}
