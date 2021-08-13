import 'dart:convert';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ifood_flutter_clone/controllers/connect.api.dart';
import 'package:ifood_flutter_clone/models/produtos/product.state.dart';
import 'package:ifood_flutter_clone/views/mesas/extrato.dart';
import 'package:ifood_flutter_clone/views/mesas/quantidade.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/core/theme/app_colors.dart';
import 'package:ifood_flutter_clone/core/theme/app_typography.dart';
import 'package:ifood_flutter_clone/models/produtos/category.state.dart';
import 'package:ifood_flutter_clone/views/login/login_page.dart';
import 'package:mobx/mobx.dart';

int indiceProduto;
var pequenoP;
var medioP;
var grandeP;
var familiaP;
NumberFormat formatter = new NumberFormat("000000");

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  Future loadProducts() async {
    await product.listarProdutos().then((value) => categories.listCategory());
  }

  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  var produtoController = TextEditingController(text: '');
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            "Adicionar produto",
            style: TextStyle(color: Colors.black, fontSize: 22),
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
                                  child: TextFormField(
                                    onChanged: (text) {
                                      text = text.toLowerCase();
                                      setState(() {
                                        product.product = ObservableList.of(
                                            product.productDisplay
                                                .where((product) {
                                          var idProduto =
                                              product.idProduto != null
                                                  ? product.idProduto.toString()
                                                  : "";
                                          var nomeProduto = product.descricao !=
                                                  null
                                              ? product.descricao.toLowerCase()
                                              : "";
                                          return idProduto.contains(text) ||
                                              nomeProduto.contains(text);
                                        }));
                                      });
                                    },
                                    controller: produtoController,
                                    decoration: InputDecoration(
                                        hintText: "Pesquisar produto",
                                        border: InputBorder.none),
                                  ),
                                ),
                              )
                            : Center(),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 15,
                        ),
                      ),
                      _CategorySession(),
                      //_BannerSession(),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 24.0, right: 24, bottom: 24, top: 10),
                          child: Text('Produtos',
                              style: AppTypography.sessionTitle(
                                context,
                              )),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Observer(builder: (_) {
                          return Container(
                            height: MediaQuery.of(context).size.height - 250,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: product.product.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) =>
                                    listProdutos(index, context)),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

listProdutos(index, context) {
  var basicAuth = 'Basic ' +
      base64Encode(
          utf8.encode('${passController.text}:${configLoginController.text}'));
  return Padding(
    padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24),
    child: GestureDetector(
      onTap: () {
        indiceProduto = index;
        pequenoP = product.product[index].valorTamPequeno;
        medioP = product.product[index].valorTamMedio;
        grandeP = product.product[index].valorTamGrande;
        familiaP = product.product[index].valorTamFamilia;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => QuantidadeProdutoPage()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                backgroundImage: NetworkImage(
                    'http://$ip/find-image?pTipo=1&pId=2&pEscala=500&pFileName=PRO_${formatter.format(product.product[index].idProduto)}_001.PNG',
                    headers: <String, String>{'authorization': basicAuth}),
                radius: 30,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.product[index].descricao.length > 27
                        ? product.product[index].descricao
                            .toString()
                            .substring(0, 26)
                        : product.product[index].descricao,
                    style: AppTypography.restaurantTitle(context),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        formatoValores
                            .format(product.product[index].pvenda)
                            .toString(),
                        style:
                            AppTypography.restaurantDetails(context).copyWith(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(" ● "),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        product.product[index].unidade,
                        style: AppTypography.restaurantDetails(context),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        product.product[index].gtin.toString(),
                        style: AppTypography.restaurantDetails(context),
                      ),
                      Text(
                        ' - ',
                        style: AppTypography.restaurantDetails(context),
                      ),
                      Text(
                        product.product[index].idProduto.toString(),
                        style: AppTypography.restaurantDetails(context),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class _CategorySession extends StatelessWidget {
  const _CategorySession({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Observer(builder: (_) {
        return SizedBox(
          height: 86,
          child: ListView.builder(
            itemCount: categories.category.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return listCategories(index, context);
            },
          ),
        );
      }),
    );
  }

  listCategories(index, context) {
    var basicAuth = 'Basic ' +
        base64Encode(utf8
            .encode('${passController.text}:${configLoginController.text}'));
    return Padding(
      padding: EdgeInsets.only(
        left: index == 0 ? 16 : 0,
        right: index == categories.category.length - 1 ? 16 : 10,
      ),
      child: GestureDetector(
        onTap: () {
          grupoId = categories.category[index].idGrupo;
          product.listarProdutos();
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              height: 60,
              image: NetworkImage(
                  'http://$ip/find-image?pTipo=4&pId=$empresaId&pEscala=500&pFileName=GRU_${formatter.format(categories.category[index].idGrupo)}.PNG',
                  headers: <String, String>{'authorization': basicAuth}),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Text(
                categories.category[index].grupoDescricao ?? '',
                style: AppTypography.small(context)
                    .copyWith(color: AppColors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
