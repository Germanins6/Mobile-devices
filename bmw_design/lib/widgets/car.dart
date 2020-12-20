class Specs {
  String image, units;
  num value;
  Specs(this.image, this.units, this.value);
}

class Car {
  String id;
  String title;
  String name;
  String model;
  String description;
  String photoUrl;
  List<Specs> carSpecs;

  Car(
    this.id,
    this.title,
    this.name,
    this.model,
    this.description,
    this.photoUrl,
    this.carSpecs,
  );
}
