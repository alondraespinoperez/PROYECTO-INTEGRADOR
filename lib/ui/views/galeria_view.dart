import 'package:flutter/material.dart';
import 'package:the_rivera_barberia/ui/layouts/dashboard/dashboard_layout.dart';

class GaleriaView extends StatefulWidget {
  const GaleriaView({super.key});

  @override
  State<GaleriaView> createState() => _GaleriaViewState();
}

class _GaleriaViewState extends State<GaleriaView> {
  // Lista de testimonios (dinámica)
  List<Map<String, dynamic>> testimonials = [
    {'name': 'Carlos M.', 'comment': 'Excelente servicio, muy profesionales. Mi corte quedó perfecto.', 'date': '15/05/2026', 'rating': 5},
    {'name': 'Ana L.', 'comment': 'Me encantó mi nuevo look, súper recomendado.', 'date': '10/05/2026', 'rating': 5},
    {'name': 'Javier R.', 'comment': 'Los barberos son muy atentos y el lugar es acogedor.', 'date': '05/05/2026', 'rating': 5},
    {'name': 'María F.', 'comment': 'Excelente atención y calidad en los servicios.', 'date': '01/05/2026', 'rating': 5},
    {'name': 'Pedro G.', 'comment': 'Muy profesionales, cumplen con lo que prometen.', 'date': '28/04/2026', 'rating': 5},
    {'name': 'Laura S.', 'comment': 'El mejor lugar para un cambio de look.', 'date': '25/04/2026', 'rating': 5},
  ];

  // Controladores del formulario
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  DateTime? _selectedDate;
  int _selectedRating = 5;
  bool _isSubmitted = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _submitOpinion() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor ingresa tu nombre'), backgroundColor: Colors.red),
      );
      return;
    }
    if (_commentController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor ingresa tu comentario'), backgroundColor: Colors.red),
      );
      return;
    }
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor selecciona una fecha'), backgroundColor: Colors.red),
      );
      return;
    }

    // Formatear fecha
    String formattedDate = "${_selectedDate!.day.toString().padLeft(2, '0')}/"
        "${_selectedDate!.month.toString().padLeft(2, '0')}/"
        "${_selectedDate!.year}";

    // Agregar nuevo testimonio
    setState(() {
      testimonials.insert(0, {
        'name': _nameController.text.trim(),
        'comment': _commentController.text.trim(),
        'date': formattedDate,
        'rating': _selectedRating,
      });
      _isSubmitted = true;
      // Limpiar formulario
      _nameController.clear();
      _commentController.clear();
      _selectedDate = null;
      _selectedRating = 5;
    });

    // Mostrar mensaje de éxito
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Comentario enviado'), backgroundColor: Colors.green),
    );

    // Ocultar el mensaje después de 3 segundos
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isSubmitted = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Título principal centrado
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'CATÁLOGO',
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
                  width: 195,
                  height: 2,
                  color: const Color(0xFFE8B86B),
                ),
              ],
            ),
            const SizedBox(height: 50),
            
            // Galería de cortes con imágenes
            _buildGalleryGrid(),
            
            const SizedBox(height: 60),
            
            // Subtítulo centrado
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'NUESTRO EQUIPO',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4A373),
                    fontFamily: 'Georgia',
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Container(
                  width: 253,
                  height: 2,
                  color: const Color(0xFFE8B86B),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildTeamSection(),
            
            const SizedBox(height: 60),
            
            // Subtítulo centrado
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'OPINIONES',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4A373),
                    fontFamily: 'Georgia',
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Container(
                  width: 158,
                  height: 2,
                  color: const Color(0xFFE8B86B),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildTestimonials(),
            
            const SizedBox(height: 40),
            
            // Formulario para agregar opinión
            _buildOpinionForm(),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildGalleryGrid() {
    final List<Map<String, dynamic>> cuts = [
  {
    'name': 'Corte Clásico Hombre',
    'description': 'Cortes de la escuela clásica para hombres',
    'style': 'Clásico',
    'price': '\$130 MXN',
    'image': 'assets/img/corte1.png'
  },
  {
    'name': 'Corte Buzz Mujer',
    'description': 'Estilo moderno y atrevido para mujeres',
    'style': 'Moderno',
    'price': '\$170 MXN',
    'image': 'assets/img/corte2.png'
  },
  {
    'name': 'Barba Estilizada',
    'description': 'Diseño, delineado y mantenimiento de barba',
    'style': 'Barba',
    'price': '\$80 MXN',
    'image': 'assets/img/corte3.png'
  },
  {
    'name': 'Corte Pixie Mujer',
    'description': 'Estilo corto y femenino con personalidad',
    'style': 'Femenino',
    'price': '\$170 MXN',
    'image': 'assets/img/corte4.png'
  },
  {
    'name': 'Corte Niño Pequeño',
    'description': 'Pequeños con estilo',
    'style': 'Infantil',
    'price': '\$120 MXN',
    'image': 'assets/img/corte5.png'
  },
  {
    'name': 'Corte Bob Mujer',
    'description': 'Estilo clásico y versátil',
    'style': 'Clásico',
    'price': '\$170 MXN',
    'image': 'assets/img/corte6.png'
  },
  {
    'name': 'Cortes Degradado',
    'description': 'Transición suave y moderna',
    'style': 'Moderno',
    'price': '\$130 MXN',
    'image': 'assets/img/corte7.png'
  },
  {
    'name': 'Corte Capas Mujer',
    'description': 'Volumen y movimiento',
    'style': 'Femenino',
    'price': '\$170 MXN',
    'image': 'assets/img/corte8.png'
  },
  {
    'name': 'Corte Web Mujer',
    'description': 'Ondulado en la base',
    'style': 'Tendencia',
    'price': '\$170 MXN',
    'image': 'assets/img/corte9.png'
  },
  {
    'name': 'Diseño de Barba',
    'description': 'Delineado profesional',
    'style': 'Barba',
    'price': '\$80 MXN',
    'image': 'assets/img/corte10.png'
  },
];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.68,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: cuts.length,
      itemBuilder: (context, index) {
        final cut = cuts[index];
        return _buildGalleryCard(
          cut['name'].toString(),
          cut['description'].toString(),
          cut['style'].toString(),
          cut['price'].toString(),
          cut['image'].toString(),
        );
      },
    );
  }

  Widget _buildGalleryCard(String name, String description, String style, String price, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2C1810), Color(0xFF1A0D06)],
        ),
        borderRadius: BorderRadius.circular(15),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 120,
                  width: double.infinity,
                  color: const Color(0xFFD4A373).withOpacity(0.2),
                  child: const Icon(
                    Icons.image,
                    size: 40,
                    color: Color(0xFFD4A373),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4A373),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4A373).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    style,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFE8B86B),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFFF5E6D3),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE8B86B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSection() {
    final List<Map<String, dynamic>> team = [
      {'name': 'Sergio Rivera', 'role': 'Especialista en cortes clásicos', 'stars': 5, 'experience': '10 años'},
      {'name': 'Dany Méndez', 'role': 'Maestro en estilos modernos', 'stars': 5, 'experience': '8 años'},
      {'name': 'Dary Solis', 'role': 'Experto en barbas', 'stars': 5, 'experience': '6 años'},
      {'name': 'Carlos Álvarez', 'role': 'Especialista en colorimetría', 'stars': 5, 'experience': '7 años'},
      {'name': 'Ana Suárez', 'role': 'Estilista profesional', 'stars': 5, 'experience': '5 años'},
      {'name': 'Luis Peralta', 'role': 'Barbero experto', 'stars': 5, 'experience': '4 años'},
    ];

    final List<Map<String, dynamic>> topRow = team.sublist(0, 3);
    final List<Map<String, dynamic>> bottomRow = team.sublist(3, 6);

    return Column(
      children: [
        Row(
          children: topRow.map((member) {
            return Expanded(
              child: _buildTeamCard(member),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        Row(
          children: bottomRow.map((member) {
            return Expanded(
              child: _buildTeamCard(member),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTeamCard(Map<String, dynamic> member) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
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
          CircleAvatar(
            radius: 35,
            backgroundColor: const Color(0xFFD4A373).withOpacity(0.2),
            child: Text(
              member['name'][0],
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD4A373),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            member['name'],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD4A373),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Text(
            member['role'],
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFFE8B86B),
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Text(
            member['experience'],
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFFF5E6D3),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return const Icon(
                Icons.star,
                size: 14,
                color: Color(0xFFE8B86B),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonials() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.8,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: testimonials.length,
      itemBuilder: (context, index) {
        final testimonial = testimonials[index];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2C1810), Color(0xFF1A0D06)],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFD4A373).withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: const Color(0xFFD4A373).withOpacity(0.2),
                    child: Text(
                      testimonial['name'][0],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD4A373),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          testimonial['name'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD4A373),
                          ),
                        ),
                        Text(
                          testimonial['date'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF8B7355),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: List.generate(testimonial['rating'], (index) {
                      return const Icon(
                        Icons.star,
                        size: 12,
                        color: Color(0xFFE8B86B),
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                testimonial['comment'],
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFFF5E6D3),
                  height: 1.4,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOpinionForm() {
    return Column(
      children: [
        const Text(
          'DEJA TU OPINIÓN',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFFD4A373),
            fontFamily: 'Georgia',
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 205,
          height: 2,
          color: const Color(0xFFE8B86B),
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(20),
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
            children: [
              // Nombre completo
              TextField(
                controller: _nameController,
                style: const TextStyle(color: Color(0xFFF5E6D3)),
                decoration: InputDecoration(
                  labelText: 'Nombre Completo',
                  labelStyle: const TextStyle(color: Color(0xFFD4A373)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF5C3A1E)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFD4A373), width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Fecha
              InkWell(
                onTap: () => _selectDate(context),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Fecha',
                    labelStyle: const TextStyle(color: Color(0xFFD4A373)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF5C3A1E)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFFD4A373), width: 2),
                    ),
                  ),
                  child: Text(
                    _selectedDate != null
                        ? "${_selectedDate!.day.toString().padLeft(2, '0')}/"
                          "${_selectedDate!.month.toString().padLeft(2, '0')}/"
                          "${_selectedDate!.year}"
                        : 'Selecciona una fecha',
                    style: TextStyle(
                      color: _selectedDate != null ? const Color(0xFFF5E6D3) : const Color(0xFF8B7355),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Calificación con estrellas
              Row(
                children: [
                  const Text(
                    'Calificación: ',
                    style: TextStyle(color: Color(0xFFD4A373), fontSize: 16),
                  ),
                  ...List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        index < _selectedRating ? Icons.star : Icons.star_border,
                        color: const Color(0xFFE8B86B),
                        size: 28,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedRating = index + 1;
                        });
                      },
                    );
                  }),
                ],
              ),
              const SizedBox(height: 16),
              // Comentario
              TextField(
                controller: _commentController,
                style: const TextStyle(color: Color(0xFFF5E6D3)),
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Tu comentario',
                  labelStyle: const TextStyle(color: Color(0xFFD4A373)),
                  alignLabelWithHint: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF5C3A1E)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFD4A373), width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Botón enviar
              ElevatedButton(
                onPressed: _submitOpinion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4A373),
                  foregroundColor: const Color(0xFF1A0D06),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'ENVIAR OPINIÓN',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
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
                          'Comentario enviado',
                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}