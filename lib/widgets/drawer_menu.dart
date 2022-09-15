import 'package:flutter/material.dart';

// Меню с группами
class DrawerMenu extends StatelessWidget {
  // Элементы
  final List<DrawerMenuGroup> childrens;

  // Конструктор
  const DrawerMenu({super.key, required this.childrens});

  // Создаёт разметку
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: childrens,
    );
  }
}

// Группа меню
class DrawerMenuGroup extends StatelessWidget {
  // Название группы
  final String title;

  // Элементы группы
  final List<DrawerMenuGroupItem> childrens;

  // Конструктор
  const DrawerMenuGroup(
      {super.key, required this.title, required this.childrens});

  // Создаёт разметку
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 22),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: childrens,
        )
      ],
    );
  }
}

// Элемент группы
class DrawerMenuGroupItem extends StatelessWidget {
  // Заголовок элемента
  final String title;

  // Иконка
  final IconData icon;

  // Признак что элемент выбран
  final bool selected;

  // Обрабатывает нажатие
  final GestureTapCallback? onTap;

  // Конструктор
  const DrawerMenuGroupItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      this.selected = false});

  // Создаёт разметку
  @override
  Widget build(BuildContext context) {
    return Container(
        color: selected ? Colors.blue : Colors.transparent,
        width: double.infinity,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: selected
                      ? Icon(
                          icon,
                          color: Colors.white,
                        )
                      : Icon(icon),
                ),
                selected
                    ? Text(title, style: const TextStyle(color: Colors.white))
                    : Text(title)
              ],
            ),
          ),
        ));
  }
}
