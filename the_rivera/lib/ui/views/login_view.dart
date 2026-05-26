import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:the_rivera_barberia/providers/auth_provider.dart';
import 'package:the_rivera_barberia/router/router.dart';
import 'package:the_rivera_barberia/ui/buttons/custom_outlined_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    final authProvider = context.read<AuthProvider>();
    final success = await authProvider.login(
      _emailController.text.trim(),
      _passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (success && mounted) {
      context.go(Routes.dashboard);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Correo o contraseña incorrectos'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A0D06), // Café muy oscuro
              Color(0xFF2C1810), // Café oscuro
              Color(0xFF3D2314), // Café medio
              Color(0xFF5C3A1E), // Café claro
            ],
          ),
        ),
        child: isMobile
            ? _buildMobileLayout()
            : Row(
                children: [
                  // Lado izquierdo - Información de la barbería
                  Expanded(
                    flex: 1,
                    child: _buildLeftSection(),
                  ),
                  // Lado derecho - Formulario de login (también oscuro)
                  Expanded(
                    flex: 1,
                    child: _buildRightSection(),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogoSection(),
            const SizedBox(height: 40),
            _buildLoginForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftSection() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1A0D06),
            const Color(0xFF2C1810),
            const Color(0xFF3D2314),
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icono principal
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFD4A373).withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.content_cut,
                  size: 80,
                  color: Color(0xFFD4A373),
                ),
              ),
              const SizedBox(height: 32),
              // Título principal
              const Text(
                'THE RIVERA',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD4A373),
                  fontFamily: 'Georgia',
                  letterSpacing: 3,
                ),
              ),
              const SizedBox(height: 16),
              // Línea decorativa
              Container(
                width: 80,
                height: 3,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8B86B),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              // Subtítulo
              const Text(
                'CORTES MEN & GIRLS',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFF5E6D3),
                  letterSpacing: 2,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'CARÁCTER',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFD4A373),
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(height: 48),
              // Citas o frases
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: const Color(0xFFD4A373),
                      width: 3,
                    ),
                  ),
                ),
                child: const Text(
                  '"Estilo y personalidad\npara cada momento"',
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFFE8D5B5),
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRightSection() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF2C1810).withOpacity(0.8),
            const Color(0xFF1A0D06).withOpacity(0.9),
          ],
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(48),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo pequeño
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4A373).withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.content_cut,
                    size: 40,
                    color: Color(0xFFD4A373),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4A373),
                    fontFamily: 'Georgia',
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 50,
                  height: 2,
                  color: const Color(0xFFE8B86B),
                ),
                const SizedBox(height: 32),
                _buildLoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFD4A373).withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.content_cut,
            size: 60,
            color: Color(0xFFD4A373),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'THE RIVERA',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFFD4A373),
            fontFamily: 'Georgia',
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'CORTES MEN & GIRLS CARÁCTER',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFFF5E6D3),
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Campo email
          TextFormField(
            controller: _emailController,
            style: const TextStyle(color: Color(0xFFF5E6D3)),
            decoration: InputDecoration(
              hintText: 'Correo Electrónico',
              hintStyle: const TextStyle(color: Color(0xFF8B7355)),
              prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFFD4A373)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF5C3A1E)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF5C3A1E)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFD4A373), width: 2),
              ),
              filled: true,
              fillColor: const Color(0xFF2C1810).withOpacity(0.6),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingrese su correo';
              }
              if (!value.contains('@')) {
                return 'Ingrese un correo válido';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          
          // Campo contraseña
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            style: const TextStyle(color: Color(0xFFF5E6D3)),
            decoration: InputDecoration(
              hintText: 'Contraseña',
              hintStyle: const TextStyle(color: Color(0xFF8B7355)),
              prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFFD4A373)),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xFFD4A373),
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF5C3A1E)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF5C3A1E)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFD4A373), width: 2),
              ),
              filled: true,
              fillColor: const Color(0xFF2C1810).withOpacity(0.6),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingrese su contraseña';
              }
              if (value.length < 3) {
                return 'La contraseña debe tener al menos 3 caracteres';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          
          // Olvidé contraseña
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                '¿Olvidaste tu contraseña?',
                style: TextStyle(color: Color(0xFFD4A373)),
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // Botón ingresar
          CustomOutlinedButton(
            text: 'INGRESAR',
            onPressed: _handleLogin,
            isLoading: _isLoading,
            backgroundColor: const Color(0xFFD4A373),
            textColor: const Color(0xFF1A0D06),
          ),
          const SizedBox(height: 20),
          
          // Link a registro
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '¿No tienes cuenta?',
                style: TextStyle(color: Color(0xFF8B7355)),
              ),
              TextButton(
                onPressed: () {
                  context.push(Routes.register);
                },
                child: const Text(
                  'Regístrate aquí',
                  style: TextStyle(
                    color: Color(0xFFD4A373),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}