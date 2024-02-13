import 'package:cloud_kitchen/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 80,
              decoration: BoxDecoration(
                color: Colors.amber.shade400,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Text(
                      "Welcome To",
                      style: GoogleFonts.stylish(
                        color: Colors.brown.shade600,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/logo.png",
                    width: 280,
                  ),
                  Center(
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.stylish(
                          color: Colors.brown,
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    placeholder: "Username",
                    icon: Icons.person,
                    isObscure: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    placeholder: "Email",
                    icon: Icons.mail,
                    isObscure: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    placeholder: "Password",
                    icon: Icons.key,
                    isObscure: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.amber.shade400),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const SizedBox(
                    width: 40,
                    height: 60,
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.brown,
                        size: 30,
                      ),
                    ),
                  ),
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
                    width: MediaQuery.of(context).size.width - 168,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Sign Up',
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
          ],
        ),
      ),
    );
  }
}
