import 'package:flutter/material.dart';
import 'package:little_hero/sub.dart';
import 'package:little_hero/noti.dart';
import 'package:little_hero/gridMain.dart';

class gridMain extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
      ),
      body:
      Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Little Hero',
                style:Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 40,
              width: size.width*0.9,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),    //gridview title
          ),
          SizedBox(height: 20,),
          Expanded(child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,),
                itemBuilder: (context,index) => ItemCard(
                  product: products[index],
                  press: ()=> Navigator.of(context).pushNamed(products[index].url),
            )),
          ))
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key, this.product,this.press,
  }) : super(key: key);

  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(product.title),       //gridview title
      ),
    );
  }
}

class Product{
  final String image, title, url;
  final Color color;
  final id ;
  Product( {this.id,this.image,this.url, this.title, this.color});

}

List<Product> products = [
  Product(
    id:1,
    title:'?????? ??????',
    color: Colors.black,
      url: '/noti'
  ),
  Product(
    id:2,
    title: '?????? ??????',
    color: Colors.black,
    url : '/favorite'
  ),
  Product(
    id:3,
    title: '?????????',
    color: Colors.black,
  ),
  Product(
    id:4,
    title: '???????????????',
    color: Colors.black,
  ),
];