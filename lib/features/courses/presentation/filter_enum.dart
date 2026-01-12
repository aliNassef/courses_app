enum Filter {
  name,
  price,
  rating
  ;

  String get value => switch (this) {
    name => 'name',
    price => 'price',
    rating => 'rating',
  };
}
