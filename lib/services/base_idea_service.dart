import 'package:mobile_app_ideas/services/mock_idea_service.dart';
import 'package:mobile_app_ideas/services/real_idea_service.dart';

// Данные идеи
class Idea {
  // Идентификатор идеи
  final int id;
  // Заголовок идеи
  String title;
  // Описание идеи
  String description;
  // Дата создания/редактирования
  DateTime dateTime;
  // Количество просмотров
  int views;
  // Количество лайков
  int likes;
  // Количество дизлайков
  int dislikes;
  // Является избранным
  bool isFavorite;
  // Идентификатор пользователя
  int userId;
  // Имя пользователя
  String userName;

  // Конструктор
  Idea(this.id, this.title, this.description, this.dateTime, this.userId,
      this.userName,
      {this.views = 0,
      this.likes = 0,
      this.dislikes = 0,
      this.isFavorite = false});
}

// Интерфейс сервиса для работы с идеями
abstract class BaseIdeaService {
  // Экземпляр
  static final _instance = RealIdeaService();

  // Конструктор
  factory BaseIdeaService() {
    return _instance;
  }

  // Возвращает идею по идентификатору
  Future<Idea?> getIdeaById(int id);

  // Создаёт идею
  Future<Idea> createIdea(String title, String description);

  // Редактирует идею
  Future<Idea> editIdea(int id,
      {
      // Заголовок идеи
      String? title,
      // Описание идеи
      String? description,
      // Количество просмотров
      int? views,
      // Количество лайков
      int? likes,
      // Количество дизлайков
      int? dislikes,
      // Является избранным
      bool? isFavorite});

  /// Вовзаращает идеи с [startId] в количестве [count]
  Future<List<Idea>> getIdeas(DateTime fromDate, int count,
      {isFavorite = false, isMy = false});
}
