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

  final String imagePath;
  ItemImage(List list,
      {required List<String> itemText,
      required List<String> adds,
      required List<String> shirts,
      required List bank,
      required List pants,
      required List itemPrice,
      required List itemName,
      required this.imagePath});

 
}

final List<Map<String, String>> products = [
  {
    'id': '1',
    'name': 'BALMAIN',
    'price': 'Price : \$ :1000',
    'image': 'assets/images/download.jpg',
  },
  {
    'id': '2',
    'name': 'ARMANI',
    'price': 'Price : \$ :2000',
    'image': 'assets/images/download (1).jpg',
  },
  {
    'id': '3',
    'name': 'PRADA',
    'price': 'Price : \$ :1500',
    'image': 'assets/images/download (2).jpg',
  },
  {
    'id': '4',
    'name': 'GUCCI',
    'price': 'Price : \$ :500',
    'image': 'assets/images/download (3).jpg',
  },
  {
    'id': '5',
    'name': 'MILANO',
    'price': 'Price : \$ :1200',
    'image': 'assets/images/download (4).jpg',
  },
  {
    'id': '6',
    'name': 'FENDI',
    'price': 'Price : \$ :800',
    'image': 'assets/images/download (5).jpg',
  },
  {
    'id': '7',
    'name': 'GAP',
    'price': 'Price : \$ :900',
    'image': 'assets/images/download (6).jpg',
  },
  {
    'id': '8',
    'name': 'BURBERRY',
    'price': 'Price : \$ :5000',
    'image': 'assets/images/download (7).jpg',
  },
  {
    'id': '9',
    'name': 'LEVIS',
    'price': 'Price : \$ :400',
    'image': 'assets/images/download (8).jpg',
  },
];
