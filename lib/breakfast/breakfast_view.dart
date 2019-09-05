import 'dart:core';
import 'package:flutter/material.dart';

class BreakFastPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BreakFastPageState();
  }

}

class BreakFastPageState extends State<BreakFastPage>{
  List<String> foodsTitle = [
    'burger',
    'fried chicken',
    'instant noodle',
    'chicken wings',
    'donut',
    'sunny side up egg',
    'french fries',
    'pizza',
    'potato chip',
    'steak'
  ];

  List<String> foodsImage = [
    'https://www.seriouseats.com/recipes/images/2015/07/20150702-sous-vide-hamburger-anova-primary-1500x1125.jpg',
    'https://www.thespruceeats.com/thmb/4QUIYqDCxzubLJmYFDwgr9GgBBk=/1333x1000/smart/filters:no_upscale()/terris-crispy-fried-chicken-legs-3056879-10_preview-5b05ec40a474be00362260d7.jpeg',
    'https://i.ytimg.com/vi/riO5p_Qi8Vc/maxresdefault.jpg',
    'https://cafedelites.com/wp-content/uploads/2017/08/Crispy-Buffalo-Chicken-WIngs-IMAGE-5.jpg',
    'https://cookingwithkarli.com/wp-content/uploads/2019/03/donuts-v-8.jpg',
    'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimg1.cookinglight.timeinc.net%2Fsites%2Fdefault%2Ffiles%2Fstyles%2Fmedium_2x%2Fpublic%2Fimage%2F2017%2F01%2Fmain%2Fpristine-sunny-side-up-eggs.jpg%3Fitok%3Dm7JG2Y8j&w=450&c=sc&poi=face&q=85',
    'https://www.seriouseats.com/2018/04/20180309-french-fries-vicky-wasik-15-1500x1125.jpg',
    'https://cdn.apartmenttherapy.info/image/fetch/f_auto,q_auto:eco/https%3A%2F%2Fstorage.googleapis.com%2Fgen-atmedia%2F3%2F2018%2F03%2F55cd28cae8ee78fe1e52ab1adc9eafff24c9af92.jpeg',
    'https://upload.wikimedia.org/wikipedia/commons/6/69/Potato-Chips.jpg',
    'https://www.jessicagavin.com/wp-content/uploads/2018/06/how-to-reverse-sear-a-steak-11.jpg'
  ];

  List<String> foodRecipes = [
    "Bahan yang dibutuhkan roti burger siap pakai daun selada 1 buah timun dan tomat, iris tipis Mayones secukupnya Saus tomat dan sambal secukupnya Bahan patty ayam:100 gr ayam giling1/2 buah bawang bombay, cincang halus2 siung bawang putih, cincang halus50 gr tepung roti1 butir telur2 sendok makan saus tiram2 sendok makan saus tomatgaram dan merica bubuk secukupnya",
    "12 pcs sayap ayam\n 1/8 sdt lada hitam\n1/4 sdt lada putih\n 1/4 sdt bubuk garlic \n 1 sdt garam (aku pake himalayan salt)\n1/2 sdt gula\n1 sdm soy sauce\n1 sdt minyak wijen\n1 butir telur\n1 sdm tepung maizena\n2 sdm tepung terigu",
    "1 bks indomie goreng\n10 biji cabe rawit\n1/2 siung bawang putih\n1 butir telur ayam",
    "12 pcs sayap ayam\n 1/8 sdt lada hitam\n1/4 sdt lada putih\n 1/4 sdt bubuk garlic \n 1 sdt garam (aku pake himalayan salt)\n1/2 sdt gula\n1 sdm soy sauce\n1 sdt minyak wijen\n1 butir telur\n1 sdm tepung maizena\n2 sdm tepung terigu",
    "500 gram tepung terigu protein tinggi\n100 gram gula pasir\n11 gram atau 1 bungkus ragi instan\n1/4 sdt baking powder\n1/2 sdt garam\n2 kuning telur\n100 gram mentega\n250 ml susu cair",
    "2 buah telur ayam\nSecukupnya garam\nSecukupnya lada hitam\nSecukupnya minyak",
    "1 kg kentang\n1 sdm garam\n1 sdm merica\n2 sdm tepung maezena\nMinyak goreng\nsecukupnya Air es",
    "1/4 kg tepung terigu\n1 sdt garam\n1 sdt gula pasir\n1 sdm ragi instan\n1 sdm minyak goreng\n150 ml Air hangat kuku",
    "1 kg kentang\n1 sachet kecil bumbu tabur balado pedas\nSecukupnya minyak goreng\nSecukupnya garam",
    "3 buah tahu putih\n2-3 sdm tepung terigu\n1 butir telur\n2 siung bawang putih\n1/2 bawang bombay\nPenyedap rasa (saya pakai royco)\nsecukupnya Minyak goreng\n5 sdm saus lada hitam (saya pakai saus yang bungkusan)"
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("food list"),
      ),
      body: Center(
          child: GridView.builder(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, position) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    String title = foodsTitle[position];
                    String image = foodsImage[position];
                    String desc = foodRecipes[position];
                    String hero = 'FoodDetail'+position.toString();
                    return FoodDetailPage(title: title,image: image,desc: desc,hero: hero,);
                  }));
                },
                child: Hero(
                  tag: 'FoodDetail'+position.toString(),
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Image.network(
                          foodsImage[position],
                          width: 100.0,
                        ),
                        Text(foodsTitle[position])
                      ],
                    ),
                  ),
                )
              );
            },
            itemCount: foodsTitle.length,
          )),
    );
  }
}


class FoodDetailPage extends StatefulWidget {
  final String title;
  final String image;
  final String desc;
  final String hero;

  FoodDetailPage({ this.title,this.image,this.desc,this.hero});

  @override
  State<StatefulWidget> createState() {
    return FoodDetailState(title: title,image: image,desc: desc, hero: hero);
  }
}

class FoodDetailState extends State<FoodDetailPage> {
  final String title;
  final String image;
  final String desc;
  final String hero;
  FoodDetailState({ this.title,this.image,this.desc,this.hero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Food"),
      ),
      body: Hero(
        tag: hero,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: ClipOval(
                    child: Image.network(
                      image,
                      width: 100.0,
                    )),
                margin: EdgeInsets.all(16),
              ),
              Container(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 24),
                ),
                margin: EdgeInsets.all(16),
              ),
              Text(desc)
            ],
          ),
        ),
      )
    );
  }
}