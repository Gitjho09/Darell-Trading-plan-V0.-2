
import 'package:flutter/material.dart';
void main()=>runApp(const DarellApp());
class DarellApp extends StatelessWidget{
  const DarellApp({super.key});
  @override Widget build(BuildContext context)=>MaterialApp(debugShowCheckedModeBanner:false, theme:ThemeData(useMaterial3:true, brightness:Brightness.dark, scaffoldBackgroundColor:const Color(0xFF0F1115)), home:const Home());
}
class Lesson{final String t,s,d; final IconData i; final Color c; const Lesson(this.t,this.s,this.d,this.i,this.c);}
const lessons=[
  Lesson('OrderBlock Formation','DEMAND & SUPPLY','Huling red candle bago mag breakout. Dyan nag iipon ang banks.',Icons.view_in_ar,Color(0xFF00FF88)),
  Lesson('Structure Retest','BOS & KEY AREA','Pag na-break ang structure, wait ng retest bago entry.',Icons.layers,Color(0xFF3B82F6)),
  Lesson('Fresh Liquidity','LIQUIDITY HUNT','Kukunin muna stops bago tunay na galaw.',Icons.water_drop,Color(0xFF8B5CF6)),
  Lesson('Gap / Imbalance','FAIR VALUE GAP','May gap na iniwan, babalikan ng price.',Icons.space_bar,Color(0xFFF59E0B)),
  Lesson('Supply Demand','BASIC ZONE','Supply = benta, Demand = bili.',Icons.import_export,Color(0xFF00FF88)),
  Lesson('Bullish Fake Out','GRAB LONG','Baba kunwari tapos akyat.',Icons.trending_up,Color(0xFF00FF88)),
  Lesson('Bearish Fake Out','GRAB SHORT','Akyat kunwari tapos bagsak.',Icons.trending_down,Color(0xFFFF3B3B)),
];
class Home extends StatefulWidget{const Home({super.key}); @override State<Home> createState()=>_HomeState();}
class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  late TabController tab; @override void initState(){tab=TabController(length:3,vsync:this);super.initState();}
  @override Widget build(BuildContext context)=>Scaffold(
    appBar:AppBar(title:const Text('DARELL ACADEMY',style:TextStyle(fontWeight:FontWeight.w900)),centerTitle:true,bottom:TabBar(controller:tab,tabs:const [Tab(text:'Price Action'),Tab(text:'Candles'),Tab(text:'BUY/SELL')])),
    body:TabBarView(controller:tab,children:[
      ListView(padding:const EdgeInsets.all(16),children:[
        Container(padding:const EdgeInsets.all(20),decoration:BoxDecoration(gradient:const LinearGradient(colors:[Color(0xFF00FF88),Color(0xFF0A5C36)]),borderRadius:BorderRadius.circular(20)),child:const Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('9 PRICE ACTION CONCEPTS',style:TextStyle(fontSize:20,fontWeight:FontWeight.w900,color:Colors.black)),Text('Discipline Today, Success Tomorrow',style:TextStyle(color:Colors.black87))])),
        const SizedBox(height:16),
        ...lessons.map((l)=>Card(color:const Color(0xFF1A1E26),margin:const EdgeInsets.only(bottom:12),shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(16)),child:ListTile(leading:CircleAvatar(backgroundColor:l.c.withOpacity(0.2),child:Icon(l.i,color:l.c)),title:Text(l.t,style:const TextStyle(fontWeight:FontWeight.bold)),subtitle:Text(l.s,style:TextStyle(fontSize:11,color:l.c)),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>Detail(l)))))),
      ]),
      GridView.count(crossAxisCount:2,padding:const EdgeInsets.all(12),crossAxisSpacing:12,mainAxisSpacing:12,children:const [
        _CandleCard(n:'Bullish Engulfing',t:'BUY',e:'🟢',d:'Lamon green ang red'),
        _CandleCard(n:'Bearish Engulfing',t:'SELL',e:'🔴',d:'Lamon red ang green'),
        _CandleCard(n:'Hammer',t:'BUY',e:'🔨',d:'Wick mahaba sa baba'),
        _CandleCard(n:'Shooting Star',t:'SELL',e:'⭐',d:'Wick mahaba sa taas'),
        _CandleCard(n:'Morning Star',t:'BUY',e:'🌅',d:'Red-small-green'),
        _CandleCard(n:'Evening Star',t:'SELL',e:'🌃',d:'Green-small-red'),
      ]),
      ListView(padding:const EdgeInsets.all(16),children:const [
        _ComboCard(buy:'Candle + Hammer = Bullish',sell:'Engulfing = Shooting Star'),
        _ComboCard(buy:'Double Bottom = Buy',sell:'Double Top = Sell'),
        _ComboCard(buy:'3 White Soldiers',sell:'3 Black Crows'),
      ])
    ])
  );
}
class _CandleCard extends StatelessWidget{final String n,t,e,d; const _CandleCard({required this.n,required this.t,required this.e,required this.d}); @override Widget build(BuildContext c){bool b=t=='BUY';return Container(decoration:BoxDecoration(color:const Color(0xFF1A1E26),borderRadius:BorderRadius.circular(16),border:Border.all(color:b?const Color(0xFF00FF88).withOpacity(0.3):const Color(0xFFFF3B3B).withOpacity(0.3))),child:Padding(padding:const EdgeInsets.all(12),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Text(e,style:const TextStyle(fontSize:22)),Container(padding:const EdgeInsets.symmetric(horizontal:6,vertical:2),decoration:BoxDecoration(color:b?const Color(0xFF00FF88):const Color(0xFFFF3B3B),borderRadius:BorderRadius.circular(6)),child:Text(t,style:const TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize:10)))]),const SizedBox(height:8),Text(n,style:const TextStyle(fontWeight:FontWeight.bold,fontSize:13)),Text(d,style:const TextStyle(fontSize:11,color:Colors.white60))])));}}
class _ComboCard extends StatelessWidget{final String buy,sell; const _ComboCard({required this.buy,required this.sell}); @override Widget build(BuildContext c)=>Card(color:const Color(0xFF1A1E26),shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(16)),child:Padding(padding:const EdgeInsets.all(16),child:Row(children:[Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[const Text('BUY',style:TextStyle(color:Color(0xFF00FF88),fontWeight:FontWeight.w900,fontSize:12)),Text(buy,style:const TextStyle(fontSize:12))])),const Icon(Icons.swap_horiz,size:16),Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[const Text('SELL',style:TextStyle(color:Color(0xFFFF3B3B),fontWeight:FontWeight.w900,fontSize:12)),Text(sell,style:const TextStyle(fontSize:12))]))])));}
class Detail extends StatelessWidget{final Lesson l; const Detail(this.l,{super.key}); @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:Text(l.t)),body:ListView(padding:const EdgeInsets.all(20),children:[Container(height:160,decoration:BoxDecoration(color:l.c.withOpacity(0.15),borderRadius:BorderRadius.circular(20)),child:Icon(l.i,size:70,color:l.c)),const SizedBox(height:16),Text(l.s,style:TextStyle(color:l.c,fontWeight:FontWeight.bold,letterSpacing:2)),Text(l.t,style:const TextStyle(fontSize:26,fontWeight:FontWeight.w900)),const SizedBox(height:12),Text(l.d,style:const TextStyle(color:Colors.white70)),const SizedBox(height:20),Container(padding:const EdgeInsets.all(14),decoration:BoxDecoration(color:const Color(0xFF1A1E26),borderRadius:BorderRadius.circular(12)),child:const Text('RISK: 1-2% lang per trade\nSL sa baba/taas ng zone\nTrend muna bago entry',style:TextStyle(fontSize:13)))]));}
