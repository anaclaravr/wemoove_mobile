import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../core/theme/colors.dart';
import '../core/theme/fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final auth = FirebaseAuth.instance;

  Future<void> fazerLogin() async {
    try {
      await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: senhaController.text.trim(),
      );
      Navigator.pushReplacementNamed(context, '/main');
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro ao fazer login: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fundoApp,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Center(
                child: Image.asset(
                  'assets/images/wemoove_logo.png',
                  height: 60,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Login',
                style: AppTextStyles.title.copyWith(
                  fontSize: 24,
                  color: AppColors.azulNavegacao,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              const Text('E-mail', style: AppTextStyles.subtitle),
              const SizedBox(height: 8),
              TextField(
                controller: emailController,
                decoration: _inputDecoration('Digite seu e-mail'),
              ),
              const SizedBox(height: 16),
              const Text('Senha', style: AppTextStyles.subtitle),
              const SizedBox(height: 8),
              TextField(
                controller: senhaController,
                obscureText: true,
                decoration: _inputDecoration('Digite sua senha'),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (_) {}),
                  const Text('Lembrar senha', style: AppTextStyles.subtitle),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: fazerLogin,
                  style: _botaoEstilo(),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/cadastro'),
                child: const Text.rich(
                  TextSpan(
                    text: 'Não tem uma conta? ',
                    children: [
                      TextSpan(
                        text: 'Cadastre-se',
                        style: TextStyle(
                          color: AppColors.azulNavegacao,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  ButtonStyle _botaoEstilo() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.azulNavegacao,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
