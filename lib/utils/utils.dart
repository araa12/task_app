const baseImageUrl = 'https://image.tmdb.org/t/p/w500/';

String nameFormatter(String name) {
  if (name.length > 20) {
    return name.substring(0, 20);
  } else {
    return name;
  }
}
