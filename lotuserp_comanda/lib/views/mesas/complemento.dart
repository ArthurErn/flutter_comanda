import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lotuserp_comanda/models/mesas/extrato.state.dart';
import 'package:lotuserp_comanda/models/produtos/complemento.state.dart';
import 'package:lotuserp_comanda/models/produtos/pizza.state.dart';
import 'package:lotuserp_comanda/models/produtos/product.state.dart';
import 'package:lotuserp_comanda/views/content/content_page.dart';
import 'package:lotuserp_comanda/views/mesas/extrato.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:lotuserp_comanda/core/theme/app_colors.dart';
import 'package:lotuserp_comanda/core/theme/app_typography.dart';
import 'package:lotuserp_comanda/models/produtos/category.state.dart';
import 'package:mobx/mobx.dart';

int indiceComplemento;
int indicePizza;
var removePizza;

bool pequena = true;
bool media = false;
bool grande = false;
bool familia = false;

class ComplementoPage extends StatefulWidget {
  @override
  _ComplementoPageState createState() => _ComplementoPageState();
}

class _ComplementoPageState extends State<ComplementoPage>
    with SingleTickerProviderStateMixin {
  Animation<double> transitionAnimation;
  Future loadProducts() async {
    await product.listarProdutos().then((value) => categories.listCategory());
  }

  @override
  void initState() {
    complementos.complementosSelecionados.clear();
    pizza.pizzaSelecionada.clear();
    pizza.listarPizzas().then((value) {
      complementos.listarComplementos();
    });

    complementoController = TextEditingController(text: "");
    super.initState();
  }

  bool isSearch = false;
  NumberFormat formatter = new NumberFormat("000000");
  var complementoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            extrato.postarExtrato().then((value) {
              extrato.listarExtrato();
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            });
          },
          label: Text('Fechar pedido'),
          icon: Icon(Icons.add_circle_outline),
          backgroundColor: Colors.blue[900],
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (isSearch == false)
                      isSearch = true;
                    else
                      isSearch = false;
                  });
                  // ignore: unnecessary_statements
                },
                icon: Icon(Icons.search))
          ],
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            product.product[indiceProduto].produtoPizza == 1
                ? 'Sabores disponíveis'
                : "Adicionar complemento",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          toolbarHeight: 65,
        ),
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    return await Future.value();
                  },
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: isSearch == true
                            ? Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey[600])),
                                height: 45,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextField(
                                    controller: complementoController,
                                    onChanged: (text) {
                                      text = text.toLowerCase();
                                      product.product[indiceProduto]
                                                  .produtoPizza !=
                                              1
                                          ? setState(() {
                                              complementos.complementos =
                                                  ObservableList.of(complementos
                                                      .complementosDisplay
                                                      .where((complement) {
                                                var complementoNome = complement
                                                            .nomeComplemento !=
                                                        null
                                                    ? complement.nomeComplemento
                                                        .toLowerCase()
                                                    : "";
                                                return complementoNome
                                                    .contains(text);
                                              }));
                                            })
                                          : setState(() {
                                              pizza.pizzas = ObservableList.of(
                                                  pizza.pizzaDisplay
                                                      .where((complement) {
                                                var complementoNome = complement
                                                            .produtoDescricao !=
                                                        null
                                                    ? complement
                                                        .produtoDescricao
                                                        .toLowerCase()
                                                    : "";
                                                return complementoNome
                                                    .contains(text);
                                              }));
                                            });
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Pesquisar complemento",
                                        border: InputBorder.none),
                                  ),
                                ),
                              )
                            : Center(),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height:
                              product.product[indiceProduto].produtoPizza != 1
                                  ? 15
                                  : 0,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding:
                              product.product[indiceProduto].produtoPizza != 1
                                  ? const EdgeInsets.only(
                                      left: 24.0,
                                      right: 24,
                                      bottom: 24,
                                      top: 10)
                                  : const EdgeInsets.only(
                                      left: 24.0, right: 24, bottom: 0, top: 5),
                          child: Text(
                              product.product[indiceProduto].produtoPizza != 1
                                  ? 'Complementos disponíveis'
                                  : "",
                              style: AppTypography.sessionTitle(
                                context,
                              )),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Observer(builder: (_) {
                          return Container(
                            height:
                                product.product[indiceProduto].produtoPizza == 1
                                    ? 350
                                    : MediaQuery.of(context).size.height / 3 -
                                        75,
                            child:
                                product.product[indiceProduto].produtoPizza != 1
                                    ? ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        itemCount:
                                            complementos.complementos.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) =>
                                            listComplementos(index, context))
                                    : ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        itemCount: pizza.pizzas.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) =>
                                            listPizza(index, context)),
                          );
                        }),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                            height:
                                product.product[indiceProduto].produtoPizza != 1
                                    ? 1
                                    : 0,
                            color: Colors.grey),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height:
                              product.product[indiceProduto].produtoPizza != 1
                                  ? 15
                                  : 0,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: product.product[indiceProduto].produtoPizza != 1
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 24.0, right: 24, bottom: 24, top: 10),
                                child: Text(
                                    product.product[indiceProduto]
                                                .produtoPizza ==
                                            1
                                        ? 'Sabores selecionados'
                                        : 'Complementos selecionados',
                                    style: AppTypography.sessionTitle(
                                      context,
                                    )),
                              )
                            : Center(),
                      ),
                      SliverToBoxAdapter(
                        child: Observer(builder: (_) {
                          return product.product[indiceProduto].produtoPizza !=
                                  1
                              ? Container(
                                  height: MediaQuery.of(context).size.height /
                                      2,
                                  child: product.product[indiceProduto]
                                              .produtoPizza !=
                                          1
                                      ? ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          itemCount: complementos
                                              .complementosSelecionados.length,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, index) =>
                                              listComplementosSelecionados(
                                                  index, context))
                                      : Center())
                              : Center();
                        }),
                      ),
                      SliverToBoxAdapter(
                        child: product.product[indiceProduto].produtoPizza == 1
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 1,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey,
                                ),
                              )
                            : Center(),
                      ),
                      SliverToBoxAdapter(
                        child: product.product[indiceProduto].produtoPizza == 1
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Escolha o tamanho: "),
                              )
                            : Center(),
                      ),
                      SliverToBoxAdapter(
                        child: product.product[indiceProduto].produtoPizza == 1
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            grande = false;
                                            pequena = true;
                                            media = false;
                                            familia = false;
                                          });
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 92,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            // border: Border.all(
                                            //     //width: 1,
                                            //     color: Colors.grey)
                                          ),
                                          child: Row(
                                            children: [
                                              Center(
                                                  child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text("Pequena"),
                                              )),
                                              pequena == true
                                                  ? Icon(Icons.check)
                                                  : Center(),
                                            ],
                                          ),
                                        )),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            grande = false;
                                            pequena = false;
                                            media = true;
                                            familia = false;
                                          });
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 82,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            // border: Border.all(
                                            //     //width: 1,
                                            //     color: Colors.grey)
                                          ),
                                          child: Row(
                                            children: [
                                              Center(
                                                  child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text("Média"),
                                              )),
                                              media == true
                                                  ? Icon(Icons.check)
                                                  : Center(),
                                            ],
                                          ),
                                        )),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            grande = true;
                                            pequena = false;
                                            media = false;
                                            familia = false;
                                          });
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 82,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            // border: Border.all(
                                            //     //width: 1,
                                            //     color: Colors.grey)
                                          ),
                                          child: Row(
                                            children: [
                                              Center(
                                                  child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text("Grande"),
                                              )),
                                              grande == true
                                                  ? Icon(Icons.check)
                                                  : Center(),
                                            ],
                                          ),
                                        )),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          grande = false;
                                          pequena = false;
                                          media = false;
                                          familia = true;
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 87,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          // border: Border.all(
                                          //width: 1,
                                          // color: Colors.grey)
                                        ),
                                        child: Row(
                                          children: [
                                            Center(
                                                child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text("Família"),
                                            )),
                                            familia == true
                                                ? Icon(Icons.check)
                                                : Center(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Center(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  listPizza(index, context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pizza.pizzas[index].produtoDescricao.length > 19
                          ? pizza.pizzas[index].produtoDescricao
                              .toString()
                              .substring(0, 18)
                          : pizza.pizzas[index].produtoDescricao,
                      style: AppTypography.restaurantTitle(context),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          "+",
                          style:
                              AppTypography.restaurantDetails(context).copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          formatoValores
                              .format(pizza.pizzas[index].pvenda)
                              .toString(),
                          style:
                              AppTypography.restaurantDetails(context).copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  border: pizza.pizzaSelecionada.length > 0
                      ? Border.all(width: .8, color: Colors.grey[300])
                      : Border.all(width: 0, color: Colors.transparent)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  pizza.pizzaSelecionada.length > 0
                      ? IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: Colors.blue[900],
                          ),
                          onPressed: () {
                            setState(() {
                              var nome = pizza.pizzas[index].produtoDescricao;
                              pizza.pizzaSelecionada.removeWhere(
                                  (item) => item.produtoDescricao == nome);
                              pizza.pizzas[index].qtde_inicial = 0;
                            });
                          },
                        )
                      : Center(),
                  pizza.pizzaSelecionada.length > 0
                      ? Center(
                          child:
                              Text(pizza.pizzas[index].qtde_inicial.toString()))
                      : Center(),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.blue[900],
                    ),
                    onPressed: () {
                      setState(() {
                        if (pizza.pizzaSelecionada.length < 3) {
                          indicePizza = index;
                          pizza.adicionarPizza();
                          pizza.pizzas[index].qtde_inicial++;
                        }
                      });
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  listPizzaSelecionada(index, context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pizza.pizzaSelecionada[index].produtoDescricao.length > 27
                          ? pizza.pizzaSelecionada[index].produtoDescricao
                              .toString()
                              .substring(0, 26)
                          : pizza.pizzaSelecionada[index].produtoDescricao,
                      style: AppTypography.restaurantTitle(context),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          "+",
                          style:
                              AppTypography.restaurantDetails(context).copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          formatoValores
                              .format(pizza.pizzaSelecionada[index].pvenda)
                              .toString(),
                          style:
                              AppTypography.restaurantDetails(context).copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  listComplementosSelecionados(index, context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      complementos.complementosSelecionados[index]
                                  .nomeComplemento.length >
                              27
                          ? complementos
                              .complementosSelecionados[index].nomeComplemento
                              .toString()
                              .substring(0, 26)
                          : complementos
                              .complementosSelecionados[index].nomeComplemento,
                      style: AppTypography.restaurantTitle(context),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          "+",
                          style:
                              AppTypography.restaurantDetails(context).copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          formatoValores
                              .format(complementos
                                  .complementosSelecionados[index].valor)
                              .toString(),
                          style:
                              AppTypography.restaurantDetails(context).copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  listComplementos(index, context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24),
      child: GestureDetector(
        onTap: () {
          indiceComplemento = index;
          complementos.adicionarComplementos();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      complementos.complementos[index].nomeComplemento.length >
                              27
                          ? complementos.complementos[index].nomeComplemento
                              .toString()
                              .substring(0, 26)
                          : complementos.complementos[index].nomeComplemento,
                      style: AppTypography.restaurantTitle(context),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          "+",
                          style:
                              AppTypography.restaurantDetails(context).copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          formatoValores
                              .format(complementos.complementos[index].valor)
                              .toString(),
                          style:
                              AppTypography.restaurantDetails(context).copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
