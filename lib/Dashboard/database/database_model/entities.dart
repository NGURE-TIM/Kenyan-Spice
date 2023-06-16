import 'package:floor/floor.dart';


@entity

class Recipe{
  @PrimaryKey(autoGenerate: true)
  final  int id;

  final String image_path;
  final String title;
  final String short_description;
  final String meal_type;
  Recipe(
      {
        required this.id,
        required this.image_path,
        required this.title,
        required this.short_description,
        required this.meal_type,

      });
}

@Entity(
tableName: 'ingredient',
  foreignKeys: [
    ForeignKey(
      childColumns: ['recipe_id'],
      parentColumns: ['id'],
      entity: Recipe,
    )
  ],
)
class Ingredients {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final  int recipe_id;
final String category;
final String item;
Ingredients(
{

required this.id,
required this.recipe_id,
required this.category,
required this.item,

});

}






