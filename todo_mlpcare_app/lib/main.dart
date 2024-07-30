import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_mlpcare_app/firebase_options.dart';
import 'package:todo_mlpcare_app/routes/app_routes.dart';
import 'package:todo_mlpcare_app/services/concrete/add_service.dart';
import 'package:todo_mlpcare_app/services/concrete/delete_service.dart';
import 'package:todo_mlpcare_app/services/concrete/get_todo_service.dart';
import 'package:todo_mlpcare_app/services/concrete/load_select_icon_service.dart';
import 'package:todo_mlpcare_app/services/concrete/update_service.dart';
import 'package:todo_mlpcare_app/services/concrete/update_title_service.dart';
import 'package:todo_mlpcare_app/services/external/iadd_service.dart';
import 'package:todo_mlpcare_app/services/external/idelete_service.dart';
import 'package:todo_mlpcare_app/services/external/iget_todo_service.dart';
import 'package:todo_mlpcare_app/services/external/iload_select_icon_service.dart';
import 'package:todo_mlpcare_app/services/external/iupdate_service.dart';
import 'package:todo_mlpcare_app/services/external/iupdate_title_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
  setupLocator();
}

void setupLocator(){
  final DatabaseReference todoRef = FirebaseDatabase.instance.ref().child('todos');
  GetIt.I.registerSingleton<IAddService>(AddService(todoRef));
  GetIt.I.registerSingleton<IUpDateService>(UpDateService(todoRef));
  GetIt.I.registerSingleton<IUpDateTitleService>(UpdateTitleService(todoRef));
  GetIt.I.registerSingleton<IDeleteService>(DeleteService(todoRef));
  GetIt.I.registerSingleton<ILoadSelectIconService>(LoadSelectIconService(todoRef));
  GetIt.I.registerSingleton<IGetTodoService>(GetTodoService(todoRef));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    final appRouter = GetIt.instance<AppRouter>();

    return MaterialApp.router(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}
