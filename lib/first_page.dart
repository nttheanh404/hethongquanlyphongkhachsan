import 'package:flutter/material.dart';
import 'package:flutter_2/customer_login_page.dart';
import 'package:flutter_2/employee_login_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  final String title = 'HOTEL IT3180';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 3, 33, 22),
        title: Text(
          title,
          style: const TextStyle(color: Color.fromARGB(255, 239, 207, 80)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 80,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    // Hình dạng nút
                    borderRadius: BorderRadius
                        .zero, // Bo tròn bằng 0 để tạo hình chữ nhật
                  ),
                  backgroundColor: const Color.fromARGB(255, 3, 33, 22),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EmployeeLoginPage(),
                    ),
                  );
                },
                child: const Text(
                  'Login for employee',
                  style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 80,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    // Hình dạng nút
                    borderRadius: BorderRadius
                        .zero, // Bo tròn bằng 0 để tạo hình chữ nhật
                  ),
                  backgroundColor: const Color.fromARGB(255, 3, 33, 22),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomerLoginPage(),
                    ),
                  );
                },
                child: const Text(
                  'Continue as customer',
                  style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}