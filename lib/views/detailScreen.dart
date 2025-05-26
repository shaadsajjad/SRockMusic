import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detailscreen extends StatefulWidget {

  final String title;
  final String subtitle;
  final String logo;
  final String bg;

  const Detailscreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.logo,
    required this.bg,
  });


  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Detail page",style: TextStyle(color: Colors.white),),
      ),
      body: Center(child: Text("You tapped on: ${widget.title}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),)),
    );
  }
}
