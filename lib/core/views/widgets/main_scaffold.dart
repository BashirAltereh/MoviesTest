import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key,required this.body,this.bottomNavigationBar});

  final Widget body;
  final Widget? bottomNavigationBar;


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: body), bottomNavigationBar: bottomNavigationBar);
  }
}

