import 'package:flutter/material.dart';
import './providers/theme.dart';
import '../providers/task_data.dart';
import 'package:provider/provider.dart';
import 'screens/task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskData(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          builder: (context, ch) {
            final themeProvider = Provider.of<ThemeProvider>(context);

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Futute Task',
              themeMode: themeProvider.themeMode,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              home: TaskScreen(),
            );
          },
        ),
      ],
    );
  }
}
