import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'profile_page.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = AuthService();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hint: Text("Email"),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.email, color: Colors.purple),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.purple, width: 1),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hint: Text("Password"),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.lock, color: Colors.purple),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.purple, width: 1),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  
                  onPressed: () async {
                    final user = await auth.signIn(
                      emailController.text,
                      passwordController.text,
                    );
                    if (user != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProfilePage(userId: user.uid),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Login failed")));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 18),),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  TextButton(
                    child: Text("Sign Up",style: TextStyle(color: Colors.purple),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SignupPage()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupPage extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = AuthService();

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Sign Up", style: TextStyle(color: Colors.white),), backgroundColor: Colors.purple,),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hint: Text("Name"),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.account_circle, color: Colors.purple),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.purple, width: 1),
                  ),
                ),
              ),
            SizedBox(height: 10,),
            TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hint: Text("Email"),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.email, color: Colors.purple),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.purple, width: 1),
                  ),
                ),
              ),
            SizedBox(height: 10,),
            TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hint: Text("Password"),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.lock, color: Colors.purple),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.purple, width: 1),
                  ),
                ),
              ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () async {
                  final user = await auth.signUp(
                    emailController.text,
                    passwordController.text,
                    nameController.text,
                  );
                  if (user != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProfilePage(userId: user.uid),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Sign Up failed")));
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                child: Text("Sign Up", style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
