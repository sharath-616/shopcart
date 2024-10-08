class ItemImage {
  final List<String> shirts = [
    'assets/images/download.jpg',
    'assets/images/download (1).jpg',
    'assets/images/download (2).jpg',
    'assets/images/download (3).jpg',
    'assets/images/download (4).jpg',
    'assets/images/download (5).jpg',
    'assets/images/download (6).jpg',
    'assets/images/download (7).jpg',
    'assets/images/download (8).jpg',
  ];

  final List<String> adds = [
    'assets/add/balenciaga.jpg',
    'assets/add/D and g.jpg',
    'assets/add/gax.jpg',
    'assets/add/lv.jpg',
    'assets/add/download.jpg',
  ];

  final List<String> bankAdds = [
    'assets/bank/Reliance-Logo.png',
    'assets/bank/Federal_Bank_Logo.png',
    'assets/bank/Reliance-Logo.png',
    'assets/bank/Federal_Bank_Logo.png',
    'assets/bank/Reliance-Logo.png',
    'assets/bank/Federal_Bank_Logo.png',
  ];
  final List<String> itemText = [
    'Sale',
    'Men',
    'Women',
    'Kids',
    'Home',
    'Sports',
    'Electronics',
    'Sandals',
    'Accessories',
  ];

  final List<String> itemPrice = [
    "Price : \$ :1000",
    "Price : \$ :2000",
    "Price : \$ :1500",
    "Price : \$ :500",
    "Price : \$ :1200",
    "Price : \$ :800",
    "Price : \$ :900",
    "Price : \$ :5000",
    "Price : \$ :400",
  ];

  final List<String> itemName = [
    'BALMAIN',
    'ARMANI',
    'PRADA',
    'GUCCI',
    'MILANO',
    'FENDI',
    'GAP',
    'BURBERRY',
    'LEVIS',
  ];

  final List<String> pants = [
    'assets/jeans/download.jpg',
    'assets/jeans/download (1).jpg',
    'assets/jeans/download (2).jpg',
    'assets/jeans/download (3).jpg',
    'assets/jeans/download (4).jpg',
    'assets/jeans/download (5).jpg',
    'assets/jeans/download (6).jpg',
    'assets/jeans/download (7).jpg',
    'assets/jeans/download (8).jpg',
  ];

  ItemImage(List list,
      {required List<String> itemText,
      required List<String> adds,
      required List<String> shirts,
      required List bank,
      required List pants,
      required List itemPrice,
      required List itemName});

  get bank => null;
}
