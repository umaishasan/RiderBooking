import 'package:flutter/material.dart';

class RegisteredPage extends StatefulWidget {
  const RegisteredPage({Key? key}) : super(key: key);

  @override
  State<RegisteredPage> createState() => _RegisteredPageState();
}

class _RegisteredPageState extends State<RegisteredPage> {
  final TextEditingController _usernameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _confirmCtrl = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  // 0 = male, 1 = female
  int _gender = 0;

  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final username = _usernameCtrl.text.trim();
    final gender = _gender == 0 ? 'Male' : 'Female';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Signed up successfully')),
    );
    // After signup we can navigate back to login or proceed further
    Navigator.of(context).pop();
  }

    Widget _roundedField({
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
                onChanged: (v) => field.didChange(v),
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
          ],
        );
      },
      );
    }

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final aqua = const Color(0xFF5CE3D0);

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
                  // Username
                  const SizedBox(height: 8),
                  _roundedField(
                    controller: _usernameCtrl,
                    hint: 'Enter Username',
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) return 'Please enter username';
                      return null;
                    },
                  ),

                  //Email
                  const SizedBox(height: 8),
                  _roundedField(
                    controller: _emailCtrl,
                    hint: 'Enter Email',
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) return 'Please enter email';
                      return null;
                    },
                  ),

                  //Phone Number
                  const SizedBox(height: 8),
                  _roundedField(
                    controller: _phoneCtrl,
                    hint: 'Enter Phone Number',
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) return 'Please enter phone number';
                      return null;
                    },
                  ),

                  // Gender selection (Male [toggle] Female)
                  const SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Male', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      // small toggle-like box using ToggleButtons
                      ToggleButtons(
                        borderRadius: BorderRadius.circular(6),
                        constraints: const BoxConstraints(minWidth: 36, minHeight: 28),
                        isSelected: [_gender == 0, _gender == 1],
                        onPressed: (index) => setState(() => _gender = index),
                        children: const [SizedBox(), SizedBox()],
                      ),
                      const SizedBox(width: 8),
                      Text('Female', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),

                  // Password
                  const SizedBox(height: 8),
                  _roundedField(
                    controller: _passwordCtrl,
                    hint: 'Enter Password',
                    obscure: _obscurePassword,
                    suffix: IconButton(
                      icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Please enter password';
                      if (v.length < 6) return 'Password must be at least 6 characters';
                      return null;
                    },
                  ),

                  // ReEnter Password
                  const SizedBox(height: 8),
                  _roundedField(
                    controller: _confirmCtrl,
                    hint: 'ReEnter Password',
                    obscure: _obscureConfirm,
                    suffix: IconButton(
                      icon: Icon(_obscureConfirm ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                      onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Please confirm password';
                      if (v != _passwordCtrl.text) return 'Passwords do not match';
                      return null;
                    },
                  ),

                  // Signup button
                  const SizedBox(height: 22),
                  GestureDetector(
                    onTap: _submit,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [aqua, aqua.withOpacity(0.95)]),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: const Center(
                        child: Text(
                          'Signup',
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

                  // small helper text
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('If you have already account login', style: TextStyle(color: Colors.grey)),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
