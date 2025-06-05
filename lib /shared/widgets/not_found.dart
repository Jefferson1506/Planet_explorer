import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/responsive/responsive_builder.dart';
import 'button.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    final colorSheme = Theme.of(context).colorScheme;
    return ResponsiveBuilder(
      builder: (context, view) {
        return Scaffold(
          backgroundColor: colorSheme.surface,
          appBar: AppBar(
            title: Text(
              'Planeta No Encontrado',

              style: TextStyle(
                color: Colors.white,
                fontSize: view.scaledFont(1.3),
              ),
            ),
            backgroundColor: colorSheme.primary,
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: view.isFontSize),
              child: Column(
                spacing: 20,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.public_off,
                    size: view.scaledFont(7),
                    color: colorSheme.inverseSurface,
                  ),
                  Text(
                    '¡Oops! No hemos encontrado ese planeta.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: view.scaledFont(1.5),
                      color: const Color.fromARGB(179, 97, 97, 97),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Puede que hayas escrito mal la dirección o el planeta no existe en nuestro sistema.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: view.scaledFont(0.8),
                      color: const Color.fromARGB(179, 97, 97, 97),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  CustomButton.danger(
                    label: 'Volver al listado de planetas',
                    onPressed: () => context.pop(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
