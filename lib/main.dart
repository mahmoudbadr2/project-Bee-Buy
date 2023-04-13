
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/cubit/AppCubit.dart';
import 'package:untitled3/cubit/AppState.dart';
import 'package:untitled3/firebase_options.dart';
import 'package:untitled3/models/splash_screen/splash.dart';
import 'package:untitled3/shared/components/bloc-observer.dart';


Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  MyApp app = MyApp();
  runApp(app);

}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context) => AppCubit(AppInitialState()),

        child: MaterialApp(
          title: 'My App',
          home: Splash(),
        )


    );

  }

}




