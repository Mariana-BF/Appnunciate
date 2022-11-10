import 'package:flutter/material.dart';

class Anuncios extends StatefulWidget {
  const Anuncios({Key? key}) : super(key: key);

  @override
  State<Anuncios> createState() => _AnunciosState();
}

class _AnunciosState extends State<Anuncios> {

  //Generamos un var dode almacenaremos los elementos de la lista de productos
  //Se maneja a manera de JSON, ya que así se trabaja en el Firebase
  var lista_anuncios = [
    {
      "name": "Terreno de cultivo en Atlixco (M2)",
      "picture":"images/anuncios/campo.jpg",
      "price" : 1000,
    },
    {
      "name":"Automovil Ford Mustang 2013",
      "picture":"images/anuncios/coche.jpg",
      "price" : 400000,
    },
    {
      "name":"Pastel infantil Shrek",
      "picture":"images/cherk.jpg",
      "price" : 400,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: lista_anuncios.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1) ,
        itemBuilder: (BuildContext context, int index){
          return Anuncio(
            titulo_anuncio: lista_anuncios[index]['name'],
            imagen_anuncio: lista_anuncios[index]['picture'],
            precio_anuncio: lista_anuncios[index]['price'],
          );
        }
        );
  }
}

//Clase para generar el widgets del anuncio
class Anuncio extends StatelessWidget {

  final titulo_anuncio;
  final imagen_anuncio;
  final precio_anuncio;

  Anuncio({
   this.titulo_anuncio,
   this.imagen_anuncio,
   this.precio_anuncio
});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(tag: titulo_anuncio, child: Material(
        child: InkWell(
          onTap: (){},
          child: GridTile(
            footer: Container(
              color: Colors.white70,
              child: ListTile(
                leading: Text(titulo_anuncio,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              title: Text("\$$precio_anuncio", textAlign: TextAlign.right,),
              ),
            ),
            child: Image.asset(imagen_anuncio, fit: BoxFit.cover,),
          ),
        ),
      ),
      ),
    );

  }
}
