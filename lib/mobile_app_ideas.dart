import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_app_ideas/pages/idea_edit_page.dart';
import 'package:mobile_app_ideas/pages/idea_view_page.dart';
import 'package:mobile_app_ideas/pages/main_page.dart';
import 'package:mobile_app_ideas/pages/settings_page.dart';
import 'package:mobile_app_ideas/pages/welcome_page.dart';
import 'package:mobile_app_ideas/routes.dart';

// Основной виджет приложения
class MobileAppIdeas extends StatelessWidget {
  // Конструктор
  const MobileAppIdeas({super.key});

  // Создаёт разметку
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      initialRoute: "/",
      routes: {
        Routes.root: (context) {
          final wasWelcom = GetStorage().read("was_welcome") as bool?;
          if (wasWelcom == true) {
            return const MainPage();
          }

          return const WelcomePage();
        },
        Routes.ideaView: (context) => const IdeaViewPage(),
        Routes.ideaEdit: (context) => const IdeaEditPage(create: false),
        Routes.ideaCreate: (context) => const IdeaEditPage(create: true),
        Routes.settings: (context) => const SettingsEditPage(),
      },
    );
  }
}
