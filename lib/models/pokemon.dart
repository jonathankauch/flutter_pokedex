class Pokemon {
  final String name;
  final String id;
  final String imageUrl;
  final String description;
  final String category;
  final String height;
  final String weight;
  final List<dynamic> types;
  final double hp;
  final double attack;
  final double defense;
  final double specialAttack;
  final double specialDefense;
  final double speed;
  final double total;
  final String baseExp;

  Pokemon({
    this.name,
    this.id,
    this.imageUrl,
    this.description,
    this.category,
    this.height,
    this.weight,
    this.types,
    this.hp,
    this.attack,
    this.defense,
    this.specialAttack,
    this.specialDefense,
    this.speed,
    this.total,
    this.baseExp,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      id: json['id'],
      imageUrl: json['imageurl'],
      description: json['xdescription'],
      category: json['category'],
      height: json['height'],
      weight: json['weight'],
      types: json['typeofpokemon'],
      hp: json['hp'].toDouble(),
      attack: json['attack'].toDouble(),
      defense: json['defense'].toDouble(),
      specialAttack: json['special_attack'].toDouble(),
      specialDefense: json['special_defense'].toDouble(),
      speed: json['speed'].toDouble(),
      total: json['total'].toDouble(),
      baseExp: json['base_exp'],
    );
  }
}
