import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Geri Bildirim")),
      body: Center(child: Text("Geri Bildirim sayfası içeriği buraya gelecek")),
    );
  }
}
