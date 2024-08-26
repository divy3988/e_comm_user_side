import 'package:e_comm/Firestore-Firebase/auth_method.dart';
import 'package:e_comm/pages_users/BottomNav.dart';
import 'package:e_comm/pages_users/login.dart';
import 'package:e_comm/support_widget/support.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final String routename = '/Sign-Up';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> signup() async {
    if (_formKey.currentState!.validate()) {
      String name = namecontroller.text.toString();
      String email = emailcontroller.text.toString();
      String pass = passcontroller.text.toString();

      final rs = await Authmethod().Sign_up(name, email, pass);
      if (rs == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Signed Up successfully",
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
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passcontroller.dispose();
    passcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 242, 233),
      body: Container(
        margin: EdgeInsets.only(top: 15),
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
                      height: 360,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      margin: EdgeInsets.only(top: 232),
                      height: 420,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Text(
                              "Sign-Up",
                              style: AppWidget.SemiboldBoldTextsyle(),
                            ),
                            Text(
                              " Please Enter Details ",
                              style: AppWidget.lisghtTextsyle(),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Name';
                                  }
                                  return null;
                                },
                                controller: namecontroller,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(12),
                                  prefixIcon: Icon(
                                      Icons.supervised_user_circle_outlined),
                                  hintText: "Enter Name",
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
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Email';
                                  }
                                  return null;
                                },
                                controller: emailcontroller,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(12),
                                  prefixIcon: Icon(Icons.mail),
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
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Password';
                                  }
                                  return null;
                                },
                                controller: passcontroller,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(12),
                                  prefixIcon: Icon(Icons.key_sharp),
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
                            SizedBox(
                              height: 26,
                            ),
                            GestureDetector(
                              onTap: () {
                                signup();
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
                                    "Sign-Up",
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
                                Text(
                                  "Already have a account ? ",
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.of(context)
                                          .pushNamed(LogIn().routename);
                                    });
                                  },
                                  child: Text(
                                    "Sign-In",
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
    );
  }
}
