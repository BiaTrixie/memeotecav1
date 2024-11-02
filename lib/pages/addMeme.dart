import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memeotecav1/services/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddMemeScreen extends StatelessWidget {
  AddMemeScreen({super.key});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Adicionar Meme"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Título',
                labelStyle: GoogleFonts.raleway(
                  textStyle: const TextStyle(color: Color(0xff6A6A6A)),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20), 
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Descrição',
                labelStyle: GoogleFonts.raleway(
                  textStyle: const TextStyle(color: Color(0xff6A6A6A)),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20), 
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(
                labelText: 'URL da Imagem',
                labelStyle: GoogleFonts.raleway(
                  textStyle: const TextStyle(color: Color(0xff6A6A6A)),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10), 
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 244, 67, 54),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                onPressed: () async {
                  final uploaderId = FirebaseAuth.instance.currentUser?.email ?? "Anônimo";
                  await FirestoreService().addMeme(
                    title: _titleController.text,
                    description: _descriptionController.text,
                    imageUrl: _imageUrlController.text,
                    uploaderId: uploaderId,
                  );
                  Navigator.pop(context); 
                },
                child: const Text(
                  "Adicionar Meme",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
