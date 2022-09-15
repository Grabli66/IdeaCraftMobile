import 'package:flutter/material.dart';

// Страница настроек
class SettingsEditPage extends StatefulWidget {
  // Конструктор
  const SettingsEditPage({super.key});

  // Создаёт состояние
  @override
  State<StatefulWidget> createState() => _SettingsEditPageState();
}

// Состояние для страницы
class _SettingsEditPageState extends State<SettingsEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Настройки"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Имя пользователя"),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            Container(
              width: double.infinity,
              height: 80,
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                  onPressed: () {}, child: const Text("Сохранить")),
            )
          ],
        ),
      ),
    );
  }
}
