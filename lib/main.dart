import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner:false, theme:ThemeData.dark(), home:MainApp()));

class MainApp extends StatefulWidget{ @override _MainAppState createState()=>_MainAppState();}
class _MainAppState extends State<MainApp>{
 int idx=0;
 final pages=[PlanPage(), CheatPage(), JournalPage()];
 @override Widget build(BuildContext c)=>Scaffold(
   body: pages[idx],
   bottomNavigationBar: BottomNavigationBar(
     currentIndex: idx, onTap: (i)=>setState(()=>idx=i),
     backgroundColor: Colors.black, selectedItemColor: Colors.orange, unselectedItemColor: Colors.grey,
     items: [
       BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Plan"),
       BottomNavigationBarItem(icon: Icon(Icons.candlestick_chart), label: "Cheat Sheet"),
       BottomNavigationBarItem(icon: Icon(Icons.book), label: "Journal"),
     ]),
 );
}

class PlanPage extends StatelessWidget{
 @override Widget build(BuildContext c)=>Scaffold(appBar: AppBar(title: Text("📓 Darell Trading Plan"), backgroundColor: Colors.orange),
  body: ListView(padding: EdgeInsets.all(16), children:[
    _card("🎯 GOLDEN RULES", "1. Risk 1-2% per trade lang\n2. R:R minimum 1:2\n3. No trade pag wala sa plan\n4. Max 3 trades per day\n5. Stop pag 2 sunod talo", Colors.orange),
    _card("⚡ SCALPING (5m-15m)", "TP: 0.8% | SL: 0.4%\nIndicators: EMA 20/50 + RSI 14\nBest Time: 9AM-11AM / 2PM-4PM\nStyle: Mabilis, 5-10 mins hold", Colors.green),
    _card("⏱️ INTRADAY (30m-4h)", "TP: 2% | SL: 1%\nIndicators: Support/Resistance + Candlestick\nHold: Within day lang, no overnight", Colors.blue),
    _card("📈 SWING (1d-1w)", "TP: 6% | SL: 3%\nIndicators: Trend + MA 50/200\nHold: Days to Weeks\nCapital: Mas malaki", Colors.purple),
    _card("🧠 MINDSET", "Hindi per trade ang laban, per month!\nJournal lahat ng trade\nAccept talo, parte ng laro", Colors.teal),
  ]));
 Widget _card(String t,String d, Color col)=>Card(color: Color(0xFF1E1E1E), margin: EdgeInsets.only(bottom:12), child: Padding(padding: EdgeInsets.all(16), child: Column(crossAxisAlignment:CrossAxisAlignment.start, children:[Container(padding:EdgeInsets.symmetric(horizontal:12,vertical:4), decoration:BoxDecoration(color:col, borderRadius:BorderRadius.circular(12)), child:Text(t, style:TextStyle(fontWeight:FontWeight.bold, color:Colors.white))), SizedBox(height:10), Text(d, style:TextStyle(fontSize:14, height:1.6, color:Colors.white70))])));
}

class CheatPage extends StatelessWidget{
 final patterns=[
   {"name":"Hammer","type":"BULLISH","desc":"Reversal after downtrend\nLong lower wick = BUY","icon":"🔨"},
   {"name":"Inverted Hammer","type":"BULLISH","desc":"Bullish reversal\nLong upper wick","icon":"🔝"},
   {"name":"Bullish Engulfing","type":"BULLISH","desc":"Green engulfs red\nStrong BUY signal","icon":"🟩"},
   {"name":"Bearish Engulfing","type":"BEARISH","desc":"Red engulfs green\nStrong SELL","icon":"🟥"},
   {"name":"Doji","type":"NEUTRAL","desc":"Open = Close\nIndecision - WAIT!","icon":"➕"},
   {"name":"Morning Star","type":"BULLISH","desc":"3 candle bottom reversal\nBUY opportunity","icon":"🌅"},
   {"name":"Evening Star","type":"BEARISH","desc":"3 candle top reversal\nSELL signal","icon":"🌇"},
   {"name":"Shooting Star","type":"BEARISH","desc":"Long upper wick after uptrend\nSELL","icon":"⭐"},
   {"name":"Hanging Man","type":"BEARISH","desc":"After uptrend - Beware!\nPotential SELL","icon":"🪂"},
   {"name":"Three White Soldiers","type":"BULLISH","desc":"3 green rising\nStrong uptrend continue","icon":"💂‍♂️"},
   {"name":"Three Black Crows","type":"BEARISH","desc":"3 red falling\nStrong downtrend continue","icon":"🐦‍⬛"},
   {"name":"Harami","type":"BULLISH","desc":"Small inside big\nReversal soon - Prepare","icon":"🤰"},
 ];
 @override Widget build(BuildContext c)=>Scaffold(appBar: AppBar(title: Text("🕯️ Candlestick Cheat Sheet"), backgroundColor: Colors.orange),
  body: GridView.builder(padding: EdgeInsets.all(10), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2, childAspectRatio:0.85, crossAxisSpacing:10, mainAxisSpacing:10),
   itemCount: patterns.length,
   itemBuilder: (ctx,i){
     var p=patterns[i]; Color col=p["type"]=="BULLISH"?Colors.green: p["type"]=="BEARISH"?Colors.red:Colors.amber;
     return Card(color: Color(0xFF1E1E1E), child: Padding(padding: EdgeInsets.all(12), child: Column(mainAxisAlignment: MainAxisAlignment.center, children:[
       Text(p["icon"]!, style: TextStyle(fontSize:28)),
       SizedBox(height:6),
       Container(padding: EdgeInsets.symmetric(horizontal:8,vertical:2), decoration:BoxDecoration(color:col, borderRadius:BorderRadius.circular(6)), child: Text(p["type"]!, style: TextStyle(fontSize:10, fontWeight:FontWeight.bold, color:Colors.white))),
       SizedBox(height:8),
       Text(p["name"]!, style: TextStyle(fontWeight:FontWeight.bold, fontSize:13), textAlign: TextAlign.center),
       SizedBox(height:6),
       Text(p["desc"]!, style: TextStyle(fontSize:11, color:Colors.white60), textAlign: TextAlign.center),
     ])));
   }));
}

class JournalPage extends StatefulWidget{ @override _JournalPageState createState()=>_JournalPageState();}
class _JournalPageState extends State<JournalPage>{
 List<String> logs=["2026-05-13: BTC-USD BUY +2% - Sinunod ang plan!","2026-05-12: ETH-USD SELL -1% - Na-SL pero okay"];
 String input="";
 @override Widget build(BuildContext c)=>Scaffold(appBar: AppBar(title: Text("📓 My Journal"), backgroundColor: Colors.orange),
  body: Column(children:[
    Padding(padding: EdgeInsets.all(12), child: Row(children:[
      Expanded(child: TextField(style: TextStyle(color:Colors.white), decoration: InputDecoration(hintText:"Ex: BTC BUY +1.5% Good discipline", hintStyle: TextStyle(color:Colors.grey), border: OutlineInputBorder()), onChanged: (v)=>input=v)),
      SizedBox(width:8),
      ElevatedButton(onPressed:(){ if(input.isNotEmpty) setState(()=>logs.insert(0,"${DateTime.now().toString().substring(0,10)}: $input")); }, child: Text("Add"), style: ElevatedButton.styleFrom(backgroundColor: Colors.orange)),
    ])),
    Expanded(child: ListView.builder(itemCount: logs.length, itemBuilder: (ctx,i)=>Card(color: Color(0xFF1E1E1E), child: ListTile(title: Text(logs[i], style:TextStyle(color:Colors.white70)), leading: Icon(Icons.check_circle, color: Colors.green))))),
  ]));
}
