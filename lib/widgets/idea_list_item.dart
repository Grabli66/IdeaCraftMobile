import 'package:flutter/material.dart';
import 'package:mobile_app_ideas/services/base_idea_service.dart';

// Обратный вызов нажатия элемента списка
typedef IdeaListItemTapCallback(Idea idea);

// Элемент списка с идеями
class IdeaListItem extends StatelessWidget {
  // Заголовок идеи
  final Idea idea;

  // Обрабатывает нажатие
  final IdeaListItemTapCallback onTap;

  // Конструктор
  const IdeaListItem({super.key, required this.idea, required this.onTap});

  // Конструктор
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(idea);
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.amber,
              width: 100,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    idea.title,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(idea.description),
                  ),
                  Text(idea.dateTime.toString()),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        const Icon(Icons.remove_red_eye),
                        Text(idea.views.toString()),
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Icon(Icons.thumb_up),
                        ),
                        Text(idea.likes.toString()),
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Icon(Icons.thumb_down),
                        ),
                        Text(idea.dislikes.toString())
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
