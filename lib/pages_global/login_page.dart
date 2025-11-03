import 'package:desarrollo_patroclos/pages_admin/dashboard_admin.dart';
import 'package:desarrollo_patroclos/pages_usuario/dashboard_usuario.dart';
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
    
    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('iniciando sesión')));
    //Aquí iría la lógica de autenticación (consulta a base de datos)

     //TODO:  navegación dependiendo de rol cambiar
    if (user == 'admin') {
            Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => DashboardAdmin(),
          transitionDuration: const Duration(milliseconds: 0),
        ),
      ); }
    else {
            Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => DashboardPageUser(),
          transitionDuration: const Duration(milliseconds: 0),
        ),
      );}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Parte superior -logo-
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              color: Color.fromARGB(255, 246, 243, 234),
              child: Center(
                child: Image.asset('assets/logo_patroclos.png',height: 350),
              ),
            ),
          ),
          //Parte inferior -formulario-
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              color: Color.fromARGB(255, 255, 240, 217),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2,
                        child: TextField(
                          controller: _userController,
                          autofillHints: const [AutofillHints.username],
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2,
                        child: TextField(
                          controller: _passController,
                          obscureText: _obscureText,
                          autofillHints: const [AutofillHints.password],
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
                      // Checkbox de términos y condiciones, redirigir a pagina con los terminos y condiciones correspondientes, proporcionados
                      SizedBox(
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
                              TextButton(
                              onPressed: () {},
                              child: const Text('Acepto los Términos y Condiciones', style: TextStyle(color: Colors.black),),
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
                            foregroundColor: Color.fromARGB(225, 255, 152, 0),
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

                      // Contacto
                      GestureDetector(
                        onTap: () {
                          print("contacto");
                          // Abrir WhatsApp o formulario/ correo
                        },
                        child: const Text(
                          '¿Problemas para ingresar? Ponte en contacto con nosotros',
                          style: TextStyle(
                            color: Colors.black54,
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
