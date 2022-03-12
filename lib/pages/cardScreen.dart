import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyStateFulWidget2 extends StatefulWidget {
 const MyStateFulWidget2({Key? key}) : super(key: key);

  @override
  State<MyStateFulWidget2> createState() => _MyStateFulWidgetState2();
}

class _MyStateFulWidgetState2 extends State<MyStateFulWidget2> {
  late TextEditingController _controller; //investigar el late

  
  var maskFormatter = MaskTextInputFormatter(mask: '####-####-####-####', filter: { "#": RegExp(r'[0-9]') });
  var maskDate = MaskTextInputFormatter(mask: '##/##');

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
        
        child: Form(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[

               Container(
                width: 400,
                //height: 500,
                child: Image.asset('assets/image/tarjeta.png',
                      height: 400,
                      ),
              ),
              inputNombre(_controller),
              const SizedBox(height: 10),
              inputCard(maskFormatter),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  inputDate(),
                 const SizedBox(width: 5.0),
                 inputDvv()

                ],
              ),
            const SizedBox(height: 10),
             ElevatedButton(
               
               onPressed: ()=>{},
               child: const Text('Pagar'))


            
            ], 
          ),
        ),
      ),
    );
  }
}

Widget inputNombre(_controller){
  return Container( //permite agregar unas decoraciones
  padding: const EdgeInsets.symmetric(horizontal: 20.0), //interno
  margin: const EdgeInsets.symmetric(horizontal: 30.0), //externo
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.blue, width: 3.0)
    ),

    child: TextFormField(
       
       autofocus: true,
       controller: _controller,
        decoration: const InputDecoration(
        border: InputBorder.none,
        
        labelText: 'Nombre',
        hintText: 'Nombre Completo'
        ),

      ),
  );
}

Widget inputCard(maskFormatter) {
  return  Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0), //interno
   margin: const EdgeInsets.symmetric(horizontal: 30.0), //externo
   decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.blue, width: 3.0)
    ),
    child: TextField(
                   keyboardType: TextInputType.number, //numeros en el teclado
                   inputFormatters: [
                     /*FilteringTextInputFormatter.allow(
                       RegExp('[0-9 -]')
                     ),
                     LengthLimitingTextInputFormatter(16)*/
                     maskFormatter
                   ], //reglas
                   decoration: const InputDecoration(
                    //prefixIcon: Icon(Icons.credit_card),
                    labelText: 'Tarjeta',
                    hintText: '1234-1234-1234-1234'
                   ),
                ),
  );
}


Widget inputDvv(){
 return  Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0), //interno
   margin: const EdgeInsets.symmetric(horizontal: 30.0),

    width: 130.0,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.blue, width: 3.0)
    ),
    child: TextField(
                   keyboardType: TextInputType.number, //numeros en el teclado
                   inputFormatters: [
                     MaskTextInputFormatter(mask: "###"),
                   ], 
                   decoration: const InputDecoration(
                    //prefixIcon: Icon(Icons.credit_card),
                    border: InputBorder.none,
                    labelText: 'Dvv',
                    hintText: '123'
                   ),
                ),
 );


}


Widget inputDate(){
 return  Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0), //interno
   margin: const EdgeInsets.symmetric(horizontal: 30.0),

    width: 150.0,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.blue, width: 3.0)
    ),
    child: TextField(
                   keyboardType: TextInputType.number, //numeros en el teclado
                   inputFormatters: [
                     MaskTextInputFormatter(mask: "##/##"),
                   ], 
                   decoration: const InputDecoration(
                    //prefixIcon: Icon(Icons.credit_card),
                    border: InputBorder.none,
                    labelText: 'Expiración',
                    hintText: '10/25'
                   ),
                ),
 );


}