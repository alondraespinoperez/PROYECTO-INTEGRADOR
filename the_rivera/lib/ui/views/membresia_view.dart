import 'package:flutter/material.dart';
import 'package:the_rivera_barberia/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:the_rivera_barberia/ui/buttons/custom_outlined_button.dart';

class MembresiaView extends StatefulWidget {
  const MembresiaView({super.key});

  @override
  State<MembresiaView> createState() => _MembresiaViewState();
}

class _MembresiaViewState extends State<MembresiaView> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _fechaNacimientoController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _numeroTarjetaController = TextEditingController();
  final _ccvController = TextEditingController();
  final _fechaVencimientoController = TextEditingController();
  
  String? _tipoTarjeta;
  String? _banco;
  bool _isLoading = false;
  bool _isSubmitted = false;

  @override
  void dispose() {
    _nombreController.dispose();
    _fechaNacimientoController.dispose();
    _emailController.dispose();
    _telefonoController.dispose();
    _numeroTarjetaController.dispose();
    _ccvController.dispose();
    _fechaVencimientoController.dispose();
    super.dispose();
  }

  void _detectarBanco(String numeroTarjeta) {
    String numeroLimpio = numeroTarjeta.replaceAll(' ', '');
    String prefix = '';
    if (numeroLimpio.length >= 4) {
      prefix = numeroLimpio.substring(0, 4);
    }
    
    setState(() {
      if (prefix == '4152') {
        _banco = 'BBVA';
      } else if (prefix == '5579') {
        _banco = 'SANTANDER';
      } else if (prefix == '4027') {
        _banco = 'BANCO AZTECA';
      } else {
        _banco = null;
      }
    });
  }

  Future<void> _seleccionarFechaNacimiento() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _fechaNacimientoController.text = 
            "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      });
    }
  }

  Future<void> _seleccionarFechaVencimiento() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 365)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );
    if (picked != null) {
      setState(() {
        _fechaVencimientoController.text = 
            "${picked.month.toString().padLeft(2, '0')}/${picked.year.toString().substring(2)}";
      });
    }
  }

  void _finalizarMembresia() async {
    if (!_formKey.currentState!.validate()) return;
    
    if (_tipoTarjeta == null) {
      _showSnackbar('Selecciona el tipo de tarjeta', Colors.orange);
      return;
    }
    
    if (_banco == null) {
      _showSnackbar('Número de tarjeta inválido. Debe empezar con 4152 (BBVA), 5579 (SANTANDER) o 4027 (BANCO AZTECA)', Colors.orange);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
      _isSubmitted = true;
    });

    _showSnackbar('¡Membresía activada con éxito!', Colors.green);
    
    _nombreController.clear();
    _fechaNacimientoController.clear();
    _emailController.clear();
    _telefonoController.clear();
    _numeroTarjetaController.clear();
    _ccvController.clear();
    _fechaVencimientoController.clear();
    setState(() {
      _tipoTarjeta = null;
      _banco = null;
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isSubmitted = false;
        });
      }
    });
  }

  void _showSnackbar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 800;
    
    return DashboardLayout(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Título centrado - SIN const en Container
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'MEMBRESÍA VIP',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4A373),
                    fontFamily: 'Georgia',
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Container(
                  width: 295,
                  height: 2,
                  color: const Color(0xFFE8B86B),
                ),
              ],
            ),
            const SizedBox(height: 40),
            
            isMobile
                ? Column(
                    children: [
                      _buildForm(),
                      const SizedBox(height: 30),
                      _buildBenefitsCard(),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 2, child: _buildForm()),
                      const SizedBox(width: 30),
                      Expanded(flex: 1, child: _buildBenefitsCard()),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2C1810), Color(0xFF1A0D06)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFD4A373).withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Nombre Completo
            TextFormField(
              controller: _nombreController,
              style: const TextStyle(color: Color(0xFFF5E6D3)),
              decoration: _inputDecoration('Nombre Completo', Icons.person),
              validator: (value) => value?.isEmpty == true ? 'Ingresa tu nombre completo' : null,
            ),
            const SizedBox(height: 16),
            
            // Fecha de Nacimiento
            InkWell(
              onTap: _seleccionarFechaNacimiento,
              child: InputDecorator(
                decoration: _inputDecoration('Fecha de Nacimiento', Icons.cake),
                child: Text(
                  _fechaNacimientoController.text.isEmpty
                      ? 'DD/MM/AAAA'
                      : _fechaNacimientoController.text,
                  style: TextStyle(
                    color: _fechaNacimientoController.text.isNotEmpty 
                        ? const Color(0xFFF5E6D3) 
                        : const Color(0xFF8B7355),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Correo Electrónico
            TextFormField(
              controller: _emailController,
              style: const TextStyle(color: Color(0xFFF5E6D3)),
              decoration: _inputDecoration('Correo Electrónico', Icons.email),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value?.isEmpty == true) return 'Ingresa tu correo';
                if (!value!.contains('@')) return 'Correo inválido';
                return null;
              },
            ),
            const SizedBox(height: 16),
            
            // Teléfono
            TextFormField(
              controller: _telefonoController,
              style: const TextStyle(color: Color(0xFFF5E6D3)),
              decoration: _inputDecoration('Teléfono', Icons.phone),
              keyboardType: TextInputType.phone,
              validator: (value) => value?.isEmpty == true ? 'Ingresa tu teléfono' : null,
            ),
            const SizedBox(height: 16),
            
            // Tipo de Tarjeta
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Débito', style: TextStyle(color: Color(0xFFF5E6D3))),
                    value: 'debito',
                    groupValue: _tipoTarjeta,
                    onChanged: (value) {
                      setState(() {
                        _tipoTarjeta = value;
                      });
                    },
                    activeColor: const Color(0xFFD4A373),
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Crédito', style: TextStyle(color: Color(0xFFF5E6D3))),
                    value: 'credito',
                    groupValue: _tipoTarjeta,
                    onChanged: (value) {
                      setState(() {
                        _tipoTarjeta = value;
                      });
                    },
                    activeColor: const Color(0xFFD4A373),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            
            // Precio Membresía
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFD4A373).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFFD4A373).withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Membresía VIP',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFD4A373)),
                  ),
                  Text(
                    '\$500 MXN / mes',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFE8B86B)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            // Número de Tarjeta
            TextFormField(
              controller: _numeroTarjetaController,
              style: const TextStyle(color: Color(0xFFF5E6D3)),
              decoration: _inputDecoration('Número de Tarjeta', Icons.credit_card),
              keyboardType: TextInputType.number,
              maxLength: 16,
              onChanged: (value) {
                _detectarBanco(value);
              },
              validator: (value) {
                if (value?.isEmpty == true) return 'Ingresa el número de tarjeta';
                if (value!.length < 16) return 'Número de tarjeta inválido';
                if (_banco == null) return 'Tarjeta no reconocida';
                return null;
              },
            ),
            
            // Mostrar banco detectado
            if (_banco != null)
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 8),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      'Banco detectado: $_banco',
                      style: const TextStyle(color: Colors.green, fontSize: 12),
                    ),
                  ],
                ),
              ),
            
            // CCV y Fecha Vencimiento
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _ccvController,
                    style: const TextStyle(color: Color(0xFFF5E6D3)),
                    decoration: _inputDecoration('CCV', Icons.security),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    obscureText: true,
                    validator: (value) {
                      if (value?.isEmpty == true) return 'Ingresa el CCV';
                      if (value!.length < 3) return 'CCV inválido';
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: _seleccionarFechaVencimiento,
                    child: InputDecorator(
                      decoration: _inputDecoration('Vencimiento', Icons.calendar_today),
                      child: Text(
                        _fechaVencimientoController.text.isEmpty
                            ? 'MM/AA'
                            : _fechaVencimientoController.text,
                        style: TextStyle(
                          color: _fechaVencimientoController.text.isNotEmpty 
                              ? const Color(0xFFF5E6D3) 
                              : const Color(0xFF8B7355),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Botón Finalizar
            CustomOutlinedButton(
              text: 'FINALIZAR MEMBRESÍA',
              onPressed: _finalizarMembresia,
              isLoading: _isLoading,
              backgroundColor: const Color(0xFFD4A373),
              textColor: const Color(0xFF1A0D06),
            ),
            
            if (_isSubmitted)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green, width: 1),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 18),
                      SizedBox(width: 8),
                      Text(
                        '¡Membresía activada con éxito!',
                        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2C1810), Color(0xFF1A0D06)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFD4A373).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '✨ BENEFICIOS VIP ✨',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD4A373),
              fontFamily: 'Georgia',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0xFF5C3A1E)),
          const SizedBox(height: 16),
          _buildBenefitItem(
            icon: Icons.discount,
            title: '15% de descuento',
            description: 'En todos los servicios',
          ),
          const SizedBox(height: 12),
          _buildBenefitItem(
            icon: Icons.cake,
            title: 'Corte de cumpleaños gratis',
            description: 'Durante tu mes de cumpleaños',
          ),
          const SizedBox(height: 12),
          _buildBenefitItem(
            icon: Icons.person_add,
            title: 'Prioridad en citas',
            description: 'Acceso anticipado a horarios',
          ),
          const SizedBox(height: 12),
          _buildBenefitItem(
            icon: Icons.card_giftcard,
            title: 'Productos exclusivos',
            description: 'Descuentos en productos de barbería',
          ),
          const SizedBox(height: 12),
          _buildBenefitItem(
            icon: Icons.people,
            title: 'Eventos especiales',
            description: 'Invitación a eventos VIP',
          ),
          const SizedBox(height: 12),
          _buildBenefitItem(
            icon: Icons.star,
            title: 'Acumulación de puntos',
            description: 'Canjeables por servicios',
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFD4A373).withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFD4A373).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: const Column(
              children: [
                Text(
                  '💎 INVERSIÓN',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFE8B86B)),
                ),
                SizedBox(height: 8),
                Text(
                  'Solo \$500 MXN / mes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFD4A373)),
                ),
                SizedBox(height: 8),
                Text(
                  'Cancela cuando quieras',
                  style: TextStyle(fontSize: 12, color: Color(0xFFF5E6D3)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 22, color: const Color(0xFFD4A373)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFE8B86B)),
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 12, color: Color(0xFFF5E6D3)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Color(0xFFD4A373)),
      prefixIcon: Icon(icon, color: const Color(0xFFD4A373)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF5C3A1E)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFD4A373), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1),
      ),
    );
  }
}