// ignore_for_file: unused_local_variable, unused_element_parameter

import 'package:desarrollo_patroclos/pages_usuario/resumen_semanal.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const String userName = "Juan Luis";

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
                    color: Color.fromARGB(255, 92, 60, 4),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'PATROCLO´S MORNING DELIGHTS TE DA LA BIENVENIDA AL MENú',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.account_circle, color: Colors.white, size: 28),
                          const SizedBox(width: 8),
                          Text(
                            userName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
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

// 🧭 Sidebar lateral
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
              "PANEL",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
          ),
          const Divider(),

          _SidebarItem(icon: Icons.dashboard, label: "Dashboard", onTap: () {}),
          _SidebarItem(icon: Icons.history, label: "Pedidos Pasados", onTap: () {}),
          _SidebarItem(icon: Icons.bug_report, label: "Reportar un Error", onTap: () {}),
          _SidebarItem(icon: Icons.thumb_up, label: "Recomendaciones", onTap: () {}),
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

          _SidebarItem(icon: Icons.logout, label: "Cerrar Sesión", onTap: () {}),
          _SidebarItem(icon: Icons.info_outline, label: "Sobre Nosotros", onTap: () {}),
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

// 📅 Panel Izquierdo - Menú semanal con listas desplegables
class _MenuSemanalPanel extends StatelessWidget {
  final List<Map<String, dynamic>> menu = [
    {"dia": "Lunes"},
    {"dia": "Martes"},
    {"dia": "Miércoles"},
    {"dia": "Jueves"},
    {"dia": "Viernes"},
  ];

  final List<String> opciones = [
    "Opción 1 - Ensalada César",
    "Opción 2 - Tacos de Pollo",
    "Opción 3 - Pasta Alfredo",
    "Opción 4 - Salmón con Verduras",
    "Opción 5 - Pizza Artesanal",
  ];

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
            const Text(
              "Selecciona tu plato por día",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: menu.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = menu[index];
                  return _MenuCard(
                    dia: item["dia"],
                    opciones: opciones,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuCard extends StatefulWidget {
  final String dia;
  final List<String> opciones;

  const _MenuCard({
    required this.dia,
    required this.opciones,
  });

  @override
  State<_MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<_MenuCard> {
  String? seleccion;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.dia,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  DropdownButton<String>(
                    value: seleccion,
                    isExpanded: true,
                    hint: const Text("Selecciona una opción"),
                    items: widget.opciones
                        .map((op) => DropdownMenuItem(
                              value: op,
                              child: Text(op),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        seleccion = value;
                      });
                    },
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