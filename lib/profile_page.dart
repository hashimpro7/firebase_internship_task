import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  final String userId;
  final auth = AuthService();

  ProfilePage({super.key, required this.userId});

  Future<Map<String, dynamic>?> getUserData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection("users").doc(userId).get();
      return doc.data() as Map<String, dynamic>?;
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());

        if (!snapshot.hasData || snapshot.data == null) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(title: Text("Profile"), backgroundColor: Colors.purple,),
            body: Center(child: Text("No user data found")),
          );
        }

        final userData = snapshot.data!;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text("Welcome",style: TextStyle(color: Colors.white),),
            actions: [
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () async {
                  await auth.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
                },
              )
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Name: ${userData['name']}", style: TextStyle(fontSize: 20)),
                Text("Email: ${userData['email']}", style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        );
      },
    );
  }
}
