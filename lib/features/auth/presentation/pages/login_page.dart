import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wisata_app/core/core.dart';
import 'package:flutter_wisata_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../home/presentation/pages/home_page.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: AppColors.primary,
        body: Stack(
          children: [
            SizedBox(
              height: 260.0,
              child: Center(
                  child: ClipRRect(
                      child:
                          Image.asset('assets/images/ata.png', height: 100))),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0)),
                  child: ColoredBox(
                    color: AppColors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 28.0, vertical: 44.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: emailController,
                            label: 'Email',
                            isOutlineBorder: false,
                          ),
                          const SpaceHeight(36.0),
                          CustomTextField(
                            controller: passwordController,
                            label: 'Password',
                            isOutlineBorder: false,
                            obscureText: true,
                          ),
                          const SpaceHeight(50.0),
                          BlocConsumer<LoginBloc, LoginState>(
                            listener: (context, state) {
                              state.maybeWhen(
                                  orElse: () {},
                                  success: (authResponseModel) {
                                    // Simpan data login
                                    AuthLocalDatasource()
                                        .saveAuthData(authResponseModel);
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            backgroundColor: Colors.white,
                                            content: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Lottie.asset(
                                                  'assets/lottie/success.json',
                                                  width: 100,
                                                  height: 100,
                                                ),
                                              ],
                                            ));
                                      },
                                    );
                                    Future.delayed(Duration(seconds: 2), () {
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                        builder: (context) => const HomePage(),
                                      ));
                                    });
                                  },
                                  error: (message) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            backgroundColor: Colors.white,
                                            content: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Lottie.asset(
                                                  'assets/lottie/failed.json',
                                                  width: 100,
                                                  height: 100,
                                                ),
                                                Text(message)
                                              ],
                                            ));
                                      },
                                    );
                                  });
                            },
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () {
                                  return Button.filled(
                                    onPressed: () {
                                      if (emailController.text.isEmpty ||
                                          passwordController.text.isEmpty) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                                backgroundColor: Colors.white,
                                                content: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Lottie.asset(
                                                      'assets/lottie/failed.json',
                                                      width: 100,
                                                      height: 100,
                                                    ),
                                                    Text(
                                                      'E-mail dan Password wajib diisi dan tidak boleh kosong',
                                                      textAlign:
                                                          TextAlign.center,
                                                    )
                                                  ],
                                                ));
                                          },
                                        );
                                      } else {
                                        context.read<LoginBloc>().add(
                                              LoginEvent.login(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                              ),
                                            );
                                      }
                                    },
                                    label: 'Login',
                                  );
                                },
                                loading: () {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );
                            },
                          ),
                          const SpaceHeight(50.0),
                          Center(
                            child: Assets.images.codeLogo.image(height: 80.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
