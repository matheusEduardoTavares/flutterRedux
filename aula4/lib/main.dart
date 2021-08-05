import 'package:aula4/redux/products_state/products_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'redux/app_actions.dart';
import 'redux/app_state.dart';
import 'redux/app_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: appStore,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'title'),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  String _generateString() {
    return DateTime.now().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          StoreConnector<AppState, List<String>>(
            converter: (store) => store.state.productsState.products,
            builder: (context, products) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Center(
                  child: Text(
                    'Products Count = ${products.length}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                    ),
                  ),
                ),
              );
            }
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StoreConnector<AppState, List<String>>(
              converter: (store) => store.state.productsState.products,
              builder: (context, products){
                if (products.isEmpty) {
                  return const Center(
                    child: const Text('List is empty'),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (_, index) => Dismissible(
                      key: GlobalKey(debugLabel: '$hashCode-$index'), 
                      child: ListTile(
                        title: Text(products[index]),
                        subtitle: Text('Size: ${products[index].length}'),
                      ),
                      background: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                      ),
                      onDismissed: (_) {
                        StoreProvider.of<AppState>(context)
                          .dispatch(RemoveProductsAction(
                            product: products[index],
                          ));
                      },
                    ),
                  ),
                );
              } 
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                StoreProvider.of<AppState>(context)
                  .dispatch(DecrementCounter());
              },
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
            const SizedBox(width: 32),
            FloatingActionButton(
              onPressed: () {
                final product = _generateString();
                StoreProvider.of<AppState>(context)
                  .dispatch(AddProductsAction(
                    product,
                  ));
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ],
        ),
      )
    );
  }
}
