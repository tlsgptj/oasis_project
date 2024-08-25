import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../model/gifticon_model.dart';

class UserGifticonListScreen extends StatefulWidget {
  @override
  _UserGifticonListScreenState createState() => _UserGifticonListScreenState();
}

class _UserGifticonListScreenState extends State<UserGifticonListScreen> {
  late Future<List<Gifticon>> futureGifticons;

  @override
  void initState() {
    super.initState();
    futureGifticons = ApiService().fetchUserGifticons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Gifticons'),
      ),
      body: FutureBuilder<List<Gifticon>>(
        future: futureGifticons,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No gifticons available"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final gifticon = snapshot.data![index];
                return ListTile(
                  title: Text(gifticon.name),
                  subtitle: Text('Barcode: ${gifticon.id}'), // 실제 바코드 데이터를 여기에 표시
                );
              },
            );
          }
        },
      ),
    );
  }
}
