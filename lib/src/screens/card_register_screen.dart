import 'package:flutter/material.dart';

class CardRegistrationScreen extends StatefulWidget {
  const CardRegistrationScreen({super.key});

  @override
  State<CardRegistrationScreen> createState() => _CardRegistrationScreenState();
}

class _CardRegistrationScreenState extends State<CardRegistrationScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();
  bool _allAgreed = false;

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvcController.dispose();
    super.dispose();
  }

  void _toggleAgreement(bool? value) {
    setState(() {
      _allAgreed = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          '카드 등록',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFA40B)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.credit_card, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          '카드 정보를 입력해주세요',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _cardNumberController,
                      decoration: InputDecoration(
                        labelText: '카드번호',
                        labelStyle: TextStyle(color: Colors.blue),
                        hintText: '0000 - 0000 - 0000 - 0000',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _expiryDateController,
                            decoration: InputDecoration(
                              labelText: '유효기간',
                              labelStyle: TextStyle(color: Colors.blue),
                              hintText: 'MM/YY',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _cvcController,
                            decoration: InputDecoration(
                              labelText: 'CVC',
                              labelStyle: TextStyle(color: Colors.blue),
                              hintText: '카드 뒷면 3자리',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            obscureText: true,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Column(
                  children: [
                    CheckboxListTile(
                      value: _allAgreed,
                      onChanged: _toggleAgreement,
                      title: const Text('전체 약관 동의'),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                    ),
                    const Divider(),
                    CheckboxListTile(
                      value: _allAgreed,
                      onChanged: _toggleAgreement,
                      title: const Text('카드 번호 데이터 수집 및 이용 동의'),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                    ),
                    CheckboxListTile(
                      value: _allAgreed,
                      onChanged: _toggleAgreement,
                      title: const Text('카드 이용 내역 정보 제공 동의'),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                    ),
                    CheckboxListTile(
                      value: _allAgreed,
                      onChanged: _toggleAgreement,
                      title: const Text('카드사로부터 개인정보 수집 및 이용 동의'),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _allAgreed ? _registerCard : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  '완료',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '',
          ),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  void _registerCard() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('카드 등록이 완료되었습니다.')),
    );
    Future.delayed(const Duration(seconds: 1), () {
      // Navigate to the desired screen, replace '/home' with your route
      Navigator.pushReplacementNamed(context, '/mycard');
    });
  }
}
