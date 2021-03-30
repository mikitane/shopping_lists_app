
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_lists_app/providers.dart';

class SyncWidget extends StatefulWidget {
  SyncWidget({ required this.child });

  final Widget child;

  @override
  _SyncWidgetState createState() => _SyncWidgetState();
}

class _SyncWidgetState extends State<SyncWidget> {
  @override
  void initState() {
    super.initState();

    context.read(syncControllerProvider).syncData();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}