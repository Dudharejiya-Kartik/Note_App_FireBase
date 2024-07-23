import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/auth_services.dart';
import '../../services/firestore_service.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      User? user = await AuthServices.instance.register(
                        email: email.text,
                        psw: password.text,
                      );

                      if (user != null) {
                        await FireStoreService.instance.addUser(user: user);
                        await FireStoreService.instance.getUser();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("REGISTERED !!"),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    child: const Text("REGISTER"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      User? user = await AuthServices.instance.signIn(
                        email: email.text,
                        psw: password.text,
                      );

                      if (user != null) {
                        await FireStoreService.instance.getUser();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("SIGN UP !!"),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        Navigator.of(context).pushReplacementNamed('home_page');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("FAILLED !!"),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    child: const Text("Sign In"),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  onPressed:
                  () async {
                    UserCredential? credential =
                        await AuthServices.instance.signInWithGoogle();

                    User? user = credential?.user;

                    if (user != null) {
                      await FireStoreService.instance.addUser(user: user);
                      await FireStoreService.instance.getUser();
                      Navigator.of(context).pushReplacementNamed('home_page');
                    }
                  };
                },
                child: Container(
                  height: 50,
                  child: Image.asset("assets/images/google-logo-2020.jpg"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
