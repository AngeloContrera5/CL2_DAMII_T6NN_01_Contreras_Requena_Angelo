// ignore_for_file: file_names
//import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuOffice extends StatefulWidget {
  MenuOffice({Key? key, required this.tittle}) : super(key: key);
  final String tittle;
  String nombres = "";
  String pedido = "";
  String precio = "";
  String cantidad = "";
  double total = 0;
  double descuento = 0;
  double totalPagar = 0;
  double delivery = 20.0;

  @override
  _MenuOfficeState createState() => _MenuOfficeState();
}

class _MenuOfficeState extends State<MenuOffice> {
  final _txtNombres = TextEditingController();
  final _txtPedido = TextEditingController();
  final _txtPrecio = TextEditingController();
  final _txtCantidad = TextEditingController();
  final _txtTotalPagar = TextEditingController();
  bool isDelivery = false;

  void mostrarResultados() {
    setState(() {
      widget.total =
          double.parse(_txtPrecio.text) * int.parse(_txtCantidad.text);

      if (widget.total > 500) {
        widget.descuento = widget.total * 0.05;
      } else {
        widget.descuento = 0.0;
      }
      if (isDelivery == false) {
        widget.delivery = 0.0;
        widget.totalPagar = (widget.total + widget.delivery) - widget.descuento;
      } else {
        widget.delivery = 20.0;
        widget.totalPagar = (widget.total + widget.delivery) - widget.descuento;
      }

      _txtTotalPagar.text = widget.totalPagar.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tittle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const Text(
            "Bienvenido por favor complete sus datos para completar sus pedidos",
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _txtNombres,
              decoration: const InputDecoration(
                hintText: "Ingresa Nombres",
                labelText: "Nombre",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _txtPedido,
              decoration: const InputDecoration(
                hintText: "Ingresa Pedido",
                labelText: "Pedido",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _txtPrecio,
              decoration: const InputDecoration(
                hintText: "Ingresa Precio",
                labelText: "Precio",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _txtCantidad,
              decoration: const InputDecoration(
                hintText: "Ingresa Cantidad",
                labelText: "Cantidad",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Total : " + widget.total.toString() + "  "),
              Text("Descuento : " + widget.descuento.toString()),
            ],
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              "Delivery:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Switch(
            value: isDelivery,
            onChanged: (value) {
              setState(() {
                isDelivery = value;
              });
            },
            activeTrackColor: Colors.greenAccent[100],
            activeColor: Colors.greenAccent[400],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _txtTotalPagar,
              decoration: const InputDecoration(
                hintText: "Ingresa Total a Pagar",
                labelText: "Total a Pagar",
              ),
            ),
          ),
          RaisedButton(
            onPressed: mostrarResultados,
            child: const Text("Calcular"),
            color: Colors.indigo[200],
          )
        ],
      ),
    );
  }
}
