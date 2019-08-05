import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/di/bloc_injector.dart';
import 'package:flutter_architecture/src/di/bloc_module.dart';

void main() async{
  var container = await BlocInjector.create(BlocModule());
  return runApp(container.app);
} 
