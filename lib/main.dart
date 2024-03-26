import 'package:ejercicio1listas/presentation/Screens/list_screen.dart';
import 'package:ejercicio1listas/presentation/providers/list_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create:(_) => ListProviders() )],
        child: MaterialApp(
        title: 'Lista Post',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const ListScreen (),
      ),
    );
  }
}

