class Specs {
  String image, units;
  num value;
  Specs(this.image, this.units, this.value);
}

class Car {
  String id;
  String brand;
  String model;
  String description;
  String photoUrl;
  List<Specs> carSpecs;

  Car(
    this.id,
    this.brand,
    this.model,
    this.description,
    this.photoUrl,
    this.carSpecs,
  );
}
