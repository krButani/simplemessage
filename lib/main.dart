import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplemessage/bloc/userblock/user_bloc.dart';
import 'package:simplemessage/bloc/userfrom/userfrom_bloc.dart';
import 'package:simplemessage/config/krButani/all.dart';
import 'package:simplemessage/firebase_options.dart';
import 'package:simplemessage/services/firestore_service.dart';
import 'package:simplemessage/views/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(FirestoreService()),
        ),
        BlocProvider<UserfromBloc>(
          create: (context) => UserfromBloc(),
        ),
      ],
      child: MaterialApp(
        title: lang.en("appname"),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: lightColorScheme,
          useMaterial3: true,
        ),
        //home: const Home(),
        home: const Home(),
      ),
    );
  }
}
