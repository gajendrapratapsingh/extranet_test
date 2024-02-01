import 'dart:convert';
import 'dart:io';

import 'package:extranet_testapp/services/home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ConfirmationDialog extends StatefulWidget {

  final int? id;

  ConfirmationDialog(this.id);

  @override
  State<ConfirmationDialog> createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: AlertDialog(
        title: const Text('Confirmation!!'),
        content: const Text('Do you want to delete the Employee?', style: TextStyle(fontSize: 18)),
        actions: [
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green), fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width/3.0, 40))),
            onPressed: () async{
              Navigator.of(context, rootNavigator: true).pop();
              await HomeService().deleteUser(widget.id, context);
            },
            child: const Text('Yes', style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red), fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width/3.0, 40))),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
