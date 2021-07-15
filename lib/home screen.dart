import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  final _unitController = TextEditingController();
  var _result = '';
  var _isKM=false;
  var _uniteLabel='Convert from KM to MM';
  void convertUnit() {
    if (_unitController.text.isEmpty) {
      //i can use _unitconverter.text or value.
      return;
    }
    setState(() {
      _result = '${int.parse(_unitController.text) / 1000000}';
    });
  }
void swapUnits(){
    if(_isKM){
      setState(() {
        _uniteLabel='Convert from MM to KM';
        _isKM=false;
      });
    }
    else{
      setState(() {
        _uniteLabel='Convert from KM to MM';
        _isKM=true;
      });

    }
}        //method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Unite Converter App',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children:[
                      Text(_uniteLabel,
                    style: TextStyle(fontSize: 20, color: Colors.grey)),
                      TextButton.icon(onPressed: swapUnits, icon:Icon (Icons.swap_calls), label:Text('Swap'))
                ]
                )
              ),
             Padding(
                padding: const EdgeInsets.all(30),
                child: TextField(
                  controller: _unitController,
                  keyboardType: TextInputType.number,
                  maxLength: 20,
                  decoration: InputDecoration(
                      labelText: 'Unit in mm',
                      labelStyle: TextStyle(fontSize: 25),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onSubmitted: (value) {
                    convertUnit();
                  },
                ),
              ),

              SizedBox(
                height: 20,
              ),
              ElevatedButton(

                  child: Text(
                    'Convert',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                style: ElevatedButton.styleFrom(
                  primary:  Theme.of(context).primaryColor
                ),


                  onPressed: () {
                    convertUnit();

                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text('Result :  '),
                    Text(_result),
                  ]
              ),


              TextButton(onPressed: (){
                  setState(() {
                    _unitController.text='';
                    _result='';
                  });
                },
                    child:Text ('Clear',
                    style: TextStyle(fontSize: 20, color: Colors.orange),
                  )
                )



          ],
          ),
        ),
      ),
    );
  }
}
