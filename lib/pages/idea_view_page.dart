import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_app_ideas/services/base_idea_service.dart';

// Страница просмотра идеи
class IdeaViewPage extends StatefulWidget {
  // Конструктор
  const IdeaViewPage({super.key});

  // Создаёт состояние
  @override
  State<StatefulWidget> createState() => _IdeaViewPageState();
}

// Состояние для страницы
class _IdeaViewPageState extends State<IdeaViewPage> {
  bool canEdit(Idea idea) {
    return idea.userId == GetStorage().read("userId");
  }

  @override
  Widget build(BuildContext context) {
    final idea = ModalRoute.of(context)?.settings.arguments as Idea;

    return Scaffold(
      appBar: AppBar(
        title: Text(idea.title),
        actions: [
          if (canEdit(idea))
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(idea.description),
            Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    Text(idea.likes.toString()),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.thumb_up)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.thumb_down)),
                    Text(idea.dislikes.toString()),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
