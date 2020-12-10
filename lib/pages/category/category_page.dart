import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_quickstart/provider/counter.dart';

class CategoryPage extends StatefulWidget {
  _CategoryPageSate createState() => _CategoryPageSate();
}

class _CategoryPageSate extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CATEGORY')),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            child: EgInput(),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Column(
              children: [
                EgProviderCount(),
                EgButtonGroup(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class EgButtonGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 4.0),
            child: RaisedButton(
              onPressed: () => context.read<Counter>().decrement(),
              child: Text('decrement'),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 4.0),
            child: RaisedButton(
              onPressed: () => context.read<Counter>().increment(),
              child: Text('increment'),
            ),
          ),
        ),
      ],
    );
  }
}

class EgInput extends StatelessWidget {
  final TextEditingController inputContrtoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: inputContrtoller,
          autofocus: false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            labelText: 'category',
            helperText: 'please enter search content',
          ),
        ),
        RaisedButton(
          onPressed: () {
            print(inputContrtoller.text);
          },
          child: Text('get input value'),
        )
      ],
    );
  }
}

class EgProviderCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<Counter>().count}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}