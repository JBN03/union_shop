import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/collection.dart';

// Public product/collection data shared with ProductService.
final List<Collection> collections = [
  Collection(id: 'new', title: 'New Arrivals', imageUrl: ''),
  Collection(id: 'summer', title: 'Summer Collection', imageUrl: ''),
  Collection(id: 'print', title: 'Print Shack', imageUrl: ''),
  Collection(id: 'sale', title: 'Sale', imageUrl: ''),
];

final Map<String, List<Product>> productsByCollection = {
  'new': [
    Product(
      id: 'placeholder-1',
      title: 'Placeholder Product 1',
      price: '£10.00',
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      description: 'Placeholder product 1',
    ),
    Product(
      id: 'placeholder-2',
      title: 'Placeholder Product 2',
      price: '£15.00',
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      description: 'Placeholder product 2',
    ),
    Product(
      id: 'placeholder-3',
      title: 'Placeholder Product 3',
      price: '£20.00',
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      description: 'Placeholder product 3',
    ),
    Product(
      id: 'placeholder-4',
      title: 'Placeholder Product 4',
      price: '£25.00',
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      description: 'Placeholder product 4',
    ),
    Product(
      id: 'limited-zip-hoodies',
      title: 'Limited Edition Essential Zip Hoodies',
      price: '£14.99',
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/Pink_Essential_Hoodie_2a3589c2-096f-479f-ac60-d41e8a853d04_1024x1024@2x.jpg?v=1749131089',
      description: 'Limited edition hoodie',
    ),
    Product(
      id: 'essential-tshirt',
      title: 'Essential T-Shirt',
      price: '£6.99',
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      description: 'Essential cotton t-shirt',
    ),
    Product(
      id: 'signature-hoodie',
      title: 'Signature Hoodie',
      price: '£32.99',
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      description: 'Signature range hoodie',
    ),
    Product(
      id: 'signature-tshirt',
      title: 'Signature T-Shirt',
      price: '£14.99',
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      description: 'Signature range t-shirt',
    ),
  ],
  'featured': [
    Product(
      id: 'limited-zip-hoodies',
      title: 'Limited Edition Essential Zip Hoodies',
      price: '£14.99',
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/Pink_Essential_Hoodie_2a3589c2-096f-479f-ac60-d41e8a853d04_1024x1024@2x.jpg?v=1749131089',
      description: 'Limited edition hoodie',
    ),
    Product(
      id: 'essential-tshirt',
      title: 'Essential T-Shirt',
      price: '£6.99',
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      description: 'Essential cotton t-shirt',
    ),
    Product(
      id: 'signature-hoodie',
      title: 'Signature Hoodie',
      price: '£32.99',
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      description: 'Signature range hoodie',
    ),
    Product(
      id: 'signature-tshirt',
      title: 'Signature T-Shirt',
      price: '£14.99',
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      description: 'Signature range t-shirt',
    ),
  ],
  'summer': List.generate(
    6,
    (i) => Product(
      id: 'summer-${i + 1}',
      title: 'Summer Product ${i + 1}',
      price: '£${10 + i}',
      imageUrl: '',
      description: 'Description for summer product ${i + 1}',
    ),
  ),
  'print': List.generate(
    4,
    (i) => Product(
      id: 'print-${i + 1}',
      title: 'Print Product ${i + 1}',
      price: '£${8 + i}',
      imageUrl: '',
      description: 'Description for print product ${i + 1}',
    ),
  ),
  'sale': List.generate(
    3,
    (i) => Product(
      id: 'sale-${i + 1}',
      title: 'Sale Product ${i + 1}',
      price: '£${5 + i}',
      imageUrl: '',
      description: 'Sale product ${i + 1}',
    ),
  ),
};
