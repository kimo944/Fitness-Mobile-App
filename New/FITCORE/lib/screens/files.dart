import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';

class Files extends StatefulWidget {
  const Files({super.key});

  @override
  State<Files> createState() => _FilesState();
}

class _FilesState extends State<Files> {
  late Future<ListResult> futurefiles;

  @override
  void initState() {
    super.initState();
    futurefiles = FirebaseStorage.instance.ref('/files').listAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ListResult>(
        future: futurefiles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final files = snapshot.data!.items;

            return ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                final file = files[index];

                return ListTile(
                  title: Text(file.name),
                  trailing: IconButton(
                      onPressed: () {
                        downloadFile(file);
                      },
                      icon: const Icon(Icons.download)),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text("Error");
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future downloadFile(Reference ref) async {
    final url = await ref.getDownloadURL();

    final tempDir = await getTemporaryDirectory();
    final path = '${tempDir.path}/${ref.name}';
    await Dio().download(url, path);

    if (url.contains('.mp4')) {
      await GallerySaver.saveVideo(path, toDcim: true);
    } else //(url.contains('.jbeg'))
    {
      await GallerySaver.saveImage(path, toDcim: true);
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Downloaded ${ref.name}'),
    ));
  }
}
