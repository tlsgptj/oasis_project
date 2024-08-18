import 'package:flutter/material.dart';
import '../services/api_service.dart';

class MileageScreen extends StatefulWidget {
  const MileageScreen({super.key});

  @override
  MileageScreenState createState() => MileageScreenState();
}

class MileageScreenState extends State<MileageScreen> {
  final ApiService _apiService = ApiService();
  List<dynamic> _mileageEntries = [];

  @override
  void initState() {
    super.initState();
    _fetchMileage();
  }

  void _fetchMileage() async {
    String userId = '1'; // 실제로는 로그인한 사용자의 ID를 사용
    List<dynamic> mileageEntries = await _apiService.fetchMileage(userId);
    if (!mounted) return; // mounted 체크 추가

    setState(() {
      _mileageEntries = mileageEntries;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('마일리지 적립 내역')),
      body: ListView.builder(
        itemCount: _mileageEntries.length,
        itemBuilder: (context, index) {
          var entry = _mileageEntries[index];
          return ListTile(
            title: Text('${entry['merchant_name']} - ${entry['amount']}원'),
            subtitle: Text('적립된 마일리지: ${entry['mileage']}'),
          );
        },
      ),
    );
  }
}
