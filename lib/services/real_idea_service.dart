// Реальный сервис
import 'package:dio/dio.dart';
import 'package:mobile_app_ideas/services/base_idea_service.dart';

class RealIdeaService implements BaseIdeaService {
  // Адрес сервиса
  static const String address = "http://ideacraft.rf.gd";

  // Создаёт новую идею
  @override
  Future<Idea> createIdea(String title, String description) {
    // TODO: implement createIdea
    throw UnimplementedError();
  }

// Редактирует идею
  @override
  Future<Idea> editIdea(int id,
      {String? title,
      String? description,
      int? views,
      int? likes,
      int? dislikes,
      bool? isFavorite}) {
    // TODO: implement editIdea
    throw UnimplementedError();
  }

  // Возвращает идею по идентификатору
  @override
  Future<Idea?> getIdeaById(int id) async {
    return Idea(0, "title", "description", DateTime.now(), 0, "");
  }

  // Возвращает идеи
  @override
  Future<List<Idea>> getIdeas(DateTime fromDate, int count,
      {isFavorite = false, isMy = false}) async {
    var response = await Dio().get('$address/idea');
    print(response);
    return [];
  }
}
