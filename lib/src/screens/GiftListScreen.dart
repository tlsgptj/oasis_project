import 'package:flutter/material.dart';
import '../services/gifticon_service_api.dart';
import '../model/gifticon_model.dart';

class GifticonListScreen extends StatefulWidget {
  @override
  _GifticonListScreenState createState() => _GifticonListScreenState();
}

class _GifticonListScreenState extends State<GifticonListScreen> {
  late Future<List<Gifticon>> futureGifticons;

  @override
  void initState() {
    super.initState();
    futureGifticons = ApiService().fetchGifticons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기프티콘'),
      ),
      body: FutureBuilder<List<Gifticon>>(
        future: futureGifticons,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("에러: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("사용가능한 기프티콘이 존재하지 않습니다."));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final gifticon = snapshot.data![index];
                return ListTile(
                  title: Text(gifticon.name),
                  subtitle: Text('\$${gifticon.price}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
