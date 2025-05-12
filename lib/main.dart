import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dulcería App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const ProductScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  final String imageUrl =
      'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSIGLvweM0pu6mTOI4oHZFvfAQEAvoGZC3oj_zDVVJ0KeUVQYz1rjLU9cur8Qbfaf2QnBOc5h9OOrwqaE2YwbnXCyqqOuhBgDRpNo0Nv9Rb6L3_HBdP8QcE';
  final String logoUrl =
      "https://raw.githubusercontent.com/Miguel-Rios1094/DulceriaVero_imagenes_app_flutter/refs/heads/main/Vero(1).png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: SizedBox(
            height: 80,
            width: 200,
            child: Image.network(
              logoUrl,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Dulcería Vero');
              },
            ),
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Acción al presionar la búsqueda
            },
          ),
        ],
      ),
      drawer: AppDrawer.buildDrawer(context),
      body: Container(
        color: Colors.green,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  'PRODUCTOS',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              _buildProductGrid(context),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Text(
                  '¡LO ÚLTIMO!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              _buildProductGrid(context),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Text(
                  '¡OFERTAS!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              _buildProductGrid(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.75,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image_not_supported);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar "Ver"
              },
              child: const Text('Ver'),
            ),
          ],
        );
      },
    );
  }
}

// Nueva clase para la pantalla de perfil
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          // Usar Builder para obtener el contexto del Scaffold
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Mostrar el Drawer
              },
            );
          },
        ),
        title: Center(
          child: SizedBox(
            height: 80,
            child: Image.network(
              "https://raw.githubusercontent.com/Miguel-Rios1094/DulceriaVero_imagenes_app_flutter/refs/heads/main/Vero(1).png",
              fit: BoxFit.contain,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: AppDrawer.buildDrawer(context),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[800],
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/149/149071.png",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Bienvenido!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'Lorem ipsum dolor sit amet.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurple,
                  ),
                  child: const Text(
                    'Administrador',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _buildProfileOption(context, 'Administrar Productos', () {
                /* Navegar a la pantalla de productos */
              }),
              _buildProfileOption(context, 'Administrar Sucursales', () {
                /* Navegar a la pantalla de sucursales */
              }),
              _buildProfileOption(context, 'Administrar Empleados', () {
                /* Navegar a la pantalla de empleados */
              }),
              _buildProfileOption(context, 'Administrar Proveedor', () {
                /* Navegar a la pantalla de proveedores */
              }),
              _buildProfileOption(context, 'Administrar Cliente', () {
                /* Navegar a la pantalla de clientes */
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }

  // Método para construir las opciones de la pantalla de perfil
  Widget _buildProfileOption(
      BuildContext context, String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class AppDrawer {
  static Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[800],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _buildDrawerHeader(),
            _buildDrawerItem(Icons.home, 'Inicio', () {
              Navigator.pop(context);
            }),
            _buildDrawerItem(Icons.shopping_bag, 'Productos', () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductScreen(),
                ),
              );
            }),
            _buildDrawerItem(Icons.info, 'Información', () {
              Navigator.pop(context);
            }),
            _buildDrawerItem(Icons.person, 'Ver Perfil', () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            }),
            _buildDrawerItem(Icons.logout, 'Cerrar Sesión', () {
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }

  // Método para construir el encabezado del Drawer
  static Widget _buildDrawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.grey[900],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Image.network(
              "https://raw.githubusercontent.com/Miguel-Rios1094/DulceriaVero_imagenes_app_flutter/refs/heads/main/Vero(1).png",
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Dulcería Vero',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Método para construir los elementos del Drawer
  static Widget _buildDrawerItem(
      IconData icon, String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[800],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 12),
          minimumSize: const Size(double.infinity, 0),
          textStyle: const TextStyle(fontSize: 16),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Text(text),
          ],
        ),
      ),
    );
  }
}

// Nueva clase para la barra de navegación inferior
class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.grey[800],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Productos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
      onTap: (int index) {
        // Manejar la navegación al tocar un elemento de la barra de navegación
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductScreen()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductScreen()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()),
          );
        }
      },
    );
  }
}
