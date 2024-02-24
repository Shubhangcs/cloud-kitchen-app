import 'package:cloud_kitchen/bloc/bloc/authenticaton_bloc.dart';
import 'package:cloud_kitchen/views/home_page.dart';
import 'package:cloud_kitchen/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_page.dart';
import 'widgets/custom_scaffold_messager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userEmailIdController = TextEditingController();
  final userPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticatonBloc, AuthenticatonState>(
      listener: (context, state) {
        if (state is LoadingState) {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.yellow,
                  ),
                );
              });
        } else if (state is ExceptionState) {
          Navigator.pop(context);
          ScaffoldMessage.showScaffoldMessanger(context, state.exception);
        } else if (state is LoginFailedState) {
          Navigator.pop(context);
          ScaffoldMessage.showScaffoldMessanger(context, state.errorMessage);
        } else if (state is LoginSuccessState) {
          Navigator.pop(context);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
      },
      builder: (context, state) {
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
                       CustomTextField(
                        placeholder: "Email",
                        icon: Icons.mail,
                        isObscure: false,
                        controller: userEmailIdController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                       CustomTextField(
                        placeholder: "Password",
                        icon: Icons.key,
                        isObscure: true,
                        controller: userPasswordController,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
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
                        builder: (context) => BlocProvider(
                          create: (context) => AuthenticatonBloc(),
                          child: const RegisterPage(),
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    surfaceTintColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    elevation: const MaterialStatePropertyAll(0),
                    side: MaterialStatePropertyAll(
                        BorderSide(color: Colors.amber.shade400, width: 3)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.white),
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
      },
    );
  }
}
