import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/view/Note_screen_fire.dart';
import 'package:noteapp/viewmodel/noteViewmodelfire.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'view/Note_Screen.dart';
import 'viewmodel/NoteViewModel.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
    create: (context) => NoteViewmodel(),),
    ChangeNotifierProvider(
    create: (context) => NotesViewmodelFire(),),

    ], 
    child: MyApp(),
    )
    
  
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteViewFire(),
    );
  }
}
