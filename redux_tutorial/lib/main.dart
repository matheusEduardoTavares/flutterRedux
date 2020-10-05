import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'redux/app_actions.dart';
import 'redux/app_state.dart';
import 'redux/app_store.dart';


//Primeiramente deve-se adicionar os pacotes flutter_redux
//e redux.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Precisamos do pacote flutter_redux
    //Assim retornamos o StoreProvider que tem como 
    //parâmetros o store
    return StoreProvider(
      store: appStore,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      )
    );
    //Dessa forma qualquer Widget dentro do MaterialApp
    //terá acesso ao estado da aplicação devido ao fato
    //do MaterialApp ser child do StoreProvider.
  }
}

//Com tudo isso conseguimos converter nosso widget de
//StatefulWidget para StatelessWidget que não é 
//reconstruído toda vez que clicamos no botão increment, 
//ou seja quando clicamos no botão para incrementar só é
//reconstruído um único widget, o de Text que é o widget que
//apresenta a informação com o estado alterado, e com isso 
//podemos oferecer essa informação do contador em qualquer 
//local da nossa app e até mesmo por exemplo colocar no 
//topo da nossa página.
class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          StoreConnector<AppState, int>(
            converter: (store) => store.state.counter,
            builder: (context, counter) {
              return Text(
                counter.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            }
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            //O StoreConnector é uma classe que recebe 2
            //parâmetros: o estado e um view model que será
            //retornado para nossa função. Esse view model
            //é o tipo de dado que será retornado pelo 
            //converter que veremos logo mais o que é.
            //Passamos como 
            //parâmetro o converter que é a função que 
            //converte o estado da aplicação retornando
            //as informações que precisamos, então para o 
            //converter passamos uma função que recebe o 
            //store e retorna o que queremos acessar
            //daquele estado, que no caso é o counter.
            //Outro atributo será o builder que recebe uma
            //função com 2 parâmetros o contexto e o atributo
            //que queremos acessar, no caso o counter, e 
            //no corpo da função retornamos o widget que
            //queremos tendo acesso ao valor desse segundo
            //parâmetro que é o valor da variável que
            //acessamos.
            StoreConnector<AppState, int>(
              converter: (store) => store.state.counter,
              builder: (context, counter){
                return Text(
                  counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              } 
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              //Podemos ter vários estados que queremos acessar
              //então no StoreProvider.of sempre especificamos
              //qual estado estamos querendo acessar naquele
              //momento e passamos o contexto como parâmetro.
              //A partir disso chamamos a função dispatch que
              //serve para disparar uma ação.
              StoreProvider.of<AppState>(context)
                .dispatch(DecrementCounter());
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          const SizedBox(width: 32),
          FloatingActionButton(
            onPressed: () {
              StoreProvider.of<AppState>(context)
                .dispatch(IncrementCounter());
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      )
    );
  }
}
