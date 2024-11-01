import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // Referência à coleção de memes
  final CollectionReference memes = FirebaseFirestore.instance.collection('memes');
  
  // CREATE - Adicionar um novo meme
  Future<void> addMeme({
    required String title,
    required String description,
    required String imageUrl,
    required String uploaderId,
  }) {
    return memes.add({
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'uploaderId': uploaderId,
      'uploadDate': Timestamp.now(),
      'updateOn': Timestamp.now(),
    });
  }

  // READ - Obter um stream de memes ordenado pela data de upload
  Stream<QuerySnapshot> getMemeStream() {
    return memes.orderBy('uploadDate', descending: true).snapshots();
  }

  // UPDATE - Atualizar dados de um meme específico
  Future<void> updateMeme(String docID, String newDescription, String newTitle) {
    return memes.doc(docID).update({
      'title': newTitle,
      'description': newDescription,
      'updateOn': Timestamp.now(),
    });
  }

  // DELETE - Deletar um meme pelo ID do documento
  Future<void> deleteMeme(String docID) {
    return memes.doc(docID).delete();
  }
}
