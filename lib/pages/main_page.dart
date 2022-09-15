import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_app_ideas/routes.dart';
import 'package:mobile_app_ideas/services/base_idea_service.dart';
import 'package:mobile_app_ideas/widgets/drawer_menu.dart';
import 'package:mobile_app_ideas/widgets/idea_list_item.dart';

// Параметры маршрута для MainPane
class MainPageRouteParameters {
  static const newMenuIndex = 0;
  static const favoritesMenuIndex = 1;
  static const myMenuIndex = 2;
  static const settingsMenuIndex = 3;

  // Индекс меню
  final int? menuIndex;

  // Конструктор
  MainPageRouteParameters(this.menuIndex);

  // Возвращает имя для индекса маршрута
  static String getName(int idx) {
    switch (idx) {
      case newMenuIndex:
        return "Новые";
      case favoritesMenuIndex:
        return "Избранные";
      case myMenuIndex:
        return "Мои";
      case settingsMenuIndex:
        return "Настройки";
    }

    return "";
  }
}

// Основная страница
class MainPage extends StatefulWidget {
  // Конструктор
  const MainPage({super.key});

  // Создаёт состояние
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

// Состояние для главной страницы
class _MainPageState extends State<MainPage> {
  // Список идей
  //List<Idea> _ideas = [];

  // Инициализирует состояние
  @override
  void initState() {
    GetStorage().write("userId", 0);
    super.initState();
  }

  // Получает идеи
  Future<List<Idea>> fetchIdeas(int menuIdx) async {
    switch (menuIdx) {
      case MainPageRouteParameters.favoritesMenuIndex:
        return BaseIdeaService().getIdeas(DateTime.now(), 10, isFavorite: true);
      case MainPageRouteParameters.myMenuIndex:
        return BaseIdeaService().getIdeas(DateTime.now(), 10, isMy: true);
    }

    return BaseIdeaService().getIdeas(DateTime.now(), 10);
  }

  // Обрабатывает нажатие на элемент списка
  void onItemTap(Idea idea) {
    Navigator.pushNamed(context, Routes.ideaView, arguments: idea);
  }

  // Создаёт разметку
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as MainPageRouteParameters?;

    final menuIdx = args?.menuIndex ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(MainPageRouteParameters.getName(menuIdx)),
      ),
      drawer: Drawer(
        child: DrawerMenu(
          childrens: [
            DrawerMenuGroup(title: "Идеи", childrens: [
              DrawerMenuGroupItem(
                  selected: menuIdx == MainPageRouteParameters.newMenuIndex,
                  title: "Новые",
                  icon: Icons.newspaper,
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(Routes.root,
                        arguments: MainPageRouteParameters(
                            MainPageRouteParameters.newMenuIndex));
                  }),
              DrawerMenuGroupItem(
                  selected:
                      menuIdx == MainPageRouteParameters.favoritesMenuIndex,
                  title: "Избранные",
                  icon: Icons.newspaper,
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(Routes.root,
                        arguments: MainPageRouteParameters(
                            MainPageRouteParameters.favoritesMenuIndex));
                  }),
              DrawerMenuGroupItem(
                  selected: menuIdx == MainPageRouteParameters.myMenuIndex,
                  title: "Мои",
                  icon: Icons.person,
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(Routes.root,
                        arguments: MainPageRouteParameters(
                            MainPageRouteParameters.myMenuIndex));
                  })
            ]),
            DrawerMenuGroup(title: "Настройки", childrens: [
              DrawerMenuGroupItem(
                  selected:
                      menuIdx == MainPageRouteParameters.settingsMenuIndex,
                  title: "Настройки",
                  icon: Icons.settings,
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.settings);
                  }),
            ])
          ],
        ),
      ),
      body: FutureBuilder(
        future: fetchIdeas(menuIdx),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            final ideas = snapshot.data as List<Idea>;

            return ListView.builder(
                itemCount: ideas.length,
                itemBuilder: (context, index) {
                  if (index < ideas.length) {
                    final idea = ideas[index];
                    return IdeaListItem(idea: idea, onTap: onItemTap);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                });
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.ideaCreate);
          }),
    );
  }
}
