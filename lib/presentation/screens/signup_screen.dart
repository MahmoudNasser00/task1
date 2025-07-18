import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants.dart';
import '../../core/validators.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/auth_event.dart';
import '../blocs/auth_state.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/logo_text.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _signUpAction() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        SignUpEvent(
          emailController.text,
          passwordController.text,
          nameController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) async {
            if (state is AuthSuccess) {
              final confirmed = await showConfirmationDialog(
                context,
                "Account created for ${state.user.email}!",
              );
              if (confirmed) {
                Navigator.pop(context);
              }
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const LogoText(
                      title: "Sign Up",
                      subtitle: "Join us today!",
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      label: "Name",
                      controller: nameController,
                      validator: (value) =>
                          value!.isEmpty ? "Enter your name" : null,
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      label: "Email",
                      controller: emailController,
                      validator: emailValidator,
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      label: "Password",
                      controller: passwordController,
                      obscureText: true,
                      validator: passwordValidator,
                    ),
                    SizedBox(height: 30.h),
                    state is AuthLoading
                        ? CircularProgressIndicator(color: primaryColor)
                        : CustomButton(
                            text: "Sign Up",
                            onPressed: _signUpAction,
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
