import 'package:flutter/material.dart';

class TicketResumenSemanal extends StatelessWidget {
  final String totalPedidos;
  final String semana;
  final VoidCallback onConfirmar;

  const TicketResumenSemanal({
    Key? key,
    required this.totalPedidos,
    required this.semana,
    required this.onConfirmar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // 🧾 Encabezado tipo ticket
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 92, 60, 4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Center(
                child: Text(
                  'Resumen',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // ✂️ Línea punteada tipo ticket
            Container(
              height: 1,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return CustomPaint(
                    painter: DottedLinePainter(),
                    size: Size(constraints.maxWidth, 1),
                  );
                },
              ),
            ),

            // 📊 Contenido
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Estado:',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Pendiente',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 92, 60, 4),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 300),
            BotonConfirmarAnimado(onConfirmado: onConfirmar)
          ],
        ),
      ),
    );
  }
}

// 🧵 Painter para línea punteada
class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double dashWidth = 6;
    const double dashSpace = 4;
    double startX = 0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BotonConfirmarAnimado extends StatefulWidget {
  final VoidCallback onConfirmado;

  const BotonConfirmarAnimado({Key? key, required this.onConfirmado})
      : super(key: key);

  @override
  State<BotonConfirmarAnimado> createState() => _BotonConfirmarAnimadoState();
}

class _BotonConfirmarAnimadoState extends State<BotonConfirmarAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _arrowSlide;
  bool _confirmado = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _arrowSlide = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _onPressed() {
    if (_confirmado) return;

    _controller.forward().then((_) {
      setState(() {
        _confirmado = true;
      });
      widget.onConfirmado();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      width: 230,
      height: 50,
      decoration: BoxDecoration(
        color: _confirmado ? Colors.green : Color.fromARGB(255, 92, 60, 4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (!_confirmado)
            AnimatedBuilder(
              animation: _arrowSlide,
              builder: (context, child) {
                double maxSlide = 180; // ancho disponible para moverse
                return Positioned(
                  left: 20 + _arrowSlide.value * maxSlide,
                  child: Icon(
                    Icons.keyboard_double_arrow_right_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                );
              },
            )
          else
            const Icon(
              Icons.check_circle_outline,
              color: Colors.white,
              size: 28,
            ),
          IgnorePointer(
            ignoring: _confirmado,
            child: TextButton(
              onPressed: _onPressed,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Visibility(
                visible: !_confirmado,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text(
                      "Confirmar pedidos",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

