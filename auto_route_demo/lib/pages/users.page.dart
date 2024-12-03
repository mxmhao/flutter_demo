import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("UsersPage", style: TextStyle(fontSize: 20),),
    );
  }
}