class BookEntity {
  final String bookId;
  final String title;
  final String? author;
  final String? image;
  final num? price;
  final num? rate;

  BookEntity(
      {required this.title,
      required this.bookId,
      required this.author,
      required this.image,
      required this.price,
      required this.rate});
}
