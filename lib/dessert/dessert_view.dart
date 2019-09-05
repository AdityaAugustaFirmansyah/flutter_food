import 'package:flutter/material.dart';
import 'dart:core';

class DessertPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DessertPageState();
  }
}
class DessertPageState extends State<DessertPage>{
  List<String> foodsTitle = [
    'Ice Cream',
    'Tomato Juice',
    'Biscuit',
    'ice cream vanilla',
    'chocolate',
    'pudding',
    'cupcake',
    'pie',
    'crumble',
    'es buah'
  ];

  List<String> foodsImage = [
    'https://upload.wikimedia.org/wikipedia/commons/3/31/Ice_Cream_dessert_02.jpg',
    'https://www.favfamilyrecipes.com/wp-content/uploads/2018/10/Canned-Homemade-Tomato-Juice-2.jpg',
    'https://www.biggerbolderbaking.com/wp-content/uploads/2017/02/Digestive-Biscuits-copy-1.jpg',
    'https://www.davidlebovitz.com/wp-content/uploads/2009/02/Vanilla-ice-cream-recipe-cherry-compote-4.jpg',
    'https://i0.wp.com/thebigmansworld.com/wp-content/uploads/2019/09/keto-chocolate-cookies2.jpg?resize=640%2C960&ssl=1',
    'https://thepioneerwoman.com/wp-content/uploads/2016/04/how-to-make-chocolate-pudding-00a.jpg?resize=780%2C521',
    'https://cdn.sallysbakingaddiction.com/wp-content/uploads/2018/09/chai-latte-cupcakes.jpg',
    'https://images-gmi-pmc.edge-generalmills.com/173da066-c6b4-45dd-9b28-0d459cf6f169.jpg',
    'https://www.telegraph.co.uk/content/dam/food-and-drink/2018/11/22/TELEMMGLPICT000181554736_trans_NvBQzQNjv4BqG6-sc6dEAQCMWCxZ3jRHJNrGyWDFPbRfuA-jfyAMjqA.jpeg?imwidth=450',
    'https://cdn0-production-images-kly.akamaized.net/5xaWFid180f35-2GmAQgFpXc61o=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2238571/original/012766200_1528175056-es_buah.jpg'
  ];

  List<String> foodRecipes = [
    "2 scht susu bubuk (aku pake dancow)\n3 scht SKM putih \n4 sdm tepung maizena \n4 1/2 gelas air \n14 sdm gula pasir \nSantan kental instan siap pakai ukuran 65ml (bisa di skip) \n1 sdm SP yang sudah di tim lalu diamkan sampai menggumpal kembali \n4 scht pop ice (aku pake rasa coklat semua) ssuai selera \nSejumput garam \n",
    "5 buah tomat\n1 sdm skm putih\n1 gelas air matang\n",
    "1 kuning telur\n130 gr tepung gula\n100 ml susu cair full cream\n1/2 sdt soda kue\n1 sdt vanilie bubuk\n60 gr margarin\nSejumput garam halus\n1/2 sdt baking powdeŕ\n200 gr terigu\n200 gr tapioka\n",
    "500 ml susu uht\n2 saset dancow\n2 sdm tepung maizena,larutkan dalam setengah gelas air\n1 saset skm\n2 sdm gula pasir\n1/2 sdm ovalet\nSejumput garam\n",
    "100 gr butter\n100 gr swerve\n1 butir telur\n30 ml whipping cream\n5-10 tetes sucralosa cair (tergantung selera)\n",
    "1 kaleng SKM (me. Carnation uk besar)\n8 kaleng Air (dari kaleng susu)\n1 bungkus Nutrijell Plain\n7 sdm Gula\n1 sdt Garam\n3 sdm Maizena\nPerasa Makanan \n",
    "2 butir telur ayam\n6 sdm tepung terigu\n6 sdm margarin butter\n2 sachet skm dicampur 6 sdm air\n1 sdt essense vanila\n1 sdt soda kue\n6 sdm peres gula pasir\nWhipped cream\nPewarna merah muda,kuning,biru\n",
    "8 buah apel malang kupas n potong kecil\n7 sdm gula pasir\n6 sdm gula palem\n1 sdt kayu manis\n3 sdm kismis\n2 sdm butter\n",
    "300 gr Tepung Terigu\n200 gr butter (me Anchor)\n100 gr gula pasir\n",
    "Alpukat\nSemangk\nsecukupnya Sagu mutiara\nsecukupnya Nangka\nsecukupnya Es batu\nsecukupnya Air gula\n1 bungkus skm\n"
  ];

  @override
  Widget build(BuildContext context) {
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
    return FoodDetailState(title: title,image: image,desc: desc,hero: hero);
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