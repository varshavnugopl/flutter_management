import 'package:flutter/material.dart';
import 'package:fluuter_mt/service/sharedprefs_services.dart';
import 'package:fluuter_mt/ui/auth/auth_viewModel.dart';
import 'package:fluuter_mt/ui/home/home_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthView extends ConsumerStatefulWidget {
  const AuthView({super.key});

  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends ConsumerState<AuthView> {
  bool isLoading = false;
  late AuthViewModel viewModel;
  //Input controller
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String errorMessage = "";

  bool check = false;
  @override
  Widget build(BuildContext context) {
    viewModel = ref.read(authViewModelProvider);
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 14,
                ),
                Image.asset(
                  'assets/login.png',
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14)),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(185, 94, 0, 170)),
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Welcome Back!',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 101, 99, 99)),
                                ),
                                Text('Register',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color.fromARGB(185, 94, 0, 170)))
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 2.59,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Visibility(
                                  visible: errorMessage.isNotEmpty,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      errorMessage,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              TextField(
                                decoration: InputDecoration(
                                    label: Text("Email"),
                                    border: OutlineInputBorder(gapPadding: 0)),
                                controller: _emailController,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    setState(() {
                                      errorMessage = "";
                                    });
                                  }
                                },
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    label: Text("Password"),
                                    border: OutlineInputBorder(gapPadding: 0)),
                                controller: _passwordController,
                                obscureText: true,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    setState(() {
                                      errorMessage = "";
                                    });
                                  }
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    radius: 23,
                                    backgroundColor: Colors.grey,
                                    child: CircleAvatar(
                                      radius: 22,
                                      backgroundImage: Image.asset(
                                        'assets/tw.png',
                                        fit: BoxFit.cover,
                                      ).image,
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.grey,
                                    child: CircleAvatar(
                                      radius: 22,
                                      backgroundImage:
                                          AssetImage('assets/fb.png'),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.grey,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 22,
                                      backgroundImage:
                                          AssetImage('assets/inst.png'),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.grey,
                                    child: CircleAvatar(
                                      radius: 22,
                                      backgroundImage:
                                          AssetImage('assets/go.png'),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Checkbox(
                                          activeColor: const Color.fromARGB(
                                              185, 94, 0, 170),
                                          value: check,
                                          onChanged: (value) {
                                            setState(() {
                                              check = check ? false : true;
                                            });
                                          }),
                                      const Text('Remember me',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color.fromARGB(
                                                  255, 114, 112, 112)))
                                    ]),
                                    const Text(
                                      'Forgot password?',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 114, 112, 112)),
                                    )
                                  ]),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.1,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            185, 94, 0, 170)),
                                    onPressed: isLoading
                                        ? () {}
                                        : () async {
                                            if (_emailController
                                                    .text.isNotEmpty &&
                                                _passwordController
                                                    .text.isNotEmpty) {
                                              setState(() => isLoading = true);
                                              String msg = await ref
                                                  .read(authViewModelProvider)
                                                  .getLogin(
                                                      _emailController.text,
                                                      _passwordController.text);
                                              setState(() {
                                                errorMessage = msg;
                                                isLoading = false;
                                              });
                                              if (msg == "1") {
                                                SharedPrefsService().write(SharedPrefsService.IS_AUTH, true);
                                                SharedPrefsService().write(SharedPrefsService.USER_DETAILS, viewModel.userDetails);
                                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeView(),), (route) => false);
                                              }
                                            } else {
                                              setState(() {
                                                errorMessage =
                                                    "Please enter login credintials";
                                                isLoading = false;
                                              });
                                            }
                                          },
                                    child: isLoading
                                        ? CircularProgressIndicator()
                                        : const Text('Login')),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
              ]),
        ));
  }
}
