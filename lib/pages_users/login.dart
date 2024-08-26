import 'package:e_comm/Firestore-Firebase/auth_method.dart';
import 'package:e_comm/pages_users/BottomNav.dart';
import 'package:e_comm/pages_users/signup.dart';
import 'package:e_comm/support_widget/support.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  final routename = '/log-in';
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    final emailcontroller = TextEditingController();
    final passcontroller = TextEditingController();
    dispose() {
      emailcontroller.dispose();
      passcontroller.dispose();
    }

    Future<void> SignIn() async {
      if (emailcontroller.text.isNotEmpty && passcontroller.text.isNotEmpty) {
        String email = emailcontroller.text.trim();
        String pass = passcontroller.text.trim();
        final rs = await Authmethod().sign_in(email, pass);
        if (rs == 'success') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Signed In successfully",
              ),
            ),
          );
          setState(() {
            Navigator.of(context).pushNamed(Bottomnav().routename);
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                rs,
              ),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Email/Password Field Can't be empty")));
        setState(() {});
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 242, 233),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // margin: EdgeInsets.only(top: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          50,
                        ),
                        bottomRight: Radius.circular(
                          50,
                        ),
                      ),
                      child: Image.asset(
                        "images/log-in.jpeg",
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        margin: EdgeInsets.only(top: 232),
                        height: 380,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Text(
                              "Sign-In",
                              style: AppWidget.SemiboldBoldTextsyle(),
                            ),
                            Text(
                              " Please Enter Details ",
                              style: AppWidget.lisghtTextsyle(),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: emailcontroller,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(
                                    12,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.mail,
                                  ),
                                  hintText: "Enter Email",
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                  ),
                                  enabled: true,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: passcontroller,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(
                                    12,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.key_sharp,
                                  ),
                                  hintText: "Enter Password",
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                  ),
                                  enabled: true,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Forgot Password ?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            GestureDetector(
                              onTap: () {
                                SignIn();
                              },
                              child: Container(
                                height: 50,
                                width: 255,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Sign-In",
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have a account ? ",
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.of(context)
                                          .pushNamed(SignUp().routename);
                                    });
                                  },
                                  child: Text(
                                    "Sign-Up",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    '''
             or\n Continue with''',
                    style: AppWidget.normalTextsyle(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.mail,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.facebook,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
