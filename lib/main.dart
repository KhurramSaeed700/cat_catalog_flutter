import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        buttonColor: Colors.deepPurple,
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: const MyHomePage(),
    );
  }
}

class Kitten {
  //constructor
  const Kitten({this.name, this.description, this.age, this.imageUrl});

  final String name;
  final String description;
  final int age;
  final String imageUrl;
}

final String server =
    defaultTargetPlatform == TargetPlatform.android ? '10.0.2.2' : 'localhost';

final List<Kitten> _kittens = <Kitten>[
  Kitten(
    name: 'Mittens',
    description: 'this is a tipple coat cat and good pet highly recommend',
    age: 12,
    imageUrl:
        'https://images2.minutemediacdn.com/image/upload/c_crop,h_1193,w_2121,x_0,y_64/v1565279671/shape/mentalfloss/578211-gettyimages-542930526.jpg?itok=zmmJgd_3',
  ),
  Kitten(
    name: 'Fluffy',
    description: 'this is a tipple coat cat and good pet highly recommend',
    age: 15,
    imageUrl:
        'https://cdn.britannica.com/24/212324-050-076731DA/Persian-cat-sleeping.jpg',
  ),
  Kitten(
    name: 'Babri',
    description: 'this is a tipple coat cat and good pet highly recommend',
    age: 20,
    imageUrl:
        'https://i.natgeofe.com/n/9135ca87-0115-4a22-8caf-d1bdef97a814/75552.jpg?w=636&h=424',
  ),
  Kitten(
    name: 'Kaloo',
    description: 'this is a tipple coat cat and good pet highly recommend',
    age: 10,
    imageUrl:
        'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/cat_relaxing_on_patio_other/1800x1200_cat_relaxing_on_patio_other.jpg',
  ),
  Kitten(
    name: 'Shera',
    description: 'this is a tipple coat cat and good pet highly recommend',
    age: 6,
    imageUrl:
        'https://www.humanesociety.org/sites/default/files/styles/1240x698/public/2020-07/kitten-510651.jpg?h=f54c7448&itok=ZhplzyJ9',
  ),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  Widget _dialogBuilder(BuildContext context, Kitten kitten) {
    ThemeData localTheme = Theme.of(context);
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Image.network(
          kitten.imageUrl,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                kitten.name,
                style: localTheme.textTheme.display1,
              ),
              Text(
                '${kitten.age} months old',
                style: localTheme.textTheme.subhead
                    .copyWith(fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                kitten.description,
                style: localTheme.textTheme.body1,
              ),
              SizedBox(
                height: 12.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Add to Favorite'),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: const Text('Adopt'),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, _kittens[index])),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          _kittens[index].name,
          style: Theme.of(context).textTheme.headline,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available cats'),
      ),
      body: ListView.builder(
        itemCount: _kittens.length,
        itemExtent: 60.0,
        itemBuilder: _listItemBuilder,
      ),
    );
  }
}
