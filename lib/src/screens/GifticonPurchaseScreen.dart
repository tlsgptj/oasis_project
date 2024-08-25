import 'package:flutter/material.dart';
import '../services/api_service.dart';

class GifticonPurchaseScreen extends StatelessWidget {
  final int gifticonId;

  GifticonPurchaseScreen({required this.gifticonId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Gifticon'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              final barcode = await ApiService().purchaseGifticon(gifticonId);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Purchase Successful'),
                    content: Text('Your barcode: $barcode'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } catch (e) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Error'),
                    content: Text(e.toString()),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: Text('Purchase Gifticon'),
        ),
      ),
    );
  }
}
