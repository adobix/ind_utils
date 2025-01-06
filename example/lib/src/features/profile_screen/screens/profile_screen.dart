  
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProfileController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileScreen'),
      ),
      body: Center(
        child: Text('Hello, ProfileScreen!'),
      ),
    );
  }
}
