import 'package:d_input/d_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_market_app_frontend/config/app_assets.dart';
import 'package:laundry_market_app_frontend/config/app_colors.dart';
import 'package:laundry_market_app_frontend/config/app_constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final edtUsername = TextEditingController();
  final edtEmail = TextEditingController();
  final edtPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.bgAuth,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black54,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    Text(
                      AppConstants.appName,
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        color: Colors.green[900],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    )
                  ],
                ),
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: DInput(
                              controller: edtUsername,
                              fillColor: Colors.white70,
                              hint: 'Username',
                              radius: BorderRadius.circular(10),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
