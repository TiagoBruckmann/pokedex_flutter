// imports nativos
import 'package:flutter/material.dart';

// import das telas
import 'package:pokedex/app/core/widgets/pokedex_card.dart';
import 'package:pokedex/app/core/style/app_images.dart';

// import dos paoctes
import 'package:shimmer_animation/shimmer_animation.dart';

class LoadingPokemonWidget extends StatelessWidget {
  const LoadingPokemonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return PokedexCardWidget(
      body: GridView.builder(
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
    );
  }
}
