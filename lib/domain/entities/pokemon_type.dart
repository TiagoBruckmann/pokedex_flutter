// imports nativos
import 'dart:ui';

// import das telas
import 'package:pokedex/app/core/style/app_colors.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class PokemonTypeEntity extends Equatable {

  final int slot;
  final String type;

  const PokemonTypeEntity( this.slot, this.type);

  Color get color {
    Map<String, dynamic> colors = {
      "grass": AppColors.mantis,
      "bug": AppColors.bahia,
      "fire": AppColors.burntOrange,
      "water": AppColors.cornflowerBlue,
      "fighting": AppColors.bittersweet,
      "normal": AppColors.neutralGreen,
      "electric": AppColors.sunGlow,
      "psychic": AppColors.brinkPink,
      "poison": AppColors.violetBlue,
      "ghost": AppColors.studio,
      "ground": AppColors.ironstone,
      "rock": AppColors.sahara,
      "dark": AppColors.licorice,
      "dragon": AppColors.coralTree,
      "fairy": AppColors.illusion,
      "flying": AppColors.bilobaFlower,
      "ice": AppColors.morningGlory,
      "steel": AppColors.lavenderGrey,
      "monster": AppColors.mayaBlue,
      "unknown": AppColors.mayaBlue,
    };

    return colors[type] ?? AppColors.mayaBlue;
  }

  @override
  List<Object?> get props => [slot, type];

}