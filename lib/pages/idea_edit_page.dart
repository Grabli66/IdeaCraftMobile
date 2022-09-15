import 'package:flutter/material.dart';
import 'package:mobile_app_ideas/routes.dart';
import 'package:mobile_app_ideas/services/base_idea_service.dart';

// Страница редактирования идеи
class IdeaEditPage extends StatefulWidget {
  final bool create;

  // Конструктор
  const IdeaEditPage({super.key, required this.create});

  // Создаёт состояние
  @override
  State<StatefulWidget> createState() => _IdeaEditPageState();
}

// Состояние для страницы
class _IdeaEditPageState extends State<IdeaEditPage> {
  var _isLoading = false;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  // Отправляет изменения
  void sendChanges() async {
    setState(() {
      _isLoading = true;
    });

    BaseIdeaService()
        .createIdea(_titleController.text, _descriptionController.text)
        .then((value) {
      Navigator.of(context).popAndPushNamed(Routes.root);
    });
  }

  // Возвращает widget для отображения прогресса загрузки
  Widget getLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  // Возвращает widget для работы
  Widget getWorkingWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Заголовок"),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: TextField(
              controller: _titleController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 32),
            child: Text("Описание"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: TextField(
                controller: _descriptionController,
                maxLines: 6,
                decoration:
                    const InputDecoration(border: OutlineInputBorder())),
          ),
          Container(
            width: double.infinity,
            height: 80,
            padding: const EdgeInsets.only(top: 32),
            child: ElevatedButton(
                onPressed: () {
                  sendChanges();
                },
                child: const Text("Отправить")),
          )
        ],
      ),
    );
  }

  // Возвращает разметку
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Новая идея"),
        ),
        body: _isLoading ? getLoadingWidget() : getWorkingWidget());
  }
}
