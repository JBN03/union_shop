import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/collection.dart';


final List<Collection> collections = [
  Collection(id: 'tshirts', title: 'T-Shirts', imageUrl: 'https://i.ibb.co/7tfFXJw2/Gemini-Generated-Image-l744hol744hol744.png'),
  Collection(id: 'accessories', title: 'Accessories', imageUrl: 'https://i.ibb.co/zT4T4SgN/Gemini-Generated-Image-i2zdadi2zdadi2zd.png'),
  Collection(id: 'graduation', title: 'Graduation', imageUrl: 'https://i.ibb.co/35YDmDfc/Gemini-Generated-Image-9jtlq49jtlq49jtl.png'),
  Collection(id: 'winter', title: 'Winter Collection', imageUrl: 'https://i.ibb.co/vxp8v9jV/Gemini-Generated-Image-qamc14qamc14qamc.png'),
  Collection(id: 'hoodies', title: 'Hoodies & Joggers', imageUrl: 'https://i.ibb.co/Q7FW3080/Gemini-Generated-Image-vqnpspvqnpspvqnp.png'),
  Collection(id: 'new', title: 'Stationery', imageUrl: 'https://i.ibb.co/bjMY6F1k/Gemini-Generated-Image-o4z8tho4z8tho4z8.png')
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
      price: '£4.50',
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
      id: 'essentials-hoodie',
      title: 'Essentials Hoodie',
      price: '£15.00',
      imageUrl: 'https://i.ibb.co/PvT70NBg/Gemini-Generated-Image-r56f26r56f26r56f.png',
      images: [
        'https://i.ibb.co/PvT70NBg/Gemini-Generated-Image-r56f26r56f26r56f.png',
        'https://i.ibb.co/5WTzvphh/Gemini-Generated-Image-rkkmcrkkmcrkkmcr.png',
      ],
      colorImages: {
        'Blue': 'https://i.ibb.co/PvT70NBg/Gemini-Generated-Image-r56f26r56f26r56f.png',
        'Grey': 'https://i.ibb.co/5WTzvphh/Gemini-Generated-Image-rkkmcrkkmcrkkmcr.png',
      },
      description: 'University of Portsmouth essentials hoodie',
    ),
    Product(
      id: 'essential-tshirt',
      title: 'Essential T-Shirt',
      price: '£8.00',
      imageUrl: 'https://i.ibb.co/FkbrBJ9W/Gemini-Generated-Image-i292hli292hli292.png',
      images: [
        'https://i.ibb.co/FkbrBJ9W/Gemini-Generated-Image-i292hli292hli292.png',
        'https://i.ibb.co/MDMRD57D/Gemini-Generated-Image-5z5rnr5z5rnr5z5r.png',
      ],
      colorImages: {
        'Pink': 'https://i.ibb.co/FkbrBJ9W/Gemini-Generated-Image-i292hli292hli292.png',
        'Red': 'https://i.ibb.co/MDMRD57D/Gemini-Generated-Image-5z5rnr5z5rnr5z5r.png',
      },
      description: 'Essential cotton t-shirt',
    ),
    Product(
      id: 'pen',
      title: 'Pen',
      price: '£3.00',
      imageUrl: 'https://i.ibb.co/rR1108fq/Gemini-Generated-Image-finisofinisofini.png',
      description: 'Branded University of Portsmouth pen',
    ),
    Product(
      id: 'notebook',
      title: 'Notebook',
      price: '£6.50',
      imageUrl: 'https://i.ibb.co/WNBbgJ1s/Gemini-Generated-Image-e8didqe8didqe8di-1.png',
      description: 'University of Portsmouth notebook',
    ),
  ],
  
  'tshirts': [
    Product(
      id: 'small-logo-tshirt',
      title: 'Small logo T-shirt',
      price: '£8.00',
      imageUrl: 'https://i.ibb.co/gbrPW1Ff/Gemini-Generated-Image-pnd6sppnd6sppnd6.png',
      images: [
        'https://i.ibb.co/gbrPW1Ff/Gemini-Generated-Image-pnd6sppnd6sppnd6.png',
        'https://i.ibb.co/5Xqy3bWz/Gemini-Generated-Image-losrbxlosrbxlosr.png',
        'https://i.ibb.co/Zymm1pg/Gemini-Generated-Image-60vyvm60vyvm60vy.png',
      ],
      colorImages: {
        'Blue': 'https://i.ibb.co/gbrPW1Ff/Gemini-Generated-Image-pnd6sppnd6sppnd6.png',
        'Grey': 'https://i.ibb.co/5Xqy3bWz/Gemini-Generated-Image-losrbxlosrbxlosr.png',
        'Red': 'https://i.ibb.co/Zymm1pg/Gemini-Generated-Image-60vyvm60vyvm60vy.png',
      },
      description: 'Small logo T-shirt',
    ),
    Product(
      id: 'essential-tshirt',
      title: 'Essential T-Shirt',
      price: '£8.00',
      imageUrl: 'https://i.ibb.co/FkbrBJ9W/Gemini-Generated-Image-i292hli292hli292.png',
      images: [
        'https://i.ibb.co/FkbrBJ9W/Gemini-Generated-Image-i292hli292hli292.png',
        'https://i.ibb.co/MDMRD57D/Gemini-Generated-Image-5z5rnr5z5rnr5z5r.png',
      ],
      colorImages: {
        'Pink': 'https://i.ibb.co/FkbrBJ9W/Gemini-Generated-Image-i292hli292hli292.png',
        'Red': 'https://i.ibb.co/MDMRD57D/Gemini-Generated-Image-5z5rnr5z5rnr5z5r.png',
      },
      description: 'Essential cotton t-shirt',
    ),
    ...List.generate(
      10,
      (i) => Product(
        id: 'tshirt-placeholder-${i + 2}',
        title: 'Placeholder Product ${i + 2}',
        price: '',
        imageUrl: '',
        description: 'Placeholder product for pagination/testing',
      ),
    ),
  ],
  
  'hoodies': [
    Product(
      id: 'sweater',
      title: 'Sweater',
      price: '£12.00',
      imageUrl: 'https://i.ibb.co/NnWnhtkG/Gemini-Generated-Image-fas651fas651fas6-1.png',
      images: [
        'https://i.ibb.co/NnWnhtkG/Gemini-Generated-Image-fas651fas651fas6-1.png',
        'https://i.ibb.co/ZpMtvtyp/Gemini-Generated-Image-fq753kfq753kfq75-1.png',
      ],
      colorImages: {
        'Blue': 'https://i.ibb.co/NnWnhtkG/Gemini-Generated-Image-fas651fas651fas6-1.png',
        'Grey': 'https://i.ibb.co/ZpMtvtyp/Gemini-Generated-Image-fq753kfq753kfq75-1.png',
      },
      description: 'University of Portsmouth sweater',
    ),
    Product(
      id: 'essentials-hoodie-hoodies',
      title: 'Essentials Hoodie',
      price: '£15.00',
      imageUrl: 'https://i.ibb.co/PvT70NBg/Gemini-Generated-Image-r56f26r56f26r56f.png',
      images: [
        'https://i.ibb.co/PvT70NBg/Gemini-Generated-Image-r56f26r56f26r56f.png',
        'https://i.ibb.co/5WTzvphh/Gemini-Generated-Image-rkkmcrkkmcrkkmcr.png',
      ],
      colorImages: {
        'Blue': 'https://i.ibb.co/PvT70NBg/Gemini-Generated-Image-r56f26r56f26r56f.png',
        'Grey': 'https://i.ibb.co/5WTzvphh/Gemini-Generated-Image-rkkmcrkkmcrkkmcr.png',
      },
      description: 'University of Portsmouth essentials hoodie',
    ),
    Product(
      id: 'joggers',
      title: 'Joggers',
      price: '£17.00',
      imageUrl: 'https://i.ibb.co/cS391pLY/Gemini-Generated-Image-vzzy2jvzzy2jvzzy.png',
      images: [
        'https://i.ibb.co/cS391pLY/Gemini-Generated-Image-vzzy2jvzzy2jvzzy.png',
        'https://i.ibb.co/pjVDgZ2q/Gemini-Generated-Image-4c8m174c8m174c8m.png',
      ],
      colorImages: {
        'Grey': 'https://i.ibb.co/cS391pLY/Gemini-Generated-Image-vzzy2jvzzy2jvzzy.png',
        'Blue': 'https://i.ibb.co/pjVDgZ2q/Gemini-Generated-Image-4c8m174c8m174c8m.png',
      },
      description: 'University of Portsmouth branded joggers',
    ),
    ...List.generate(
      11,
      (i) => Product(
        id: 'hoodie-placeholder-${i + 1}',
        title: 'Placeholder Product ${i + 1}',
        price: '',
        imageUrl: '',
        description: 'Placeholder product for pagination/testing',
      ),
    ),
  ],
  
  'winter': [
    Product(
      id: 'christmas-bobble-hat',
      title: 'Christmas Bobble Hat',
      price: '£5.00',
      imageUrl: 'https://i.ibb.co/PzgdHKyQ/Gemini-Generated-Image-c0rokpc0rokpc0ro.png',
      description: 'University of Portsmouth Christmas bobble hat',
    ),
    ...List.generate(
      11,
      (i) => Product(
        id: 'winter-placeholder-${i + 1}',
        title: 'Placeholder Product ${i + 1}',
        price: '',
        imageUrl: '',
        description: 'Placeholder product for pagination/testing',
      ),
    ),
  ],
  
  'graduation': [
    Product(
      id: 'graduation-crest-hoodie',
      title: 'Graduation Crest Hoodie',
      price: '£15.00',
      imageUrl: 'https://i.ibb.co/35YDmDfc/Gemini-Generated-Image-9jtlq49jtlq49jtl.png',
      images: [
        'https://i.ibb.co/35YDmDfc/Gemini-Generated-Image-9jtlq49jtlq49jtl.png',
      ],
      colorImages: {
        'Blue': 'https://i.ibb.co/35YDmDfc/Gemini-Generated-Image-9jtlq49jtlq49jtl.png',
      },
      description: 'University of Portsmouth graduation crest hoodie',
    ),
    ...List.generate(
      11,
      (i) => Product(
        id: 'graduation-placeholder-${i + 1}',
        title: 'Placeholder Product ${i + 1}',
        price: '',
        imageUrl: '',
        description: 'Placeholder product for pagination/testing',
      ),
    ),
  ],
  
  'accessories': [
    Product(
      id: 'lanyard',
      title: 'Lanyard',
      price: '£3.00',
      imageUrl: 'https://i.ibb.co/hFvPNsVc/Gemini-Generated-Image-b59do8b59do8b59d.png',
      description: 'University of Portsmouth lanyard',
    ),
    Product(
      id: 'baseball-cap',
      title: 'Baseball Cap',
      price: '£6.50',
      imageUrl: 'https://i.ibb.co/Z1G62QZ0/Gemini-Generated-Image-qndkc3qndkc3qndk.png',
      description: 'University of Portsmouth baseball cap',
    ),
    Product(
      id: 'portsmouth-city-keyring-acc',
      title: 'Portsmouth City Keyring',
      price: '£3.75',
      imageUrl: 'https://i.ibb.co/Xf1BWfT5/Gemini-Generated-Image-gnfn46gnfn46gnfn.png',
      description: 'Portsmouth City Keyring featuring artwork by Julia Gash.',
    ),
    Product(
      id: 'portsmouth-city-bookmark-acc',
      title: 'Portsmouth City Bookmark',
      price: '£3.00',
      imageUrl: 'https://i.ibb.co/k2mnMK8J/Gemini-Generated-Image-gahe2agahe2agahe.png',
      description: 'Add a touch of local charm to your reading with this beautifully illustrated Portsmouth City Bookmark, designed by British artist Julia Gash.',
    ),
    Product(
      id: 'portsmouth-city-magnet-acc',
      title: 'Portsmouth City Magnet',
      price: '£4.50',
      imageUrl: 'https://i.ibb.co/FqDWKD2M/Gemini-Generated-Image-zfw8ogzfw8ogzfw8.png',
      description: 'Bring a bit of Portsmouth pride to your fridge, locker, or pinboard with our eye-catching Portsmouth City Magnet, featuring the artwork of renowned illustrator Julia Gash.',
    ),
    Product(
      id: 'portsmouth-city-postcard-acc',
      title: 'Portsmouth City Postcard',
      price: '£1.00',
      imageUrl: 'https://i.ibb.co/jkYYTZhs/Gemini-Generated-Image-aljdv5aljdv5aljd.png',
      description: 'Celebrate the charm of our coastal city with this beautifully illustrated Portsmouth City Postcard, designed by British artist Julia Gash.',
    ),
    Product(
      id: 'scarf',
      title: 'Scarf',
      price: '£7.50',
      imageUrl: 'https://i.ibb.co/ycFDh1xx/Gemini-Generated-Image-1zcmm91zcmm91zcm.png',
      images: [
        'https://i.ibb.co/ycFDh1xx/Gemini-Generated-Image-1zcmm91zcmm91zcm.png',
        'https://i.ibb.co/Zzzk02VQ/Gemini-Generated-Image-ou6zy1ou6zy1ou6z.png',
      ],
      colorImages: {
        'Blue': 'https://i.ibb.co/ycFDh1xx/Gemini-Generated-Image-1zcmm91zcmm91zcm.png',
        'Grey': 'https://i.ibb.co/Zzzk02VQ/Gemini-Generated-Image-ou6zy1ou6zy1ou6z.png',
      },
      description: 'University of Portsmouth scarf',
    ),
  ],
  
  'sale': [
    Product(
      id: 'beanie',
      title: 'Beanie',
      price: '£5.00',
      originalPrice: '£6.50',
      imageUrl: 'https://i.ibb.co/Z6xbSGbF/Gemini-Generated-Image-baslm7baslm7basl.png',
      description: 'University of Portsmouth beanie',
    ),
  ],
};
