class Specs {
  String image, units;
  num velocity, power;
  Specs(this.image, this.units, this.velocity, this.power);
}

class Car {
  String id;
  String brand;
  String model;
  String description;
  String photoUrl;
  String buyPhoto;
  String brandLogo;
  num price;
  List<Specs> carSpecs;

  Car(
    this.id,
    this.brand,
    this.model,
    this.description,
    this.photoUrl,
    this.buyPhoto,
    this.brandLogo,
    this.carSpecs,
    this.price,
  );
}
