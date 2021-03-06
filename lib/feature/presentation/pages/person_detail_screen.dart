import 'package:flutter/material.dart';
import 'package:rick_and_morty/common/app_colors.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty/feature/presentation/widgets/person_cache_image_widget.dart';

class PersonDetailPage extends StatelessWidget {
  final PersonEntity person;

  const PersonDetailPage({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 24.0,
            ),
            Text(
              person.name,
              style: const TextStyle(
                fontSize: 28.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Container(
              child: PersonCacheImage(
                width: 260.0,
                height: 260.0,
                imageUrl: person.image,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 12.0,
                  height: 12.0,
                  decoration: BoxDecoration(
                    color: person.status == 'Alive' ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  person.status,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            // ... - spread operator
            if (person.type.isNotEmpty) ...buildText('Type:', person.type),
            ...buildText('Gender:', person.gender),
            ...buildText(
                'Number of episodes: ', person.episode.length.toString()),
            ...buildText('Species:', person.species),
            ...buildText('Last known location:', person.location.name),
            ...buildText('Origin:', person.origin.name),
            ...buildText('Was created:', person.created.toString()),
          ],
        ),
      ),
    );
  }

  List<Widget> buildText(String text, String value) {
    return [
      Text(
        text,
        style: const TextStyle(
          color: AppColors.greyBackground,
        ),
      ),
      const SizedBox(
        height: 4.0,
      ),
      Text(
        value,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      const SizedBox(
        height: 12.0,
      ),
    ];
  }
}
