import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Dùng để xử lý JSON
import 'package:flutter_2/customer/customer_home_page.dart';
import 'package:flutter_2/customer/customer_login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();

  // Hàm gửi yêu cầu đăng ký đến backend
  Future<void> registerUser() async {
    final String email = emailController.text;
    final String phone = phoneController.text;
    final String username = usernameController.text;
    final String password = passwordController.text;
    final String fullname = fullnameController.text;
    if (email.isNotEmpty &&
        phone.isNotEmpty &&
        username.isNotEmpty &&
        password.isNotEmpty &&
        fullname.isNotEmpty) {
      // Dữ liệu để gửi đến API
      final Map<String, String> userData = {
        'email': email,
        'phone_number': phone,
        'username': username,
        'password': password,
        'fullname': fullname,
      };

      try {
        final response = await http.post(
          Uri.parse(
              "http://127.0.0.1:8000/users/register/"), // Thay URL API của bạn
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(userData),
        );

        if (response.statusCode == 201) {
          // Đăng ký thành công
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration Successful')),
          );
          Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  CustomerHomePage(
                username: usernameController.text,
                password: passwordController.text,
                cusid: 1,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
            (route) => false,
          );
        } else {
          // Lỗi từ API
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registration Failed: ${response.body}')),
          );
        }
      } catch (e) {
        // Lỗi kết nối
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register",
          style: TextStyle(color: Color(0xFFFFFFF0)),
        ),
        backgroundColor: const Color.fromARGB(255, 3, 33, 22),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 720,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Register New Account",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 3, 33, 22)),
                  ),
                  const SizedBox(height: 20),

                  // Trường nhập email
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Trường nhập số điện thoại
                  TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20),

                  // Trường nhập tên
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Trường nhập mật khẩu
                  TextField(
                    controller: passwordController,
                    obscureText: true, // Ẩn nội dung nhập vào
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Trường nhập số điện thoại
                  TextField(
                    controller: fullnameController,
                    //obscureText: true, // Ẩn nội dung nhập vào
                    decoration: const InputDecoration(
                      labelText: 'Full name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Nút đăng ký
                  ElevatedButton(
                    onPressed: registerUser,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ), // Tùy chỉnh padding nếu cần
                      backgroundColor: const Color.fromARGB(255, 3, 33,
                          22), // Màu nền (có thể tùy chỉnh) // Màu chữ
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Color(0xFFFFFFF0)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Already have an account?'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CustomerLoginPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ), // Tùy chỉnh padding nếu cần
                      backgroundColor: const Color.fromARGB(255, 3, 33,
                          22), // Màu nền (có thể tùy chỉnh) // Màu chữ
                    ),
                    child: const Text('Login Here',
                        style: TextStyle(color: Color(0xFFFFFFF0))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
