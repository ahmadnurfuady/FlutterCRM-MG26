import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';
import 'package:crm_dashboard/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showPassword = false;
  String _errorMsg = "";

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    setState(() {
      _errorMsg = "";
    });

    final email = _emailController.text;
    final password = _passwordController.text;

    // Simple validation as per the Vue component
    if (email == "admin@mail.com" && password == "123456") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } else {
      setState(() {
        _errorMsg = "Email atau password salah";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: isDesktop ? 24 : 0,
            horizontal: isDesktop ? 24 : 0,
          ),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 1100,
              minHeight: isDesktop ? 0 : size.height,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: isDesktop ? BorderRadius.circular(20) : null,
              boxShadow: isDesktop
                  ? [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              children: [
                // LEFT SIDE (Illustration - Desktop only)
                if (isDesktop)
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(60),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'CRM MG26',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF1C2434),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Deliver better customer experiences with organized, efficient CRM management.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueGrey.shade400,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 60),
                          Icon(
                            Icons.insights_rounded,
                            size: 300,
                            color: AppTheme.primary.withValues(alpha: 0.8),
                          ),
                        ],
                      ),
                    ),
                  ),

                // RIGHT SIDE (Login Form)
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? 80 : 32,
                      vertical: isDesktop ? 80 : 60,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: isDesktop
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      children: [
                        if (!isDesktop) ...[
                          const Icon(
                            Icons.insights_rounded,
                            size: 48,
                            color: Color(0xFF1C2434),
                          ),
                          const SizedBox(height: 24),
                        ],
                        Text(
                          'Start Building Better Workflows',
                          textAlign:
                              isDesktop ? TextAlign.left : TextAlign.center,
                          style: TextStyle(
                            fontSize: isDesktop ? 18 : 14,
                            color: Colors.blueGrey.shade400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Log In to CRM MG26',
                          textAlign:
                              isDesktop ? TextAlign.left : TextAlign.center,
                          style: TextStyle(
                            fontSize: isDesktop ? 32 : 24,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1C2434),
                          ),
                        ),
                        SizedBox(height: isDesktop ? 48 : 32),

                        // Email field
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1C2434),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            suffixIcon: const Icon(Icons.mail_outline,
                                color: Color(0xFF1C2434), size: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: Color(0xFF1C2434)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: Color(0xFF1C2434)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Color(0xFF1C2434), width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Password field
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Password',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1C2434),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _passwordController,
                          obscureText: !_showPassword,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _showPassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: const Color(0xFF1C2434),
                                size: 20,
                              ),
                              onPressed: () => setState(
                                  () => _showPassword = !_showPassword),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: Color(0xFF1C2434)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: Color(0xFF1C2434)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Color(0xFF1C2434), width: 2),
                            ),
                          ),
                        ),

                        if (_errorMsg.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          Text(
                            _errorMsg,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 14),
                          ),
                        ],

                        const SizedBox(height: 32),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: _handleLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1C2434),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Sign Up Link
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                text: "Don't have any account? ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blueGrey.shade400,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF1C2434),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
