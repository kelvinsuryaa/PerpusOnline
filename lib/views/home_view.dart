import 'package:flutter/material.dart';
import '../widget/bottom_nav.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: (){
        Navigator.pushNamed(context, '/login');
        // Navigator.pop(context);
      },
      child: Text("Login"),
      ),
      bottomNavigationBar: BottomNav(0),
    );
  }
}