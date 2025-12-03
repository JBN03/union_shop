import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/collection.dart';


final List<Collection> collections = [
  Collection(id: 'new', title: 'New Arrivals', imageUrl: ''),
  Collection(id: 'summer', title: 'Summer Collection', imageUrl: ''),
  Collection(id: 'print', title: 'Print Shack', imageUrl: ''),
  Collection(id: 'sale', title: 'Sale', imageUrl: ''),
  Collection(id: 'featured', title: 'Featured Products', imageUrl: ''),
  Collection(id: 'winter', title: 'Winter Collection', imageUrl: ''),
  Collection(id: 'hoodies', title: 'Hoodies', imageUrl:''),
  Collection(id: 'graduation', title: 'Graduation', imageUrl:'')
];

final Map<String, List<Product>> productsByCollection = {
  'new': [
    Product(
      id: 'portsmouth-city-postcard',
      title: 'Portsmouth City Postcard',
      price: '£1.00',
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
      description: 'Celebrate the charm of our coastal city with this beautifully illustrated Portsmouth City Postcard, designed by British artist Julia Gash.',
    ),
    Product(
      id: 'portsmouth-city-magnet',
      title: 'Portsmouth City Magnet',
      price: '4.50',
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      description: 'Bring a bit of Portsmouth pride to your fridge, locker, or pinboard with our eye-catching Portsmouth City Magnet, featuring the artwork of renowned illustrator Julia Gash.',
    ),
    Product(
      id: 'portsmouth-city-bookmark',
      title: 'Portsmouth City Bookmark',
      price: '£3.00',
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityBookmark1_1024x1024@2x.jpg?v=1752230004',
      description: 'Add a touch of local charm to your reading with this beautifully illustrated Portsmouth City Bookmark, designed by British artist Julia Gash.',
    ),
    Product(
      id: 'portsmouth-city-keyring',
      title: 'Portsmouth City Keyring',
      price: '£3.75',
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityKeyring_1024x1024@2x.jpg?v=1757419192',
      description: 'Portsmouth City Keyring featuring artwork by Julia Gash.',
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
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/Sage_T-shirt_1024x1024@2x.png?v=1759827236',
      description: 'Essential cotton t-shirt',
    ),
    Product(
      id: 'signature-hoodie',
      title: 'Signature Hoodie',
      price: '£32.99',
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_1024x1024@2x.png?v=1745583498',
      description: 'Signature range hoodie',
    ),
    Product(
      id: 'signature-tshirt',
      title: 'Signature T-Shirt',
      price: '£14.99',
      imageUrl: 'https://shop.upsu.net/cdn/shop/files/Signature_T-Shirt_Indigo_Blue_2_1024x1024@2x.jpg?v=1758290534',
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
