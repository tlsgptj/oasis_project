import 'package:flutter/material.dart';

class CardTransactionsScreen extends StatelessWidget {
  const CardTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock transaction data with realistic store names
    final List<Map<String, String>> mockTransactions = [
      {
        'date': '2024-08-19',
        'description': '스타벅스 광화문점',
        'amount': '5,000원',
      },
      {
        'date': '2024-08-18',
        'description': '롯데마트 서울역점',
        'amount': '50,000원',
      },
      {
        'date': '2024-08-17',
        'description': '배스킨라빈스 홍대점',
        'amount': '12,000원',
      },
      {
        'date': '2024-08-16',
        'description': '이디야커피 강남역점',
        'amount': '4,200원',
      },
      {
        'date': '2024-08-15',
        'description': 'CU 편의점 서대문점',
        'amount': '7,500원',
      },
      {
        'date': '2024-08-14',
        'description': '파리바게트 종로점',
        'amount': '15,300원',
      },
      {
        'date': '2024-08-13',
        'description': '버거킹 신촌점',
        'amount': '8,400원',
      },
      {
        'date': '2024-08-12',
        'description': '교보문고 강남점',
        'amount': '23,000원',
      },
      {
        'date': '2024-08-11',
        'description': 'GS25 편의점 합정점',
        'amount': '6,800원',
      },
      {
        'date': '2024-08-10',
        'description': 'CGV 영화관 왕십리점',
        'amount': '11,000원',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('카드 내역'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFA40B)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: mockTransactions.length,
        itemBuilder: (context, index) {
          final transaction = mockTransactions[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(transaction['description']!),
              subtitle: Text(transaction['date']!),
              trailing: Text(transaction['amount']!),
            ),
          );
        },
      ),
    );
  }
}
