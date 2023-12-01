import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/dtos/recipe/recipe_dto.dart';
import '../../../infrastructure/dataSources/recipe_data_source.dart';
import '../../../domain/dtos/ingredient/ingredient_dto.dart';
import '../../../infrastructure/casters/ingredient/ingredient_caster.dart';

import '../../../infrastructure/casters/recipe/recipe_caster.dart';

part 'recipes_provider.g.dart';

@riverpod
class Recipes extends _$Recipes {
  Recipes() : super();

  @override
  FutureOr<List<Recipe>> build() async => await getRecipes();

  Future<List<Recipe>> getRecipes() async {
    return await RecipeDataSource().getRecipes();
  }

  Recipe getRecipe(String id) {
    final currentState = state.asData?.value ?? [];
    return currentState.firstWhere((element) => element.id == id);
  }

  Ingredient createIngredient(Recipe recipe) {
    Ingredient newIngredient = IngredientCaster.toIngredient({
      'name': '',
      'quantity': 0,
      'unit': '',
    });
    recipe.ingredients.add(newIngredient);
    return newIngredient;
  }

  String createRecipe() {
    Recipe newRecipe = RecipeCaster.toRecipe({
      'name': 'Nueva receta',
      'description': 'Nueva descripción',
      'ingredients': [],
      'steps': [],
    });
    state.asData!.value.add(newRecipe);
    return newRecipe.id;
  }
}
