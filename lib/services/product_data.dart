import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/collection.dart';


final List<Collection> collections = [
  Collection(id: 'new', title: 'Stationery', imageUrl: 'https://i.ibb.co/bjMY6F1k/Gemini-Generated-Image-o4z8tho4z8tho4z8.png'),
  Collection(id: 'sale', title: 'Sale', imageUrl: 'https://i.ibb.co/sJ2fmJZ3/Gemini-Generated-Image-m2dfvcm2dfvcm2df.png'),
  Collection(id: 'tshirts', title: 'T-Shirts', imageUrl: 'https://i.ibb.co/7tfFXJw2/Gemini-Generated-Image-l744hol744hol744.png'),
  Collection(id: 'winter', title: 'Winter Collection', imageUrl: 'https://i.ibb.co/vxp8v9jV/Gemini-Generated-Image-qamc14qamc14qamc.png'),
  Collection(id: 'hoodies', title: 'Hoodies', imageUrl: 'https://i.ibb.co/Q7FW3080/Gemini-Generated-Image-vqnpspvqnpspvqnp.png'),
  Collection(id: 'graduation', title: 'Graduation', imageUrl: 'https://i.ibb.co/35YDmDfc/Gemini-Generated-Image-9jtlq49jtlq49jtl.png')
];

final Map<String, List<Product>> productsByCollection = {
  'new': [
    Product(
      id: 'portsmouth-city-postcard',
      title: 'Portsmouth City Postcard',
      price: '£1.00',
      imageUrl: 'https://i.ibb.co/jkYYTZhs/Gemini-Generated-Image-aljdv5aljdv5aljd.png',
      description: 'Celebrate the charm of our coastal city with this beautifully illustrated Portsmouth City Postcard, designed by British artist Julia Gash.',
    ),
    Product(
      id: 'portsmouth-city-magnet',
      title: 'Portsmouth City Magnet',
      price: '4.50',
      imageUrl: 'https://i.ibb.co/FqDWKD2M/Gemini-Generated-Image-zfw8ogzfw8ogzfw8.png',
      description: 'Bring a bit of Portsmouth pride to your fridge, locker, or pinboard with our eye-catching Portsmouth City Magnet, featuring the artwork of renowned illustrator Julia Gash.',
    ),
    Product(
      id: 'portsmouth-city-bookmark',
      title: 'Portsmouth City Bookmark',
      price: '£3.00',
      imageUrl: 'https://i.ibb.co/k2mnMK8J/Gemini-Generated-Image-gahe2agahe2agahe.png',
      description: 'Add a touch of local charm to your reading with this beautifully illustrated Portsmouth City Bookmark, designed by British artist Julia Gash.',
    ),
    Product(
      id: 'portsmouth-city-keyring',
      title: 'Portsmouth City Keyring',
      price: '£3.75',
      imageUrl: 'https://i.ibb.co/Xf1BWfT5/Gemini-Generated-Image-gnfn46gnfn46gnfn.png',
      description: 'Portsmouth City Keyring featuring artwork by Julia Gash.',
    ),
    Product(
      id: 'limited-zip-hoodies',
      title: 'Limited Edition Essential Zip Hoodies',
      price: '£14.99',
      imageUrl: 'https://i.ibb.co/PvT70NBg/Gemini-Generated-Image-r56f26r56f26r56f.png',
      description: 'Limited edition hoodie',
    ),
    Product(
      id: 'essential-tshirt',
      title: 'Essential T-Shirt',
      price: '£6.99',
      imageUrl: 'https://i.ibb.co/FkbrBJ9W/Gemini-Generated-Image-i292hli292hli292.png',
      images: [
        'https://i.ibb.co/FkbrBJ9W/Gemini-Generated-Image-i292hli292hli292.png',
        'https://i.ibb.co/MDMRD57D/Gemini-Generated-Image-5z5rnr5z5rnr5z5r.png',
      ],
      description: 'Essential cotton t-shirt',
    ),
  ],
  // T-Shirts collection — placeholders for pagination/testing
  'tshirts': List.generate(
    12,
    (i) => Product(
      id: 'tshirt-placeholder-${i + 1}',
      title: 'Placeholder Product ${i + 1}',
      price: '',
      imageUrl: '',
      description: 'Placeholder product for pagination/testing',
    ),
  ),
  // Hoodies collection — placeholders
  'hoodies': List.generate(
    12,
    (i) => Product(
      id: 'hoodie-placeholder-${i + 1}',
      title: 'Placeholder Product ${i + 1}',
      price: '',
      imageUrl: '',
      description: 'Placeholder product for pagination/testing',
    ),
  ),
  // Winter collection — placeholders
  'winter': List.generate(
    12,
    (i) => Product(
      id: 'winter-placeholder-${i + 1}',
      title: 'Placeholder Product ${i + 1}',
      price: '',
      imageUrl: '',
      description: 'Placeholder product for pagination/testing',
    ),
  ),
  // Graduation collection — add 12 placeholder cards
  'graduation': List.generate(
    12,
    (i) => Product(
      id: 'graduation-placeholder-${i + 1}',
      title: 'Placeholder Product ${i + 1}',
      price: '',
      imageUrl: '',
      description: 'Placeholder product for pagination/testing',
    ),
  ),
  // Sale collection — placeholders (ensures pagination works)
  'sale': List.generate(
    12,
    (i) => Product(
      id: 'sale-placeholder-${i + 1}',
      title: 'Sale Placeholder ${i + 1}',
      price: '',
      imageUrl: '',
      description: 'Placeholder sale product for pagination/testing',
    ),
  ),
};
