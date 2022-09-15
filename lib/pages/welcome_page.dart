import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:im_stepper/stepper.dart';

// Страница приветствия
class WelcomePage extends StatefulWidget {
  // Конструктор
  const WelcomePage({super.key});

  // Создаёт состояние
  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

// Состояние для страницы
class _WelcomePageState extends State<WelcomePage> {
  // Максимальное количество страниц
  static const int maxStepCount = 5;

  // Текущий шаг представления
  int _activeStep = 0;

  // Возвращает
  Widget getContentWidget() {
    switch (_activeStep) {
      case 0:
        return Container(
          padding: const EdgeInsets.only(top: 36, bottom: 36),
          width: 220,
          child: const Text(
            "Добро пожаловать в приложение Idea Craft",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        );
      case 1:
        return Container(
          padding: const EdgeInsets.only(top: 36, bottom: 36),
          width: 220,
          child: const Text(
            "Ищите идеи",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        );
      case 2:
        return Container(
          padding: const EdgeInsets.only(top: 36, bottom: 36),
          width: 220,
          child: const Text(
            "Добавляйте новые идеи",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        );
      case 3:
        return Container(
          padding: const EdgeInsets.only(top: 36, bottom: 36),
          width: 220,
          child: const Text(
            "Комментируйте чужие идеи",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        );
      case 4:
        return Container(
          padding: const EdgeInsets.only(top: 36, bottom: 36),
          width: 220,
          child: const Text(
            "Ставьте оценку чужой идее",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        );
    }

    return const Center();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getContentWidget(),
            const Expanded(
              flex: 1,
              child: Center(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: DotStepper(
                dotCount: maxStepCount,
                activeStep: _activeStep,
                spacing: 10,
                dotRadius: 6,
                indicator: Indicator.jump,
                tappingEnabled: false,
                indicatorDecoration:
                    const IndicatorDecoration(color: Colors.green),
                fixedDotDecoration:
                    const FixedDotDecoration(color: Colors.white),
              ),
            ),
            Container(
              width: 200,
              height: 80,
              padding: const EdgeInsets.only(bottom: 36),
              child: ElevatedButton(
                  onPressed: () {
                    if (_activeStep >= maxStepCount - 1) {
                      GetStorage().write("was_welcome", true);
                      Navigator.of(context).popAndPushNamed("/");
                    } else {
                      setState(() {
                        _activeStep += 1;
                      });
                    }
                  },
                  child: const Text("Далее")),
            )
          ],
        ),
      ),
    );
  }
}
