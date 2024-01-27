import 'package:cloud_kitchen/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.amber.shade400,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              height: MediaQuery.of(context).size.height - 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/logo.png',
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    "Sign In",
                    style: GoogleFonts.stylish(
                      color: Colors.brown,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    placeholder: "Email",
                    icon: Icons.mail,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    placeholder: "Password",
                    icon: Icons.key,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Align(
                    alignment: Alignment(0.85, 0),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Colors.amber.shade400),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                height: 60,
                child: Center(
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.stylish(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
              style: ButtonStyle(
                surfaceTintColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                elevation: const MaterialStatePropertyAll(0),
                side: MaterialStatePropertyAll(
                    BorderSide(color: Colors.amber.shade400, width: 3)),
                backgroundColor: const MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                height: 60,
                child: Center(
                  child: Text(
                    'Register',
                    style: GoogleFonts.stylish(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
