import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_constants.dart';
import '../../constants/components/bottom_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  navigateToHomeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomNavBar(),
      ),
    );

    setState(() {
      isLoading = false;
    });
  }

  void _handleGoogleSignIn() async {
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      await _auth.signInWithProvider(googleAuthProvider);
      // if (!context.mounted) {
      navigateToHomeScreen();
      // }
      // ;
    } catch (error) {
      // print(error);

      SnackBar snackBar = const SnackBar(
        content: Text('Oops! something went wrong, Try again'),
      );
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: screenSize.width,
                height: screenSize.height / 5,
                child:
                    Image.asset('assets/images/Bitmap.png', fit: BoxFit.cover),
              ),
              Expanded(
                child: SizedBox(
                  width: screenSize.width,
                  child: Stack(
                    children: [
                      Container(
                        width: screenSize.width,
                        height: screenSize.height / 10,
                        color: AppConstant.backgroundColor,
                        child: SvgPicture.asset(
                            'assets/images/logo_with_name.svg'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenSize.height / 8),
                        child: Container(
                          width: screenSize.width,
                          height: double.infinity,
                          padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              color: AppConstant.secondaryColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20),
                              const Text(
                                'Hey there, welcome back',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Sign in to continue with your email, facebook or google account',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppConstant.lightSecondaryColor),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppConstant.primaryColor,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    _handleGoogleSignIn();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    child: Image.asset(
                                      'assets/images/google-symbol.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Need to create an account? ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppConstant.lightSecondaryColor),
                                  ),
                                  const Text(
                                    'Sign Up.',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: isLoading,
            child: Container(
              width: screenSize.width,
              height: screenSize.height,
              color: Colors.white.withOpacity(0.6),
              child: AppConstant().loadingIndicator(isLoading),
            ),
          ),
        ],
      ),
    );
  }
}
