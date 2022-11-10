import 'package:flutter/material.dart';

//Importaciones que usamos
import 'package:appnunciate/pages/extentions.dart';
import 'package:carousel_pro/carousel_pro.dart';

//Importaciones de los componentes
import 'package:appnunciate/components/horizontal_listview.dart';
import 'package:appnunciate/components/anuncios.dart';

void main(){
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    )
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  Widget image_carousel = new Container(
    height: 200.0,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/sale.jpg'),
        AssetImage('images/wacha.jpg'),
        AssetImage('images/foco.jpg'),
      ],
      autoplay: true,
      dotSize: 4.0,
      indicatorBgPadding: 8.0,
    ),
  );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: '303f9f'.toColor(),
        centerTitle: true,
        title: Text('Appnunciate'),
        actions: <Widget>[
          new IconButton(onPressed: null, icon: Icon(Icons.search, color: Colors.white))
        ],
      ),

      //Se arma el Drawer
      drawer: new Drawer(
         child: new ListView(
           children: <Widget>[
             //Implementación del header
             new UserAccountsDrawerHeader(
               accountName: Text('Juan Santos'),
                 accountEmail: Text('juansantos@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person , color: Colors.white),
                  ),
                ),

               //configuracion del drawer y de las opciones
               decoration: new BoxDecoration(
                 color: '303f9f'.toColor() ,
               ),
             ),

             //Elementos del Drawer ()
             InkWell(
               onTap: (){},
               child: ListTile(
                 title: Text('Iniciar sesion'),
                 leading: Icon(Icons.login),
               ),
             ),

             InkWell(
                 onTap: (){},
                 child: ListTile(
                   title: Text('Registrarse'),
                   leading: Icon(Icons.person_add),
                 ),
             ),

             Divider(color: '757575'.toColor() ,),

             InkWell(
                 onTap: (){},
                 child: ListTile(
                   title: Text('Preguntas Frecuentes'),
                   leading:Icon(Icons.question_answer_rounded),
                 )
             ),

             InkWell(
                 onTap: (){},
                 child: ListTile(
                   title: Text('Aviso de privacidad'),
                   leading: Icon(Icons.lock),
                 )
             ),

             InkWell(
                 onTap: (){},
                 child: ListTile(
                   title: Text('Salir'),
                   leading: Icon(Icons.exit_to_app),
                 )
             )
           ],
         ),
      ),

      //Cuerpo de la aplicacion
      body: new ListView(
        children: <Widget>[
          image_carousel,

          new Padding(padding: const EdgeInsets.all(8.0),
            child: new Text('Categorias más relevantes' , textAlign: TextAlign.center,),),
          //Lista de las categorias

          //Objeto de la clase Horizontal List
          HorizontalList(),

          //Padding con el titulo de anuncios recientes
          new Padding(padding: const EdgeInsets.all(60.0),
            child: new Text('Anuncios recientes' , textAlign: TextAlign.center,),),

          //Grid View para los anuncios recientes
          Container(
            height: 320.0,
            child: Anuncios(),
          )
          
        ],
      ),

    );
  }
}
