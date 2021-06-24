import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/data/models/responses/tienda/pedidos_response.dart';
import 'package:globalpaq_app/app/data/repositories/remote/tienda_repository.dart';

class VerPedidosController extends GetxController {
  final TiendaRepository _tiendaRepository = Get.find<TiendaRepository>();

  //datos

  ScrollController _scrollController = new ScrollController();
  ScrollController get scrollController => _scrollController;

  List<PedidosResponse> _pedidos = [];
  List<PedidosResponse> get pedidos => _pedidos;

  int _pagina = 1;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  @override
  void onReady() {
    super.onReady();
    this.getPedidos();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {

            print("🎃 ${_scrollController.position.pixels} - ${ _scrollController.position.maxScrollExtent}");

        _pagina += 1;
        getPedidos();
        // Timer(Duration(milliseconds: 1), () => _scrollController.jumpTo(_scrollController.initialScrollOffset));
        Timer(
            Duration(milliseconds: 1),
            () => _scrollController.animateTo(
                _scrollController.initialScrollOffset,
                curve: Curves.linear,
                duration: Duration(milliseconds: 500)));
      }
    });
  }

  Future<void> getPedidos() async {
    try {
      _isLoading = true;
      update();
      List<PedidosResponse> res =
          await _tiendaRepository.getPedidos("10", "$_pagina");

      this._pedidos = res;
      await Future.delayed(Duration(milliseconds: 1000));
      _isLoading = false;
      update();
    } catch (e) {
      print(e);
    }
  }
}
