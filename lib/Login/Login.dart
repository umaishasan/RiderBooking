import 'package:flutter/material.dart';
import 'package:riderbooking/Home/Home.dart';
import 'package:riderbooking/Registered/Registered.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;

  void _submit() {
    final user = _usernameController.text.trim();
    final pass = _passwordController.text;
    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter username and password')),
      );
      return;
    }
    Navigator.push(context,MaterialPageRoute(builder: (_) => const HomeScreen()));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Loged in successfully as $user')),
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String hint,
    bool obscure = false,
    Widget? suffix,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
          border: InputBorder.none,
          suffixIcon: suffix,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final aqua = const Color(0xFF5CE3D0); // similar aqua/turquoise
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 40),
              _field(controller: _usernameController, hint: 'Enter Username'),
              const SizedBox(height: 16),
              _field(
                controller: _passwordController,
                hint: 'Enter Password',
                obscure: _obscure,
                suffix: IconButton(
                  icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    // TODO: navigate to forgot password screen
                  },
                  style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(50, 30)),
                  child: const Text('Forget Password', style: TextStyle(color: Colors.grey)),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _submit,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [aqua, aqua.withOpacity(0.9)]),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (_) => const RegisteredPage()));
                },
                child: const Text('Create Account', style: TextStyle(color: Colors.grey)),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}