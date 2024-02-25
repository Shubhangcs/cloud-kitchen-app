import 'package:cloud_kitchen/bloc/bloc/authenticaton_bloc.dart';
import 'package:cloud_kitchen/views/login_page.dart';
import 'package:cloud_kitchen/views/widgets/custom_scaffold_messager.dart';
import 'package:cloud_kitchen/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
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
        } else if (state is RegisterSuccessState) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, "/login");
        } else if (state is RegisterFailedState) {
          Navigator.pop(context);
          ScaffoldMessage.showScaffoldMessanger(context, state.errorMessage);
        }
      },
      builder: (context, state) {
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
                        width: 260,
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
                      Text(
                        (state is InvalidEmailFormatState)
                            ? state.errorMessage
                            : (state is InvalidPasswordFormatState)
                                ? state.errorMessage
                                : "",
                        style: GoogleFonts.varelaRound(
                          color: Colors.red,
                        ),
                      ),
                      CustomTextField(
                        placeholder: "Username",
                        icon: Icons.person,
                        isObscure: false,
                        controller: userNameController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        placeholder: "Email",
                        icon: Icons.mail,
                        isObscure: false,
                        controller: userEmailController,
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
                        Navigator.pushReplacementNamed(context, "/login");
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
                      onPressed: () {
                        BlocProvider.of<AuthenticatonBloc>(context).add(
                          RegisterEvent(
                            userName: userNameController.text,
                            userEmailId: userEmailController.text,
                            userPassword: userPasswordController.text,
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
      },
    );
  }
}
