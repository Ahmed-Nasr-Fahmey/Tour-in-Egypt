import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/models/city_category_model.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/manager/user_cubit.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_rating.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/category_details_view.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/map_view.dart';

class GovernorateCategoryCard extends StatefulWidget {
  const GovernorateCategoryCard({super.key, required this.categoryModel});
  final CityCategoryModel categoryModel;

  @override
  State<GovernorateCategoryCard> createState() =>
      _GovernorateCategoryCardState();
}

class _GovernorateCategoryCardState extends State<GovernorateCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              // image: DecorationImage(
              //     image: AssetImage(widget.categoryModel[widget.index].picture),
              //     fit: BoxFit.fill),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  widget.categoryModel.picture!,
                ),
              ),

              borderRadius: const BorderRadius.all(Radius.circular(30)),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,
                  color: ConstColors.backgroundDarkMode,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(1),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.75),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.categoryModel.isFavorits) {
                            // Remove from favorites
                            BlocProvider.of<UserCubit>(context)
                                .favorites
                                .removeWhere(
                                  (item) =>
                                      item.categoryID ==
                                      widget.categoryModel.categoryID,
                                );
                          } else {
                            // Add to favorites
                            BlocProvider.of<UserCubit>(context)
                                .favorites
                                .add(widget.categoryModel);
                          }
                          widget.categoryModel.isFavorits =
                              !widget.categoryModel.isFavorits;
                        });
                      },
                      icon: widget.categoryModel.isFavorits
                          ? const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              child: Image(
                                image: AssetImage("assets/Heart_Filled.png"),
                                height: 20,
                              ),
                            )
                          : const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              child: Image(
                                image:
                                    AssetImage("assets/Heart_Not_Filled.png"),
                                height: 20,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.categoryModel.name!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              //show popup menu that have location detailes
                              PersistentNavBarNavigator
                                  .pushNewScreenWithRouteSettings(
                                context,
                                settings: const RouteSettings(
                                    name: ShowMapView.routeName),
                                screen: ShowMapView(
                                  latLng: LatLng(
                                    double.parse(
                                        widget.categoryModel.latitude!),
                                    double.parse(
                                        widget.categoryModel.longitude!),
                                  ),
                                ),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            child: const Icon(
                              Icons.location_on,
                              color: ConstColors.primaryGoldColor,
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Expanded(
                            flex: 3,
                            child: GestureDetector(
                              onTap: () {
                                //show popup menu that have location detailes
                                PersistentNavBarNavigator
                                    .pushNewScreenWithRouteSettings(
                                  context,
                                  settings: const RouteSettings(
                                      name: ShowMapView.routeName),
                                  screen: ShowMapView(
                                    latLng: LatLng(
                                      double.parse(
                                          widget.categoryModel.latitude!),
                                      double.parse(
                                          widget.categoryModel.longitude!),
                                    ),
                                  ),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Text(
                                widget.categoryModel.address!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomRating(
                              categoryModel: widget.categoryModel,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        onTap: () {
          ///ToDo Screen View
          PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
            context,
            settings: const RouteSettings(name: CategoryDetailsView.routeName),
            screen: CategoryDetailsView(categoryModel: widget.categoryModel),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
      ),
    );
  }
}
