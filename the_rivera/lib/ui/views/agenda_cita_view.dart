import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_rivera_barberia/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:the_rivera_barberia/ui/buttons/custom_outlined_button.dart';

class AgendaCitaView extends StatefulWidget {
  const AgendaCitaView({super.key});

  @override
  State<AgendaCitaView> createState() => _AgendaCitaViewState();
}

class _AgendaCitaViewState extends State<AgendaCitaView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  
  String? _selectedBarbero;
  String? _selectedServicio;
  DateTime? _selectedDate;
  String? _selectedHora;
  bool _isLoading = false;
  bool _isSubmitted = false;
  
  // Nuevas variables para membresía y estudiante
  String? _tipoCliente;
  bool _tieneMembresia = false;
  bool _esEstudiante = false;
  double _descuentoAplicado = 0;
  double _precioTotal = 0;

  final List<String> _tipoClienteOptions = [
    'Cliente Regular',
    'Miembro VIP',
    'Estudiante',
    'Nuevo Cliente',
  ];

  final List<String> _barberos = [
    'Sergio Rivera',
    'Dany Méndez',
    'Dary Solis',
    'Carlos Álvarez',
    'Ana Suárez',
    'Luis Peralta',
  ];

  final List<Map<String, dynamic>> _servicios = [
    {'name': 'Corte Hombre', 'price': 130, 'duration': '30 min'},
    {'name': 'Corte Mujer', 'price': 170, 'duration': '45 min'},
    {'name': 'Corte Niños', 'price': 120, 'duration': '25 min'},
    {'name': 'Barba', 'price': 80, 'duration': '20 min'},
    {'name': 'Corte + Barba', 'price': 180, 'duration': '50 min'},
    {'name': 'Diseño de Color', 'price': 480, 'duration': '60 min'},
    {'name': 'Permanente', 'price': 400, 'duration': '90 min'},
    {'name': 'Secado con Secadora', 'price': 150, 'duration': '30 min'},
    {'name': 'Cejas y Perfilado', 'price': 60, 'duration': '15 min'},
  ];

  final List<String> _horarios = [
    '9:00 AM', '9:30 AM', '10:00 AM', '10:30 AM', '11:00 AM', '11:30 AM',
    '12:00 PM', '12:30 PM', '1:00 PM', '1:30 PM', '2:00 PM', '2:30 PM',
    '3:00 PM', '3:30 PM', '4:00 PM', '4:30 PM', '5:00 PM', '5:30 PM',
    '6:00 PM', '6:30 PM',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _calcularDescuento() {
    double precioBase = 0;
    if (_selectedServicio != null) {
      final servicio = _servicios.firstWhere(
        (s) => s['name'] == _selectedServicio,
        orElse: () => {'price': 0},
      );
      precioBase = servicio['price'].toDouble();
    }
    
    double descuento = 0;
    if (_tieneMembresia) {
      descuento = precioBase * 0.15; // 15% de descuento por membresía
    } else if (_esEstudiante) {
      descuento = precioBase * 0.10; // 10% de descuento por estudiante
    }
    
    setState(() {
      _descuentoAplicado = descuento;
      _precioTotal = precioBase - descuento;
    });
  }

  Future<void> _agendarCita() async {
    if (!_formKey.currentState!.validate()) return;
    
    if (_selectedBarbero == null) {
      _showSnackbar('Selecciona un barbero', Colors.orange);
      return;
    }
    
    if (_selectedServicio == null) {
      _showSnackbar('Selecciona un servicio', Colors.orange);
      return;
    }
    
    if (_selectedDate == null) {
      _showSnackbar('Selecciona una fecha', Colors.orange);
      return;
    }
    
    if (_selectedHora == null) {
      _showSnackbar('Selecciona una hora', Colors.orange);
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

    String mensaje = '¡Cita agendada con éxito!';
    if (_tieneMembresia) {
      mensaje += ' Descuento por membresía aplicado: \$${_descuentoAplicado.toStringAsFixed(0)}';
    } else if (_esEstudiante) {
      mensaje += ' Descuento por estudiante aplicado: \$${_descuentoAplicado.toStringAsFixed(0)}';
    }
    
    _showSnackbar(mensaje, Colors.green);
    
    _nameController.clear();
    _phoneController.clear();
    setState(() {
      _selectedBarbero = null;
      _selectedServicio = null;
      _selectedDate = null;
      _selectedHora = null;
      _tieneMembresia = false;
      _esEstudiante = false;
      _tipoCliente = null;
      _descuentoAplicado = 0;
      _precioTotal = 0;
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
            // Título centrado
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'AGENDAR CITA',
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
                  width: 220,
                  height: 2,
                  color: const Color(0xFFE8B86B),
                ),
              ],
            ),
            const SizedBox(height: 40),
            
            // Contenido principal
            isMobile
                ? Column(
                    children: [
                      _buildForm(),
                      const SizedBox(height: 30),
                      _buildInfoCard(),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildForm(),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        flex: 1,
                        child: _buildInfoCard(),
                      ),
                    ],
                  ),
            
            const SizedBox(height: 40),
            
            // Promociones destacadas
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'PROMOCIONES DESTACADAS',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4A373),
                    fontFamily: 'Georgia',
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Container(
                  width: 300,
                  height: 2,
                  color: const Color(0xFFE8B86B),
                ),
              ],
            ),
            const SizedBox(height: 25),
            _buildPromotions(),
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
            // Nombre
            TextFormField(
              controller: _nameController,
              style: const TextStyle(color: Color(0xFFF5E6D3)),
              decoration: _inputDecoration('Nombre Completo', Icons.person),
              validator: (value) => value?.isEmpty == true ? 'Ingresa tu nombre' : null,
            ),
            const SizedBox(height: 16),
            
            // Teléfono
            TextFormField(
              controller: _phoneController,
              style: const TextStyle(color: Color(0xFFF5E6D3)),
              decoration: _inputDecoration('Teléfono', Icons.phone),
              keyboardType: TextInputType.phone,
              validator: (value) => value?.isEmpty == true ? 'Ingresa tu teléfono' : null,
            ),
            const SizedBox(height: 16),
            
            // Tipo de Cliente
            DropdownButtonFormField<String>(
              decoration: _inputDecoration('Tipo de Cliente', Icons.people),
              value: _tipoCliente,
              items: _tipoClienteOptions.map((tipo) {
                return DropdownMenuItem<String>(
                  value: tipo,
                  child: Text(tipo, style: const TextStyle(color: Color(0xFFF5E6D3))),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _tipoCliente = value;
                  _tieneMembresia = value == 'Miembro VIP';
                  _esEstudiante = value == 'Estudiante';
                  _calcularDescuento();
                });
              },
              dropdownColor: const Color(0xFF2C1810),
              style: const TextStyle(color: Color(0xFFF5E6D3)),
              validator: (value) => value == null ? 'Selecciona tu tipo de cliente' : null,
            ),
            const SizedBox(height: 16),
            
            // Checkbox de Membresía (si no seleccionó Miembro VIP)
            if (_tipoCliente != 'Miembro VIP' && _tipoCliente != 'Estudiante')
              Row(
                children: [
                  Checkbox(
                    value: _tieneMembresia,
                    onChanged: (value) {
                      setState(() {
                        _tieneMembresia = value ?? false;
                        if (_tieneMembresia) _esEstudiante = false;
                        _calcularDescuento();
                      });
                    },
                    activeColor: const Color(0xFFD4A373),
                    checkColor: const Color(0xFF1A0D06),
                  ),
                  const Text(
                    '¿Tiene membresía? (15% de descuento)',
                    style: TextStyle(color: Color(0xFFF5E6D3), fontSize: 14),
                  ),
                ],
              ),
            
            // Checkbox de Estudiante
            if (_tipoCliente != 'Miembro VIP' && _tipoCliente != 'Estudiante')
              Row(
                children: [
                  Checkbox(
                    value: _esEstudiante,
                    onChanged: (value) {
                      setState(() {
                        _esEstudiante = value ?? false;
                        if (_esEstudiante) _tieneMembresia = false;
                        _calcularDescuento();
                      });
                    },
                    activeColor: const Color(0xFFD4A373),
                    checkColor: const Color(0xFF1A0D06),
                  ),
                  const Text(
                    '¿Es estudiante? (10% de descuento)',
                    style: TextStyle(color: Color(0xFFF5E6D3), fontSize: 14),
                  ),
                ],
              ),
            
            const SizedBox(height: 16),
            
            // Barbero
            DropdownButtonFormField<String>(
              decoration: _inputDecoration('Barbero', Icons.person_outline),
              value: _selectedBarbero,
              items: _barberos.map((barbero) {
                return DropdownMenuItem<String>(
                  value: barbero,
                  child: Text(barbero, style: const TextStyle(color: Color(0xFFF5E6D3))),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedBarbero = value;
                });
              },
              dropdownColor: const Color(0xFF2C1810),
              style: const TextStyle(color: Color(0xFFF5E6D3)),
              validator: (value) => value == null ? 'Selecciona un barbero' : null,
            ),
            const SizedBox(height: 16),
            
            // Servicio
            DropdownButtonFormField<String>(
              decoration: _inputDecoration('Servicio', Icons.cut),
              value: _selectedServicio,
              items: _servicios.map((servicio) {
                return DropdownMenuItem<String>(
                  value: servicio['name'] as String,
                  child: Text(
                    '${servicio['name']} - \$${servicio['price']}',
                    style: const TextStyle(color: Color(0xFFF5E6D3)),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedServicio = value;
                  _calcularDescuento();
                });
              },
              dropdownColor: const Color(0xFF2C1810),
              style: const TextStyle(color: Color(0xFFF5E6D3)),
              validator: (value) => value == null ? 'Selecciona un servicio' : null,
            ),
            const SizedBox(height: 16),
            
            // Resumen de precios
            if (_selectedServicio != null && (_tieneMembresia || _esEstudiante))
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Precio original:',
                          style: TextStyle(color: Color(0xFFF5E6D3), fontSize: 14),
                        ),
                        Text(
                          '\$${_obtenerPrecioBase().toStringAsFixed(0)}',
                          style: const TextStyle(
                            color: Color(0xFFF5E6D3),
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _tieneMembresia ? 'Descuento membresía (15%):' : 'Descuento estudiante (10%):',
                          style: const TextStyle(color: Color(0xFFE8B86B), fontSize: 14),
                        ),
                        Text(
                          '-\$${_descuentoAplicado.toStringAsFixed(0)}',
                          style: const TextStyle(color: Color(0xFFE8B86B), fontSize: 14),
                        ),
                      ],
                    ),
                    const Divider(color: Color(0xFF5C3A1E), height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total a pagar:',
                          style: TextStyle(
                            color: Color(0xFFD4A373),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${_precioTotal.toStringAsFixed(0)}',
                          style: const TextStyle(
                            color: Color(0xFFD4A373),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            
            const SizedBox(height: 16),
            
            // Fecha
            InkWell(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 60)),
                );
                if (date != null) {
                  setState(() {
                    _selectedDate = date;
                  });
                }
              },
              child: InputDecorator(
                decoration: _inputDecoration('Fecha', Icons.calendar_today),
                child: Text(
                  _selectedDate != null
                      ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
                      : 'Selecciona una fecha',
                  style: TextStyle(
                    color: _selectedDate != null ? const Color(0xFFF5E6D3) : const Color(0xFF8B7355),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Hora
            DropdownButtonFormField<String>(
              decoration: _inputDecoration('Hora', Icons.access_time),
              value: _selectedHora,
              items: _horarios.map((hora) {
                return DropdownMenuItem<String>(
                  value: hora,
                  child: Text(hora, style: const TextStyle(color: Color(0xFFF5E6D3))),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedHora = value;
                });
              },
              dropdownColor: const Color(0xFF2C1810),
              style: const TextStyle(color: Color(0xFFF5E6D3)),
              validator: (value) => value == null ? 'Selecciona una hora' : null,
            ),
            const SizedBox(height: 24),
            
            // Botón
            CustomOutlinedButton(
              text: 'AGENDAR CITA',
              onPressed: _agendarCita,
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
                        'Cita agendada con éxito',
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

  double _obtenerPrecioBase() {
    if (_selectedServicio == null) return 0;
    final servicio = _servicios.firstWhere(
      (s) => s['name'] == _selectedServicio,
      orElse: () => {'price': 0},
    );
    return servicio['price'].toDouble();
  }

  Widget _buildInfoCard() {
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
            'Horario de Atención',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD4A373),
              fontFamily: 'Georgia',
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow('Lunes - Viernes', '9:00 AM - 7:00 PM'),
          _buildInfoRow('Sábado', '9:00 AM - 3:00 PM'),
          _buildInfoRow('Domingo', 'Cerrado'),
          const SizedBox(height: 20),
          const Divider(color: Color(0xFF5C3A1E)),
          const SizedBox(height: 20),
          const Text(
            'Información Importante',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD4A373),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '• Llegar 10 minutos antes\n• Cancelar con 24 horas de anticipación\n• Se aceptan efectivo y tarjeta\n• Traer tu identificación',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFFF5E6D3),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFD4A373).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFD4A373).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🎓 Descuentos Especiales',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4A373),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '• Miembro VIP: 15% de descuento\n• Estudiante: 10% de descuento\n• Presentar credencial para aplicar descuento',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFFF5E6D3),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, color: Color(0xFF8B7355))),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF5E6D3),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromotions() {
    final List<Map<String, dynamic>> promotions = [
      {'name': '2x1 en Cortes', 'description': 'Lunes y Martes', 'discount': '50%', 'icon': Icons.local_offer},
      {'name': 'Descuento Estudiantes', 'description': 'Presentando credencial', 'discount': '20%', 'icon': Icons.school},
      {'name': 'Paquete Cumpleaños', 'description': 'Mes de tu cumpleaños', 'discount': '30%', 'icon': Icons.cake},
      {'name': 'Membresía VIP', 'description': '15% en todos los servicios', 'discount': '15%', 'icon': Icons.star},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: promotions.length,
      itemBuilder: (context, index) {
        final promo = promotions[index];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2C1810), Color(0xFF1A0D06)],
            ),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color(0xFFD4A373).withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(promo['icon'] as IconData, size: 32, color: const Color(0xFFD4A373)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFD4A373).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  promo['discount'],
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE8B86B),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                promo['name'],
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD4A373),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              Text(
                promo['description'],
                style: const TextStyle(
                  fontSize: 9,
                  color: Color(0xFFF5E6D3),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
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