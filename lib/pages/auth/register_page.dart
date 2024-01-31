import 'package:d_button/d_button.dart';
import 'package:d_info/d_info.dart';
import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_market_app_frontend/config/app_assets.dart';
import 'package:laundry_market_app_frontend/config/app_colors.dart';
import 'package:laundry_market_app_frontend/config/app_constants.dart';
import 'package:laundry_market_app_frontend/config/app_response.dart';
import 'package:laundry_market_app_frontend/config/failure.dart';
import 'package:laundry_market_app_frontend/datasource/user_datasource.dart';

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

  execute() {
    bool validInput = formKey.currentState!.validate();
    if (!validInput) return;
    UserDatasource.register(edtUsername.text, edtEmail.text, edtPassword.text)
        .then((value) {
      String newStatus = '';
      value.fold(
        (failure) {
          switch (failure.runtimeType) {
            case ServerFailure:
              newStatus = 'Server Error!';
              DInfo.toastError(newStatus);
              break;
            case NotFoundFailure:
              newStatus = 'Error Not Found';
              DInfo.toastError(newStatus);
              break;
            case ForbiddenFailure:
              newStatus = 'You don\'t have access';
              DInfo.toastError(newStatus);
              break;
            case BadRequestFailure:
              newStatus = 'Bad request';
              DInfo.toastError(newStatus);
              break;
            case InvalidInputFailure:
              newStatus = 'Invalid Input';
              AppResponse.invalidInput(context, failure.message ?? '{}');
              break;
            case UnauthorisedFailure:
              newStatus = 'Unauthorised';
              DInfo.toastError(newStatus);
              break;
            default:
              newStatus = 'Request Error';
              DInfo.toastError(newStatus);
              newStatus = failure.message ?? '-';
              break;
          }
        },
        (result) {
          DInfo.toastSuccess('Register Success');
        },
      );
    });
  }

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
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Material(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                              DView.spaceWidth(10),
                              Expanded(
                                child: DInput(
                                  controller: edtUsername,
                                  fillColor: Colors.white70,
                                  hint: 'Username',
                                  radius: BorderRadius.circular(10),
                                ),
                              )
                            ],
                          ),
                        ),
                        DView.spaceHeight(15),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Material(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Icon(
                                      Icons.email,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                              DView.spaceWidth(10),
                              Expanded(
                                child: DInput(
                                  controller: edtEmail,
                                  fillColor: Colors.white70,
                                  hint: 'Email',
                                  radius: BorderRadius.circular(10),
                                ),
                              )
                            ],
                          ),
                        ),
                        DView.spaceHeight(16),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Material(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Icon(
                                      Icons.key,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                              DView.spaceWidth(10),
                              Expanded(
                                child: DInputPassword(
                                  controller: edtPassword,
                                  fillColor: Colors.white70,
                                  hint: 'Password',
                                  radius: BorderRadius.circular(10),
                                ),
                              )
                            ],
                          ),
                        ),
                        DView.spaceHeight(),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: DButtonFlat(
                                  onClick: () {
                                    Navigator.pop(context);
                                  },
                                  padding: const EdgeInsets.all(0),
                                  radius: 10,
                                  mainColor: Colors.white70,
                                  child: const Text(
                                    'LOG',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              DView.spaceWidth(10),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () => execute(),
                                  style: const ButtonStyle(
                                    alignment: Alignment.centerLeft,
                                  ),
                                  child: const Text('Register'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
