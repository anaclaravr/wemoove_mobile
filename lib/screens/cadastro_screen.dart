import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../core/theme/colors.dart';
import '../core/theme/fonts.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final auth = FirebaseAuth.instance;

  Future<void> criarConta() async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: senhaController.text.trim(),
      );
      Navigator.pushReplacementNamed(context, '/main');
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro ao cadastrar: $e')));
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
              const Text(
                'Criar nova conta',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppTextStyles.defaultFont,
                  color: AppColors.azulNavegacao,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              const Text('Nome completo', style: AppTextStyles.subtitle),
              const SizedBox(height: 8),
              TextField(
                controller: nomeController,
                decoration: _inputDecoration(
                  'Digite seu nome completo',
                  Icons.person_outline,
                ),
              ),
              const SizedBox(height: 16),
              const Text('E-mail', style: AppTextStyles.subtitle),
              const SizedBox(height: 8),
              TextField(
                controller: emailController,
                decoration: _inputDecoration(
                  'Digite seu e-mail',
                  Icons.mail_outline,
                ),
              ),
              const SizedBox(height: 16),
              const Text('Nova senha', style: AppTextStyles.subtitle),
              const SizedBox(height: 8),
              TextField(
                controller: senhaController,
                obscureText: true,
                decoration: _inputDecoration(
                  'Crie uma senha',
                  Icons.lock_outline,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (_) {}),
                  const Text('Lembrar senha?', style: AppTextStyles.subtitle),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: criarConta,
                  style: _botaoEstilo(),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text.rich(
                  TextSpan(
                    text: 'Já tem uma conta? ',
                    children: [
                      TextSpan(
                        text: 'Login',
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

  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      suffixIcon: Icon(icon),
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
