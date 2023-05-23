// imports nativos
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import das telas
import 'package:pokedex/app/core/widgets/pokedex_card.dart';
import 'package:pokedex/app/core/style/app_images.dart';
import 'package:pokedex/app/core/style/app_colors.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

// import dos paoctes
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class LoadingDetail extends StatelessWidget {
  final PokemonEntity pokemon;
  const LoadingDetail({ Key? key, required this.pokemon }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.neutralGreen,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.neutralGreen,
        ),
        title: Shimmer(
          duration: const Duration(seconds: 5),
          color: Colors.grey[50]!,
          colorOpacity: 0.3,
          enabled: true,
          direction: const ShimmerDirection.fromLTRB(),
          child: Text(
            pokemon.name,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only( right: 16 ),
            child: Shimmer(
              duration: const Duration(seconds: 5),
              color: Colors.grey[50]!,
              colorOpacity: 0.3,
              enabled: true,
              direction: const ShimmerDirection.fromLTRB(),
              child: Text(
                "# ${pokemon.id}",
                style: TextStyle(
                  color: theme.scaffoldBackgroundColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.neutralGreen,
          image: DecorationImage(
            image: AssetImage(AppImages.pokeBall),
            fit: BoxFit.scaleDown,
            alignment: Alignment.topRight,
            scale: 1.5,
            opacity: 98,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [

                  Padding(
                    padding: const EdgeInsets.only( top: 155 ),
                    child: PokedexCardWidget(
                      body: Padding(
                        padding: const EdgeInsets.only( top: 35 ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Padding(
                              padding: const EdgeInsets.only( right: 10 ),
                              child: Shimmer(
                                duration: const Duration(seconds: 5),
                                color: Colors.grey[50]!,
                                colorOpacity: 0.3,
                                enabled: true,
                                direction: const ShimmerDirection.fromLTRB(),
                                child: RawChip(
                                  backgroundColor: AppColors.neutralGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular( 20 ),
                                  ),
                                  label: Text(
                                    "Normal",
                                    style: theme.textTheme.displaySmall!.apply(color: theme.scaffoldBackgroundColor),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric( vertical: 16 ),
                              child: Shimmer(
                                duration: const Duration(seconds: 5),
                                color: Colors.grey[50]!,
                                colorOpacity: 0.3,
                                enabled: true,
                                direction: const ShimmerDirection.fromLTRB(),
                                child: Text(
                                  FlutterI18n.translate(context, "pages.detail.about"),
                                  style: theme.textTheme.displayMedium!.apply( color: AppColors.neutralGreen ),
                                ),
                              ),
                            ),

                            Row(
                              children: [

                                Expanded(
                                  child: ListTile(
                                    leading: Shimmer(
                                      duration: const Duration(seconds: 5),
                                      color: Colors.grey[50]!,
                                      colorOpacity: 0.3,
                                      enabled: true,
                                      direction: const ShimmerDirection.fromLTRB(),
                                      child: const FaIcon(
                                        FontAwesomeIcons.weightHanging,
                                      ),
                                    ),
                                    title: Shimmer(
                                      duration: const Duration(seconds: 5),
                                      color: Colors.grey[50]!,
                                      colorOpacity: 0.3,
                                      enabled: true,
                                      direction: const ShimmerDirection.fromLTRB(),
                                      child: Text(
                                        "2.5 KG",
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                    subtitle: Shimmer(
                                      duration: const Duration(seconds: 5),
                                      color: Colors.grey[50]!,
                                      colorOpacity: 0.3,
                                      enabled: true,
                                      direction: const ShimmerDirection.fromLTRB(),
                                      child: Text(
                                        FlutterI18n.translate(context, "pages.detail.weight"),
                                        style: theme.textTheme.bodySmall,
                                      ),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: ListTile(
                                    leading: Shimmer(
                                      duration: const Duration(seconds: 5),
                                      color: Colors.grey[50]!,
                                      colorOpacity: 0.3,
                                      enabled: true,
                                      direction: const ShimmerDirection.fromLTRB(),
                                      child: const FaIcon(
                                        FontAwesomeIcons.rulerVertical,
                                      ),
                                    ),
                                    title: Shimmer(
                                      duration: const Duration(seconds: 5),
                                      color: Colors.grey[50]!,
                                      colorOpacity: 0.3,
                                      enabled: true,
                                      direction: const ShimmerDirection.fromLTRB(),
                                      child: Text(
                                        "0.9 m",
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                    subtitle: Shimmer(
                                      duration: const Duration(seconds: 5),
                                      color: Colors.grey[50]!,
                                      colorOpacity: 0.3,
                                      enabled: true,
                                      direction: const ShimmerDirection.fromLTRB(),
                                      child: Text(
                                        FlutterI18n.translate(context, "pages.detail.height"),
                                        style: theme.textTheme.bodySmall,
                                      ),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: ListTile(
                                    title: Shimmer(
                                      duration: const Duration(seconds: 5),
                                      color: Colors.grey[50]!,
                                      colorOpacity: 0.3,
                                      enabled: true,
                                      direction: const ShimmerDirection.fromLTRB(),
                                      child: Text(
                                        "Synchronize",
                                        style: theme.textTheme.bodySmall,
                                      ),
                                    ),
                                    subtitle: Shimmer(
                                      duration: const Duration(seconds: 5),
                                      color: Colors.grey[50]!,
                                      colorOpacity: 0.3,
                                      enabled: true,
                                      direction: const ShimmerDirection.fromLTRB(),
                                      child: Text(
                                        FlutterI18n.translate(context, "pages.detail.abilities"),
                                        style: theme.textTheme.bodySmall,
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric( vertical: 15 ),
                              child: Shimmer(
                                duration: const Duration(seconds: 5),
                                color: Colors.grey[50]!,
                                colorOpacity: 0.3,
                                enabled: true,
                                direction: const ShimmerDirection.fromLTRB(),
                                child: Text(
                                  FlutterI18n.translate(context, "pages.detail.stats"),
                                  style: theme.textTheme.displayMedium!.apply( color: AppColors.neutralGreen ),
                                ),
                              ),
                            ),

                            ListTile(
                              leading: Shimmer(
                                duration: const Duration(seconds: 5),
                                color: Colors.grey[50]!,
                                colorOpacity: 0.3,
                                enabled: true,
                                direction: const ShimmerDirection.fromLTRB(),
                                child: Text(
                                  "HP",
                                  style: theme.textTheme.displaySmall!.apply( color: AppColors.neutralGreen ),
                                ),
                              ),
                              title: LinearProgressIndicator(
                                minHeight: 5,
                                value: 100 / 250,
                                color: AppColors.neutralGreen,
                                backgroundColor: AppColors.neutralGreen.withOpacity(0.25),
                              ),
                            ),

                            ListTile(
                              leading: Shimmer(
                                duration: const Duration(seconds: 5),
                                color: Colors.grey[50]!,
                                colorOpacity: 0.3,
                                enabled: true,
                                direction: const ShimmerDirection.fromLTRB(),
                                child: Text(
                                  "ATK",
                                  style: theme.textTheme.displaySmall!.apply( color: AppColors.neutralGreen ),
                                ),
                              ),
                              title: LinearProgressIndicator(
                                minHeight: 5,
                                value: 100 / 250,
                                color: AppColors.neutralGreen,
                                backgroundColor: AppColors.neutralGreen.withOpacity(0.25),
                              ),
                            ),

                            ListTile(
                              leading: Shimmer(
                                duration: const Duration(seconds: 5),
                                color: Colors.grey[50]!,
                                colorOpacity: 0.3,
                                enabled: true,
                                direction: const ShimmerDirection.fromLTRB(),
                                child: Text(
                                  "DEF",
                                  style: theme.textTheme.displaySmall!.apply( color: AppColors.neutralGreen ),
                                ),
                              ),
                              title: LinearProgressIndicator(
                                minHeight: 5,
                                value: 100 / 250,
                                color: AppColors.neutralGreen,
                                backgroundColor: AppColors.neutralGreen.withOpacity(0.25),
                              ),
                            ),

                            ListTile(
                              leading: Shimmer(
                                duration: const Duration(seconds: 5),
                                color: Colors.grey[50]!,
                                colorOpacity: 0.3,
                                enabled: true,
                                direction: const ShimmerDirection.fromLTRB(),
                                child: Text(
                                  "SATK",
                                  style: theme.textTheme.displaySmall!.apply( color: AppColors.neutralGreen ),
                                ),
                              ),
                              title: LinearProgressIndicator(
                                minHeight: 5,
                                value: 100 / 250,
                                color: AppColors.neutralGreen,
                                backgroundColor: AppColors.neutralGreen.withOpacity(0.25),
                              ),
                            ),

                            ListTile(
                              leading: Shimmer(
                                duration: const Duration(seconds: 5),
                                color: Colors.grey[50]!,
                                colorOpacity: 0.3,
                                enabled: true,
                                direction: const ShimmerDirection.fromLTRB(),
                                child: Text(
                                  "SDEF",
                                  style: theme.textTheme.displaySmall!.apply( color: AppColors.neutralGreen ),
                                ),
                              ),
                              title: LinearProgressIndicator(
                                minHeight: 5,
                                value: 100 / 250,
                                color: AppColors.neutralGreen,
                                backgroundColor: AppColors.neutralGreen.withOpacity(0.25),
                              ),
                            ),

                            ListTile(
                              leading: Shimmer(
                                duration: const Duration(seconds: 5),
                                color: Colors.grey[50]!,
                                colorOpacity: 0.3,
                                enabled: true,
                                direction: const ShimmerDirection.fromLTRB(),
                                child: Text(
                                  "SPD",
                                  style: theme.textTheme.displaySmall!.apply( color: AppColors.neutralGreen ),
                                ),
                              ),
                              title: LinearProgressIndicator(
                                minHeight: 5,
                                value: 100 / 250,
                                color: AppColors.neutralGreen,
                                backgroundColor: AppColors.neutralGreen.withOpacity(0.25),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 80,
                    left: 15,
                    child: Shimmer(
                      duration: const Duration(seconds: 5),
                      color: Colors.grey[50]!,
                      colorOpacity: 0.3,
                      enabled: true,
                      direction: const ShimmerDirection.fromLTRB(),
                      child: const FaIcon(
                        FontAwesomeIcons.circleArrowLeft,
                        color: AppColors.white,
                        size: 25,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 80,
                    right: 15,
                    child: Shimmer(
                      duration: const Duration(seconds: 5),
                      color: Colors.grey[50]!,
                      colorOpacity: 0.3,
                      enabled: true,
                      direction: const ShimmerDirection.fromLTRB(),
                      child: const FaIcon(
                        FontAwesomeIcons.circleArrowRight,
                        color: AppColors.white,
                        size: 25,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 8,
                    child: Center(
                      widthFactor: 1.8,
                      child: Image.network(
                        pokemon.image,
                        height: 200,
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (builder, index) {

          return Card(
            shadowColor: Colors.grey,
            child: GridTile(
              header: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 8, 0),
                child: Shimmer(
                  duration: const Duration(seconds: 5),
                  color: Colors.grey[50]!,
                  colorOpacity: 0.3,
                  enabled: true,
                  direction: const ShimmerDirection.fromLTRB(),
                  child: Text(
                    "# 150",
                    textAlign: TextAlign.end,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ),
              footer: GridTileBar(
                backgroundColor: theme.colorScheme.primary.withOpacity(0.8),
                title: Shimmer(
                  duration: const Duration(seconds: 5),
                  color: Colors.grey[50]!,
                  colorOpacity: 0.3,
                  enabled: true,
                  direction: const ShimmerDirection.fromLTRB(),
                  child: Text(
                    "MewTwo",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),
              child: Shimmer(
                duration: const Duration(seconds: 5),
                color: Colors.grey[50]!,
                colorOpacity: 0.3,
                enabled: true,
                direction: const ShimmerDirection.fromLTRB(),
                child: Image.asset(
                  AppImages.mewtwo,
                  color: Colors.grey,
                ),
              ),
            ),
          );

        },
      ),
 */