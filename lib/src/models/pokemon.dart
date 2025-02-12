class Pokemon {
  final String name;
  final String type;
  final String sprite;
  final int hp;
  final int atk;
  final int def;
  final int speAtk;
  final int speDef;
  final int speed;

  int get total => hp + atk + def + speAtk + speDef + speed;

  Pokemon(
      {required this.name,
      required this.type,
      required this.sprite,
      required this.hp,
      required this.atk,
      required this.def,
      required this.speAtk,
      required this.speDef,
      required this.speed});
}
