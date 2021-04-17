import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          MyListView('https://miro.medium.com/max/2914/1*F5ERahcXTZh0kOuSPaZnOA.jpeg','The Fate of the Furious','6.7'),
          MyListView('https://m.media-amazon.com/images/I/51lvxZDKppL.jpg','Avengers: End Game','8.4'),
          MyListView('https://m.media-amazon.com/images/M/MV5BYzE3ODhiNzAtOWY4MS00NTdiLThmNDctNDM4NjRiNGFmYjI1XkEyXkFqcGdeQXVyMTI2ODM1ODUw._V1_UY1200_CR165,0,630,1200_AL_.jpg','Tom and Jerry','7.3'),
          MyListView('https://static1.colliderimages.com/wordpress/wp-content/uploads/2021/03/Godzilla-vs-Kong-Poster-2.jpg?q=50&fit=crop&w=1200&dpr=1.5','Godzilla Vs. Kong','7.8'),
         
        ],
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  final String url,title,rating;
  MyListView(this.url,this.title,this.rating);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150,
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  '$url',
                  height: 180.0,
                  width: 160.0,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10,),
              Text("$title",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 13),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text('IMDb',style: TextStyle(color: Colors.black,backgroundColor:Colors.amber,fontWeight:FontWeight.w900,fontSize: 12 ),),
                    ),
                    Text("$rating/10",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),),
                ],
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
