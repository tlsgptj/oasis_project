import 'package:flutter/material.dart';
import '../services/api_service.dart';

class TransactionListScreen extends StatefulWidget {
  const TransactionListScreen({super.key});

  @override
  TransactionListScreenState createState() => TransactionListScreenState();
}

class TransactionListScreenState extends State<TransactionListScreen> {
  final ApiService _apiService = ApiService();
  List<dynamic> _transactions = [];

  @override
  void initState() {
    super.initState();
    _fetchTransactions();
  }

  void _fetchTransactions() async {
    String userId = '1'; // 실제로는 로그인한 사용자의 ID를 사용
    List<dynamic> transactions = await _apiService.fetchTransactions(userId);
    if (!mounted) return; // mounted 체크 추가

    setState(() {
      _transactions = transactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('결제내역 조회')),
      body: ListView.builder(
        itemCount: _transactions.length,
        itemBuilder: (context, index) {
          var transaction = _transactions[index];
          return ListTile(
            title: Text(
                '${transaction['merchant_name']} - ${transaction['amount']}원'),
            subtitle: Text('가맹점 번호: ${transaction['merchant_id']}'),
          );
        },
      ),
    );
  }
}
