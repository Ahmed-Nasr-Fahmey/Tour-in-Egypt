import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/core/models/catigory_model.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/widgets/catigory_card.dart';
class CityPlacesBuilder extends StatelessWidget {
  const CityPlacesBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
              left: 16,
            ),
            child: SizedBox(
              width: 160,
              child: CatigoryCard(
                onTap: () {},
                imageType: 'Network',
                categoryModel: CategoryModel(
                    categoryName: 'Dream Park',
                    categoryImageUrl:
                        'https://scoopempire.com/wp-content/uploads/2016/11/dream-park.jpg'),
              ),
            ),
          );
        },
      ),
    );
  }
}
