import 'package:flutter/material.dart';
import 'package:riderbooking/Login/Login.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({Key? key}) : super(key: key);

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  final TextEditingController _rePasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscure = true;
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if(!_formKey.currentState!.validate()) return;
    final pass = _passwordController.text;
    
    Navigator.push(context,MaterialPageRoute(builder: (_) => const LoginPage()));
  }

  @override
  void dispose() {
    _rePasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _field({
    required TextEditingController controller,
    required String hint,
    bool obscure = false,
    Widget? suffix,
    String? Function(String?)? validator,
  }) {
    return FormField<String>(
      initialValue: controller.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: TextField(
                controller: controller,
                obscureText: obscure,
                onChanged: (value) => field.didChange(value),
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                  border: InputBorder.none,
                  suffixIcon: suffix,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ),
            if (field.hasError)
              Container(
                margin: const EdgeInsets.only(top: 3, left: 6),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(field.errorText ?? '', style: const TextStyle(color: Colors.red, fontSize: 10)),
              ),
          ]  
        );
      },
    );
  }
  

  @override
  Widget build(BuildContext context) {
    final aqua = const Color(0xFF5CE3D0); // similar aqua/turquoise
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                //for password
                const SizedBox(height: 40),
                _field(
                  controller: _passwordController,
                  hint: 'Enter Password',
                  obscure: _obscure,
                  suffix: IconButton(
                    icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Please enter password';
                    if (v.length < 6) return 'Password must be at least 6 characters';
                    return null;
                  },
                ),
                
                //for repassword
                const SizedBox(height: 16),
                _field(
                  controller: _rePasswordController,
                  hint: 'ReEnter Password',
                  obscure: _obscure,
                  suffix: IconButton(
                    icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Please enter password';
                    if (v.length < 6) return 'Password must be at least 6 characters';
                    if(v.trim() != _passwordController.text.trim()) return 'Passwords do not match';
                    return null;
                  },
                ),
                
                const SizedBox(height: 30),
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
                        'Change Password',
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
              ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}