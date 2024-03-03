import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/models/catigory_model.dart';

class CatigoryCard extends StatelessWidget {
  const CatigoryCard({
    super.key,
    required this.categoryModel,
    required this.onTap,
    required this.imageType,
  });
  final CategoryModel categoryModel;
  final void Function()? onTap;
  final String imageType;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Card(
          margin: const EdgeInsets.all(0),
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: imageType == 'Asset'
                    ? Image.asset(
                        categoryModel.categoryImageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )
                    : Image.network(
                        categoryModel.categoryImageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(1),
                    ],
                  ),
                ),
              ),
              Align(
                heightFactor: 7.2,
                alignment: Alignment.bottomCenter,
                child: Text(
                  categoryModel.categoryName,
                  style: GoogleFonts.roboto(
                    color: ConstColors.backgroundLightMode,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.52,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
