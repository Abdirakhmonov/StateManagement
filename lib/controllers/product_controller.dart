import 'package:flutter/material.dart';
import 'package:lesson_64/models/product_model.dart';

class ProductsController extends ChangeNotifier {
  final List<Product> _list = [
    Product(
        id: "1",
        title: "Sony WH-1000XM4",
        description:
        "Sony-ning ajoyib ovoz sifati va ilg'or shovqin bekor qiluvchi texnologiyasi bilan mashhur quloqchini.",
        price: 350),
    Product(
        id: "2",
        title: "Bose QuietComfort 35 II",
        description:
        "Bose-ning yuqori sifatli ovozi va qulay dizayni bilan tanilgan shovqin bekor qiluvchi quloqchini.",
        price: 300),
    Product(
        id: "3",
        title: "Apple AirPods Pro",
        description:
        "Apple-ning ilg'or shovqin bekor qiluvchi texnologiyasi va qulay, simsiz dizayni bilan mashhur quloqchini.",
        price: 250),
    Product(
        id: "4",
        title: "Samsung Galaxy Buds Pro",
        description:
        "Samsungning yuqori sifatli ovozi va ilg'or shovqin bekor qiluvchi texnologiyasi bilan tanilgan simsiz quloqchini.",
        price: 200),
    Product(
        id: "5",
        title: "Jabra Elite 85h",
        description:
        "Jabra-ning ajoyib ovoz sifati va shovqin bekor qiluvchi texnologiyasi bilan tanilgan quloqchini.",
        price: 250),
    Product(
        id: "6",
        title: "Sennheiser Momentum 3",
        description:
        "Sennheiser-ning yuqori sifatli ovozi va ilg'or shovqin bekor qiluvchi texnologiyasi bilan mashhur quloqchini.",
        price: 400),
    Product(
        id: "7",
        title: "Anker Soundcore Life Q30",
        description:
        "Anker-ning arzonroq, ammo yaxshi sifatli shovqin bekor qiluvchi quloqchini.",
        price: 100),
    Product(
        id: "8",
        title: "Sony WF-1000XM4",
        description:
        "Sony-ning ilg'or shovqin bekor qiluvchi texnologiyasi va ajoyib ovoz sifati bilan mashhur simsiz quloqchini.",
        price: 280),
    Product(
        id: "9",
        title: "Bose Noise Cancelling Headphones 700",
        description:
        "Bose-ning ajoyib ovoz sifati va ilg'or shovqin bekor qiluvchi texnologiyasi bilan tanilgan quloqchini.",
        price: 380),
    Product(
        id: "10",
        title: "Beats Solo Pro",
        description:
        "Beats-ning yuqori sifatli ovozi va ilg'or shovqin bekor qiluvchi texnologiyasi bilan mashhur quloqchini.",
        price: 300),
    Product(
        id: "11",
        title: "Bang & Olufsen Beoplay H9",
        description:
        "Bang & Olufsen-ning yuqori sifatli ovozi va shovqin bekor qiluvchi texnologiyasi bilan tanilgan quloqchini.",
        price: 500),
    Product(
        id: "12",
        title: "Marshall Monitor II ANC",
        description:
        "Marshall-ning ajoyib ovoz sifati va shovqin bekor qiluvchi texnologiyasi bilan tanilgan quloqchini.",
        price: 320),
    Product(
        id: "13",
        title: "Plantronics BackBeat Pro 2",
        description:
        "Plantronics-ning yaxshi sifatli ovozi va shovqin bekor qiluvchi texnologiyasi bilan tanilgan quloqchini.",
        price: 200),
    Product(
        id: "14",
        title: "AKG N700NC M2",
        description:
        "AKG-ning ajoyib ovoz sifati va shovqin bekor qiluvchi texnologiyasi bilan tanilgan quloqchini.",
        price: 300),
    Product(
        id: "15",
        title: "Philips PH805",
        description:
        "Philips-ning yaxshi sifatli ovozi va shovqin bekor qiluvchi texnologiyasi bilan mashhur quloqchini.",
        price: 150),
    Product(
        id: "16",
        title: "Sennheiser HD 450BT",
        description:
        "Sennheiser-ning yuqori sifatli ovozi va ilg'or shovqin bekor qiluvchi texnologiyasi bilan tanilgan quloqchini.",
        price: 200),
    Product(
        id: "17",
        title: "JBL Live 650BTNC",
        description:
        "JBL-ning ajoyib ovoz sifati va shovqin bekor qiluvchi texnologiyasi bilan mashhur quloqchini.",
        price: 180),
    Product(
        id: "18",
        title: "Sony WH-CH710N",
        description:
        "Sony-ning arzonroq, ammo yaxshi sifatli shovqin bekor qiluvchi quloqchini.",
        price: 130),
    Product(
        id: "19",
        title: "Bose SoundSport Free",
        description:
        "Bose-ning yuqori sifatli ovozi va sport uchun mo'ljallangan simsiz quloqchini.",
        price: 200),
    Product(
        id: "20",
        title: "Beats Powerbeats Pro",
        description:
        "Beats-ning ajoyib ovoz sifati va sport uchun mo'ljallangan simsiz quloqchini.",
        price: 250)
  ];

  List<Product> get list => [..._list];
}
