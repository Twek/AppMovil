import 'package:flutter/material.dart'; // Importación del paquete Flutter
import 'package:url_launcher/url_launcher.dart'; // Importación del paquete para lanzar URL
import 'package:carousel_slider/carousel_slider.dart'; // Importación del paquete para el carrusel

// Función principal para ejecutar la aplicación
void main() async {
  runApp(
    const MaterialApp(
      title: 'Proyecto', // Título de la aplicación
      home: MyApp(), // Widget principal de la aplicación
    ),
  );
}

// Widget principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Taller MJ', // Título de la aplicación
          style: TextStyle(
            fontWeight: FontWeight.bold, // Estilo del texto
          ),
          textAlign: TextAlign.center, // Alineación del texto
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20), // Espacio en blanco
                const Image(
                  image: AssetImage(
                      'assets/Fondo.jpeg'), // Imagen de fondo de motocicleta
                ),
                const SizedBox(height: 20), // Espacio en blanco
                const Text(
                  'Empresa especializada en las motocicletas\n'
                  'tanto la parte de mantenimiento y reparación\n'
                  'como el área de venta de repuestos y accesorios.\n', // Texto descriptivo
                  style: TextStyle(
                    fontSize: 15, // Tamaño del texto
                  ),
                  textAlign: TextAlign.center, // Alineación del texto
                ),
                const SizedBox(height: 20),
                // Espacio en blanco
                CarouselSlider(
                  // Carrusel de imágenes
                  items: [
                    Image.asset('assets/img1.jpeg'), // Imagen de sedes
                    Image.asset('assets/img2.jpeg'), // Imagen de sedes
                    Image.asset('assets/img3.jpeg'), // Imagen de sedes
                  ],
                  //detalles sobre la configuracion del tiempo y etc
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
            const SizedBox(height: 20), // Espacio en blanco
            const ServicesSection(), // Sección de servicios
            // Sección de proveedores
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
                            'NUESTROS PROVEEDORES', // Título de la sección
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 10), // Espacio en blanco
                        const Text(
                          'Estos proveedores son fundamentales para asegurar que el taller tenga acceso a los recursos necesarios para llevar a cabo las reparaciones y el mantenimiento de las motocicletas de manera eficiente.', // Descripción de los proveedores
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),

                        const SizedBox(height: 20), // Espacio en blanco
                        ElevatedButton(
                          onPressed: () {
                            // Abre un diálogo con las imágenes de proveedores
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                    'Nuestros proveedores:'), // Título del diálogo
                                content: Column(
                                  children: [
                                    Image.asset(
                                        'assets/honda.png'), // Imagen de proveedor 1
                                    Image.asset(
                                        'assets/Auteco.png'), // Imagen de proveedor 2
                                    Image.asset(
                                        'assets/BAJAB.png'), // Imagen de proveedor 3
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                        'Cerrar'), // Botón para cerrar el diálogo
                                  ),
                                ],
                              ),
                            );
                          },
                          //color del fondo y texto del boton de proveedores
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.orange,
                          ),
                          child:
                              const Text('Ver proveedores'), // Texto del botón
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                      width: 20), // Espacio entre el texto y la imagen
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/proveedores.png', // Imagen de los señores hablando a la derecha de la informacion
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
            // Sección de Peticiones, Quejas o Reclamos (PQR)
            Container(
              color: Colors.white, // Fondo blanco
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'PETICIONES, QUEJAS O RECLAMOS (PQR)', // Título de la sección
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Texto negro
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10), // Espacio en blanco
                  const Text(
                    '¿Tiene alguna solicitud, queja o reclamo? Le invitamos a escanear el código o hacer clic en el enlace, para compartirlo con nosotros.', // Descripción
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          Colors.black87, // Texto negro ligeramente más oscuro
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10), // Espacio en blanco
                  Image.asset(
                    'assets/pqr.png', // Imagen del código QR
                    width: 100, // Ancho de la imagen
                    height: 100, // Alto de la imagen
                  ),
                  const SizedBox(height: 10), // Espacio en blanco
                  GestureDetector(
                    onTap: () {
                      // Abre el enlace en el navegador cuando se hace clic
                      // ignore: deprecated_member_use
                      launch(
                          'https://forms.gle/xkbWyBdDbSQwBZz7A'); // Enlace para las PQR
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
            // Sección del pie de página
            Container(
              color: Colors.grey[800], // Color gris oscuro
              padding: const EdgeInsets.all(20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'MOTOS Y SERVICIOS DEL SUR JM', // Título del pie de página
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
                    'NIT 1098308671 | Car.14 # 68B 93 SUR | Bogotá, Colombia', // Información del taller
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 241, 253, 255), // Texto blanco
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
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

// Widget para cada opción de servicio
class ServiceOption extends StatelessWidget {
  final String title; // Título del servicio
  final String description; // Descripción del servicio

  const ServiceOption({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title, // Título del servicio
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5), // Espacio en blanco
        Text(
          description, // Descripción del servicio
          style: const TextStyle(
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10), // Espacio en blanco
      ],
    );
  }
}

// Widget para la sección de servicios
class ServicesSection extends StatefulWidget {
  const ServicesSection({Key? key});

  @override
  _ServicesSectionState createState() => _ServicesSectionState();
}

// Estado para la sección de servicios
class _ServicesSectionState extends State<ServicesSection> {
  bool _showServices = false; // Estado para mostrar u ocultar los servicios

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _showServices = !_showServices; // Cambia el estado al hacer clic
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Servicios', // Título de la sección
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Icon(
                _showServices
                    ? Icons.arrow_drop_up
                    : Icons
                        .arrow_drop_down, // Icono de flecha hacia arriba o hacia abajo
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
                  title: 'Reparaciones Mecánicas', // Título del servicio
                  description:
                      'Nos encargamos de reparación o reemplazo de piezas defectuosas a desgastadas, ajustes de motor, reparación de sistemas de transmisión, reparación de sistemas de escape, reparación de sistemas de suspensión, y solución de problemas eléctricas', // Descripción del servicio
                ),
                ServiceOption(
                  title: 'Mantenimiento Programado', // Título del servicio
                  description:
                      'Nos encargamos de cambios de aceite, cambios de filtros de aire y de aceite, ajustes de la cadena de transmisión, ajustes de válvulas, limpieza de carburadores o inyectores, y revisión general del sistema de frenos', // Descripción del servicio
                ),
                ServiceOption(
                  title: 'Servicio de Diagnóstico', // Título del servicio
                  description:
                      'Nos encargamos de identificar una falla en específico o situaciones anormales donde elaboramos mediante procedimientos adecuados en los cuales plasmamos todos nuestros conocimientos como especialistas en mecánica.', // Descripción del servicio
                ),
              ],
            ),
          ),
        const SizedBox(height: 20), // Espacio en blanco
      ],
    );
  }
}
