import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyStateFulWidget extends StatefulWidget {
 const MyStateFulWidget({Key? key}) : super(key: key);

  @override
  State<MyStateFulWidget> createState() => _MyStateFulWidgetState();
}

class _MyStateFulWidgetState extends State<MyStateFulWidget> {
  late TextEditingController _controller; //investigar el late

  bool _isChecked = false;

  @override //se pone el override para sobre escribir
  void initState() {
    // TODO: implement initState
    super.initState();
    //objeti       clase
    _controller = TextEditingController(); //instancia del metodo controller 
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            //padding: const EdgeInsets.all(40.0),
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              //como poner paddind
              TextField(
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                controller: _controller,
                decoration: const InputDecoration(
                  //icon: Icon(Icons.contact_mail),
                  prefixIcon: Icon(Icons.contact_mail),
                  labelText: 'Correo',
                  hintText: 'micorreo@correo.com'
                 ),

              ),
              const SizedBox(height: 20.0),
              const TextField(
                obscureText: true,
                 decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Contraseña',
                 ),
              ),
              const SizedBox(height: 20.0),
               TextField(
                 keyboardType: TextInputType.number, //numeros en el teclado
                 inputFormatters: [
                   FilteringTextInputFormatter.allow(
                     RegExp('[0-9 -]')
                   ),
                   LengthLimitingTextInputFormatter(16)
                 ], //reglas
                 decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.credit_card),
                  labelText: 'Tarjeta',
                  hintText: '1234-1234-1234-1234'
                 ),
              ),
              const SizedBox(height: 20.0),
              
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Primero'),
                  value: _isChecked, 
                  onChanged: (bool? value) {
                    setState(() { //cambia el estado de la viriable
                      _isChecked = value!;
                    });
                   },

                ),
              const SizedBox(height: 10.0),
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Segundo'),
                  value: _isChecked, 
                  onChanged: (bool? value) {
                    setState(() { //cambia el estado de la viriable
                      _isChecked = value!;
                    });
                   },

                ),
              const SizedBox(height: 10.0),
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Tercero'),
                  value: _isChecked, 
                  onChanged: (bool? value) {
                    setState(() { //cambia el estado de la viriable
                      _isChecked = value!;
                    });
                   },

                )    

            ], 
          ),
        ),
        ),
    );
  }
}

/*
 onSubmitted: (String value ) async {
              await showDialog<void>(
                    context: context, 
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: const Text('Prueba diálogo'),
                        content: Text('Ha escrito "$value", de longitud: ${value.characters.length}'),
                        actions:<Widget> [
                          TextButton(
                            onPressed: () =>Navigator.pop(context), 
                            child: const Text('OK'))
                        ],
                      );
                    }
                    
              );
            },




*/