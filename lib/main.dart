import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/mongodb.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(
    const MaterialApp(
      title: 'Proyecto',
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Opciones',
          onPressed: null,
        ),
        title: const Text(
          'Taller MJ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Image(
                  image: AssetImage('assets/Fondo.jpeg'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Empresa especializada en las motocicletas\n'
                  'tanto la parte de mantenimiento y reparación\n'
                  'como el área de venta de repuestos y accesorios.\n',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                CarouselSlider(
                  items: [
                    Image.asset('assets/img1.jpeg'),
                    Image.asset('assets/img2.jpeg'),
                    Image.asset('assets/img3.jpeg'),
                  ],
                  options: CarouselOptions(
                    height: 200,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const ServicesSection(),
            Container(
              color: const Color.fromARGB(255, 226, 250, 255),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'NUESTROS PROVEEDORES',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Estos proveedores son fundamentales para asegurar que el taller tenga acceso a los recursos necesarios para llevar a cabo las reparaciones y el mantenimiento de las motocicletas de manera eficiente.',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Abre un diálogo con las imágenes de proveedores
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Imágenes de proveedores'),
                                content: Column(
                                  children: [
                                    Image.asset('assets/honda.png'),
                                    Image.asset('assets/Auteco.png'),
                                    Image.asset('assets/BAJAB.png'),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cerrar'),
                                  ),
                                ],
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.orange,
                          ),
                          child: const Text('Ver proveedores'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                      width: 20), // Espacio entre el texto y la imagen
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/proveedores.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white, // Fondo blanco
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'PETICIONES, QUEJAS O RECLAMOS (PQR)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Texto negro
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '¿Tiene alguna solicitud, queja o reclamo? Le invitamos a escanear el código o hacer clic en el enlace, para compartirlo con nosotros.',
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          Colors.black87, // Texto negro ligeramente más oscuro
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    'assets/pqr.png', // Ruta de la imagen
                    width: 100, // Ancho de la imagen
                    height: 100, // Alto de la imagen
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      // Aquí puedes manejar la acción cuando se hace clic en el texto
                      // ignore: deprecated_member_use
                      launch(
                          'https://forms.gle/xkbWyBdDbSQwBZz7A'); // Abre el enlace en el navegador
                    },
                    child: const Text(
                      'Haz clic aquí', // Texto del enlace
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(
                            255, 0, 0, 0), // Color del texto del enlace
                        decoration: TextDecoration
                            .underline, // Subrayado para indicar que es un enlace
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey[800], // Color gris oscuro
              padding: const EdgeInsets.all(20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'MOTOS Y SERVICIOS DEL SUR JM',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Texto blanco
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '© 2023 Todos los derechos reservados | Taller JM\n'
                    'NIT 1098308671 | Car.14 # 68B 93 SUR | Bogotá, Colombia',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 241, 253, 255), // Texto blanco
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.facebook,
                        color: Colors.orange,
                        size: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceOption extends StatelessWidget {
  final String title;
  final String description;

  const ServiceOption({
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class ServicesSection extends StatefulWidget {
  const ServicesSection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ServicesSectionState createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  bool _showServices = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _showServices = !_showServices;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Servicios',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Icon(
                _showServices ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                size: 30,
              ),
            ],
          ),
        ),
        if (_showServices)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ServiceOption(
                  title: 'Reparaciones Mecánicas',
                  description:
                      'Nos encargamos de reparación o reemplazo de piezas defectuosas a desgastadas, ajustes de motor, reparación de sistemas de transmisión, reparación de sistemas de escape, reparación de sistemas de suspensión, y solución de problemas eléctricas',
                ),
                ServiceOption(
                  title: 'Mantenimiento Programado',
                  description:
                      'Nos encargamos de cambios de aceite, cambios de filtros de aire y de aceite, ajustes de la cadena de transmisión, ajustes de válvulas, limpieza de carburadores o inyectores, y revisión general del sistema de frenos',
                ),
                ServiceOption(
                  title: 'Servicio de Diagnóstico',
                  description:
                      'Nos encargamos de identificar una falla en específico o situaciones anormales donde elaboramos mediante procedimientos adecuados en los cuales plasmamos todos nuestros conocimientos como especialistas en mecánica.',
                ),
              ],
            ),
          ),
        const SizedBox(height: 20),
      ],
    );
  }
}
