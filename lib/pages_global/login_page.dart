import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _acceptedTerms = false;
  bool _obscureText = true;

  void _login() {
    if (!_acceptedTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes aceptar los términos y condiciones')),
      );
      return;
    }

    final user = _userController.text.trim();
    final pass = _passController.text.trim();

    // 🔐 Aquí iría tu lógica de autenticación (consulta a tu API / base de datos)
    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos')),
      );
      return;
    }

    // Ejemplo de navegación dependiendo de rol
    // if (rol == 'admin') { Navigator.pushReplacementNamed(context, '/admin'); }
    // else if (rol == 'colaborador') { Navigator.pushReplacementNamed(context, '/colaborador'); }
    // else { Navigator.pushReplacementNamed(context, '/usuario'); }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Inicio de sesión simulado ✅')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 🟦 Parte superior con logo
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Center(
                //child: Image.asset('assets/logo.png',height: 140),
              ),
            ),
          ),

          // 🟩 Parte inferior con formulario
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              color: Color.fromARGB(255, 222, 182, 113), // Color sólido corporativo
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: TextField(
                          controller: _userController,
                          decoration: InputDecoration(
                            hintText: 'Usuario',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(Icons.person),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: TextField(
                          controller: _passController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // ✅ Checkbox de términos
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Checkbox(
                                value: _acceptedTerms,
                                onChanged: (value) {
                                  setState(() {
                                    _acceptedTerms = value ?? false;
                                  });
                                },
                                activeColor: Colors.white,
                                checkColor: Colors.blue,
                              ),
                            const Text(
                                      'Acepto los',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text('Términos y Condiciones', style: TextStyle(color: Colors.white),),
                                    ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF1A237E),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: _login,
                          child: const Text(
                            'Iniciar Sesión',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // 📞 Contacto
                      GestureDetector(
                        onTap: () {
                          // Abre WhatsApp, correo o tu formulario de contacto
                        },
                        child: const Text(
                          '¿Problemas para ingresar? Ponte en contacto con la empresa',
                          style: TextStyle(
                            color: Colors.white70,
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
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
