// ignore_for_file: unused_local_variable, unused_element_parameter

import 'package:desarrollo_patroclos/pages_usuario/resumen_semanal.dart';
import 'package:desarrollo_patroclos/utils/Preferences.dart';
import 'package:flutter/material.dart';

class DashboardPageUser extends StatelessWidget {
  const DashboardPageUser({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const String userName = "Juan Luis";

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 243, 234),
      body: Row(
        children: [
          // Sidebar
          const _Sidebar(),
          // Contenido principal
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Encabezado superior
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 150, 105, 28),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Vienvenido $userName',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Cuerpo
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Panel Izquierdo - Menú semanal
                            Flexible(
                              flex: 3,
                              child: _MenuSemanalPanel(),
                            ),
                            const SizedBox(width: 16),
                            // Panel Derecho - Resumen
                            Flexible(
                              flex: 1,
                              child: TicketResumenSemanal(
                                totalPedidos: '12',
                                semana: '42',
                                onConfirmar: (){}),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Sidebar lateral
class _Sidebar extends StatelessWidget {
  const _Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "LOGO",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
          ),
          const Divider(),

          _SidebarItem(icon: Icons.dashboard, label: "Dashboard", onTap: () {}),
          _SidebarItem(icon: Icons.bug_report, label: "Levantar reporte", onTap: () {}),
          _SidebarItem(icon: Icons.local_dining, label: "Dinámica de Pedidos", onTap: () {}),
          _SidebarItem(icon: Icons.recycling, label: "Dinámica de Desechos", onTap: () {}),

          const Spacer(),
          
          
          // Redes Sociales
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.facebook, color: Colors.blue, size: 28),
                SizedBox(width: 12),
                Icon(Icons.camera_alt, color: Colors.purple, size: 28), // Instagram style
                SizedBox(width: 12),
                Icon(Icons.music_note, color: Colors.black, size: 28), // TikTok style
              ],
            ),
          ),
          
          _SidebarItem(icon: Icons.info_outline, label: "Sobre Nosotros", onTap: () {}),
          _SidebarItem(icon: Icons.logout, label: "Cerrar Sesión", onTap: () {}),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(label, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}

// Panel Izquierdo - Menú semanal con listas desplegables
class _MenuSemanalPanel extends StatelessWidget {

  _MenuSemanalPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("MENÚ",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text("Selecciona tu plato por día"),
            Text("Lunes"),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: platillosGeneral.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = platillosGeneral[index];
                  return ListTile(
                    title: Text(item["NOMBRE"]!),
                    onTap: (){},
                  );
                },
              ),
            ),
            FloatingActionButton(onPressed: (){})
          ],
        ),
      ),
    );
  }
}
