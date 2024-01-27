import 'package:flutter/material.dart';

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 300,
          color: Colors.pink,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: screenSize.width,
                    height: screenSize.height / 10,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    width: screenSize.width / 2,
                    height: 100,
                    color: Colors.green,
                  ),
                  Positioned(
                    top: screenSize.height / 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.asset('assets/images/picture.png'),
                      ),
                    ),
                  ),
                  
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
