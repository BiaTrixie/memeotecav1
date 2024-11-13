final appDocDir = await getApplicationDocumentsDirectory();
final filePath = "${appDocDir.absolute}/path/to/mountains.jpg";
final file = File(filePath);

final metadata = SettableMetadata(contentType: "image/jpeg");

final storageRef = FirebaseStorage.instance.ref();

final uploadTask = storageRef
    .child("images/path/to/mountains.jpg")
    .putFile(file, metadata);

// Listen for state changes, errors, and completion of the upload.
uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
  switch (taskSnapshot.state) {
    case TaskState.running:
      final progress =
          100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
      print("Upload is $progress% complete.");
      break;
    case TaskState.paused:
      print("Upload is paused.");
      break;
    case TaskState.canceled:
      print("Upload was canceled");
      break;
    case TaskState.error:
      break;
    case TaskState.success:
      
      break;
  }
});

//List images
root.child('images').listAll() 
root.child('images/uid').listAll()

// Delete file
final desertRef = storageRef.child("images/desert.jpg");

await desertRef.delete();