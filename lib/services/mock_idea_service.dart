import 'package:mobile_app_ideas/services/base_idea_service.dart';

// Сервис заглушка
class MockIdeaService implements BaseIdeaService {
  // Идеи
  final _ideas = <int, Idea>{
    1: Idea(
        1,
        "Мобильная игра про зомби",
        "Игрок бегает за зомби, а потом играет с ними в карты",
        DateTime.now(),
        0,
        "Grabli66",
        views: 27,
        likes: 10,
        dislikes: 3),
    2: Idea(2, "Сервис заказа такси", "Мобильное приложение для вызова такси",
        DateTime.now().add(const Duration(days: -1)), 1, "Бэтмен",
        views: 10, likes: 3, dislikes: 6),
    3: Idea(
        3,
        "Графический редактор",
        "Редактор на подобие photoshop, который может всё",
        DateTime.now().add(const Duration(days: -2)),
        2,
        "Кинг-Конг",
        views: 28,
        likes: 16,
        dislikes: 8,
        isFavorite: true)
  };

  // Возвращает идею по идентификатору
  @override
  Future<Idea?> getIdeaById(int id) async {
    return _ideas[id];
  }

  // Создаёт новую идею
  @override
  Future<Idea> createIdea(String title, String description) async {
    final id = _ideas.length + 1;
    final idea = Idea(id, title, description, DateTime.now(), 0, "Grabli66");
    _ideas[id] = idea;

    return idea;
  }

  // Редактирует идею
  @override
  Future<Idea> editIdea(int id,
      {String? title,
      String? description,
      int? views,
      int? likes,
      int? dislikes,
      bool? isFavorite}) async {
    final idea = (await getIdeaById(id))!;
    if (title != null) {
      idea.title = title;
    }

    if (description != null) {
      idea.description = description;
    }

    if (views != null) {
      idea.views = views;
    }

    if (likes != null) {
      idea.likes = likes;
    }

    if (dislikes != null) {
      idea.dislikes = dislikes;
    }

    if (isFavorite != null) {
      idea.isFavorite = isFavorite;
    }

    return idea;
  }

  // Возвращает идеи
  @override
  Future<List<Idea>> getIdeas(DateTime fromDate, int count,
      {isFavorite = false, isMy = false}) async {
    if (isMy) {
      return _ideas.values
          .where((x) => (x.dateTime.isBefore(fromDate)) && (x.userId == 0))
          .take(count)
          .toList()
        ..sort((a, b) => b.dateTime.compareTo(a.dateTime));
    }

    if (isFavorite) {
      return _ideas.values
          .where((x) => (x.dateTime.isBefore(fromDate)) && x.isFavorite)
          .take(count)
          .toList()
        ..sort((a, b) => b.dateTime.compareTo(a.dateTime));
    }

    return _ideas.values
        .where((x) => x.dateTime.isBefore(fromDate))
        .take(count)
        .toList()
      ..sort((a, b) => b.dateTime.compareTo(a.dateTime));
  }
}
