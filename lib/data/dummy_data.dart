import 'package:flutter/material.dart';
import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/models/recipe.dart';

const availableCategories = [
  Category(
    id: 'c1',
    title: 'Makanan Padang',
    color: Colors.green,
  ),
  Category(
    id: 'c2',
    title: 'Makanan Jawa',
    color: Colors.brown,
  ),
  Category(
    id: 'c3',
    title: 'Makanan Sunda',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'Makanan Bali',
    color: Colors.red,
  ),
  Category(
    id: 'c5',
    title: 'Makanan Manado',
    color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: 'Makanan Aceh',
    color: Colors.purple,
  ),
  Category(
    id: 'c7',
    title: 'Sarapan Indonesia',
    color: Colors.lightBlue,
  ),
  Category(
    id: 'c8',
    title: 'Makanan Tradisional',
    color: Colors.amber,
  ),
  Category(
    id: 'c9',
    title: 'Makanan Laut',
    color: Colors.teal,
  ),
  Category(
    id: 'c10',
    title: 'Makanan Ringan',
    color: Colors.pink,
  ),
];

const dummyRecipes = [
  Recipe(
    id: 'm1',
    categories: [
      'c1',
      'c2',
    ],
    title: 'Rendang',
    affordability: Affordability.pricey,
    complexity: Complexity.hard,
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Rendang_daging.jpg',
    duration: 240,
    ingredients: [
      '1 kg daging sapi',
      '1 liter santan',
      '5 lembar daun jeruk',
      '2 batang serai',
      '5 siung bawang putih',
      '10 siung bawang merah',
      '3 cm jahe',
      '3 cm lengkuas',
      '3 cm kunyit',
      '10 buah cabai merah',
      '1 sdt garam',
      '1 sdt gula merah'
    ],
    steps: [
      'Haluskan bawang merah, bawang putih, cabai, jahe, lengkuas, kunyit.',
      'Tumis bumbu halus hingga harum, tambahkan daun jeruk dan serai.',
      'Masukkan daging sapi, aduk rata.',
      'Tuangkan santan, masak dengan api kecil hingga meresap dan kering.',
      'Aduk sesekali agar tidak gosong.',
      'Masak hingga rendang berwarna coklat gelap dan matang sempurna.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Recipe(
    id: 'm2',
    categories: ['c3'],
    title: 'Nasi Liwet',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/d/d6/Nasi_Liwet_Sunda.jpg',
    duration: 60,
    ingredients: [
      '2 gelas beras',
      '2 gelas air',
      '1 batang serai',
      '3 lembar daun salam',
      '3 siung bawang merah',
      '1 sdt garam',
      '1 sdt kaldu ayam bubuk'
    ],
    steps: [
      'Cuci bersih beras, lalu masukkan ke dalam rice cooker.',
      'Iris bawang merah, lalu tumis hingga harum.',
      'Tambahkan serai dan daun salam, tumis sebentar.',
      'Masukkan tumisan ke dalam rice cooker bersama air, garam, dan kaldu bubuk.',
      'Masak hingga nasi matang dan sajikan dengan lauk favorit.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Recipe(
    id: 'm3',
    categories: ['c5'],
    title: 'Cakalang Fufu',
    affordability: Affordability.pricey,
    complexity: Complexity.challenging,
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Cakalang_Fufu.jpg',
    duration: 90,
    ingredients: [
      '1 ekor ikan cakalang',
      '5 siung bawang putih',
      '3 siung bawang merah',
      '3 buah cabai merah',
      '2 sdt garam',
      '1 sdt gula',
      '1 batang serai',
      '1 lembar daun jeruk'
    ],
    steps: [
      'Bersihkan ikan cakalang dan belah menjadi dua bagian.',
      'Taburi dengan garam dan jemur di bawah sinar matahari hingga setengah kering.',
      'Asapkan ikan hingga matang dan berwarna kemerahan.',
      'Tumis bawang putih, bawang merah, cabai, serai, dan daun jeruk hingga harum.',
      'Suwir ikan cakalang dan masukkan ke dalam tumisan.',
      'Masak hingga meresap dan siap disajikan.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Recipe(
    id: 'm4',
    categories: ['c7'],
    title: 'Bubur Ayam',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Bubur_Ayam_Sunda.jpg',
    duration: 30,
    ingredients: [
      '1 cup beras',
      '5 gelas air',
      '100 gram ayam suwir',
      '1 batang daun bawang',
      '1 sdt garam',
      '1 sdt kaldu ayam',
      'Kecap manis dan kerupuk'
    ],
    steps: [
      'Masak beras dengan air hingga menjadi bubur.',
      'Rebus ayam hingga matang lalu suwir-suwir.',
      'Tambahkan garam dan kaldu ke dalam bubur, aduk rata.',
      'Sajikan dengan ayam suwir, daun bawang, kecap manis, dan kerupuk.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Recipe(
    id: 'm5',
    categories: ['c10'],
    title: 'Pisang Goreng',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3c/Pisang_Goreng.jpg',
    duration: 20,
    ingredients: [
      '5 buah pisang kepok',
      '100 gram tepung terigu',
      '1 sdt gula pasir',
      '1/2 sdt garam',
      '100 ml air',
      'Minyak untuk menggoreng'
    ],
    steps: [
      'Campurkan tepung terigu, gula, garam, dan air, aduk hingga menjadi adonan.',
      'Celupkan pisang ke dalam adonan.',
      'Goreng pisang dalam minyak panas hingga keemasan.',
      'Tiriskan dan sajikan hangat.'
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
];
