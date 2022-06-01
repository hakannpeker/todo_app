import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/switch_bloc/switch_bloc_bloc.dart';
import 'bloc/tasks_bloc/tasks_bloc.dart';
import 'feature/view/tasks_screen.dart';
import 'product/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBlocBloc(),
        )
      ],
      child: BlocBuilder<SwitchBlocBloc, SwitchBlocState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Material App',
            theme: state.switchValue ? AppThemes.appThemeData[AppTheme.darkTheme] : AppThemes.appThemeData[AppTheme.lightTheme],
            home: const TasksScreen(),
          );
        },
      ),
    );
  }
}
