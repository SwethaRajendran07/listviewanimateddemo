import 'package:flutter/material.dart';
import 'package:listviewanimateddemo/listItemWidget.dart';

void main() {
  runApp( AnimatedListView());
}

class AnimatedListView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        appBar: AppBar(
        title: Text("ListView Demo"),
    ),
    body:AnimatedListViewDemo(),
    ),);
  }

}
class ListItem{
  final String title;
  final String urlImage;

  const ListItem({
    required this.title,
    required this.urlImage,
  });





}
final List<ListItem> listItems = [
  ListItem(
    title: 'Milk',
    urlImage:"https://www.google.com/imgres?imgurl=https%3A%2F%2Fimages.hindustantimes.com%2Frf%2Fimage_size_630x354%2FHT%2Fp2%2F2018%2F09%2F20%2FPictures%2F_61433f0c-bcb9-11e8-95ec-91800d079bb4.jpg&imgrefurl=https%3A%2F%2Fwww.hindustantimes.com%2Ffitness%2Fsuperfood-or-poison-experts-tell-you-whether-you-need-to-drink-milk-for-good-health%2Fstory-er5H82M7kJCiHgNSfHxyMJ.html&tbnid=ZOJYx-9-jTdfbM&vet=12ahUKEwi9vMiL95f9AhVJ-3MBHQOpBj8QMygBegUIARDtAQ..i&docid=2AVCOZh181vwEM&w=630&h=362&q=milk&ved=2ahUKEwi9vMiL95f9AhVJ-3MBHQOpBj8QMygBegUIARDtAQ",
  ),
  ListItem(
    title:'Apple',
    urlImage:"https://www.google.com/imgres?imgurl=https%3A%2F%2F5.imimg.com%2Fdata5%2FAK%2FRA%2FMY-68428614%2Fapple-1000x1000.jpg&imgrefurl=https%3A%2F%2Fwww.indiamart.com%2Fproddetail%2Fapple-19835557748.html&tbnid=0YhJIHh6YM-BHM&vet=12ahUKEwj_7abT95f9AhXvArcAHerZBXAQMygAegUIARDhAQ..i&docid=QmNxySEuINQzUM&w=1000&h=755&q=apple&ved=2ahUKEwj_7abT95f9AhXvArcAHerZBXAQMygAegUIARDhAQ",
  ),
  ListItem(
    title:'Orange',
    urlImage: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Fe%2Fe3%2FOranges_-_whole-halved-segment.jpg%2F1200px-Oranges_-_whole-halved-segment.jpg&imgrefurl=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FOrange_(fruit)&tbnid=MTD7708VWwHfyM&vet=12ahUKEwiN_fH395f9AhXIIbcAHTZBCsQQMygAegUIARDgAQ..i&docid=INFbWg-h77makM&w=1200&h=800&q=orange&ved=2ahUKEwiN_fH395f9AhXIIbcAHTZBCsQQMygAegUIARDgAQ",
  ),
  ListItem(
    title: 'Banana',
    urlImage: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fm.media-amazon.com%2Fimages%2FI%2F413Q%2BGBBZWL.jpg&imgrefurl=https%3A%2F%2Fwww.amazon.in%2FFresh-Banana-Robusta-1kg-Pack%2Fdp%2FB07BG8WX37&tbnid=3wkDiM6eH2MMfM&vet=12ahUKEwi15sSQ-Jf9AhWCUHwKHZzyBgYQMygAegUIARDiAQ..i&docid=hGUNZp5o2-nNgM&w=500&h=500&q=Banana&ved=2ahUKEwi15sSQ-Jf9AhWCUHwKHZzyBgYQMygAegUIARDiAQ",
  ),
];

class AnimatedListViewDemo extends StatefulWidget {
  static String id = 'animated_listview';

  const AnimatedListViewDemo({Key? key}) : super(key: key);

  @override
  State<AnimatedListViewDemo> createState() => _AnimatedListViewDemoState();
}

class _AnimatedListViewDemoState extends State<AnimatedListViewDemo> {
  final listKey = GlobalKey<AnimatedListState>();
  final List<ListItem> items = List.from(listItems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(
        initialItemCount:items.length,
        itemBuilder: (context,index,animation) => ListItemWidget(
          item:items[index],
          animation:animation,
          onClicked :()=> removeItem(index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: insertItem,
        child:Icon(Icons.add),
      ),
    );

  }

  void removeItem(int index) {
    final removedItems = items[index];

    items.removeAt(index);
    listKey.currentState!.removeItem(
        index,
            (context,animation)=> ListItemWidget(
          item: removedItems,
          animation: animation,
          onClicked: (){},
        ));
  }

  void insertItem() {
    final newIndex = 1;
    final newItem = (List.of(listItems)..shuffle()).first;

    items.insert(newIndex, newItem);
    listKey.currentState!.insertItem(
      newIndex,
      duration: Duration(milliseconds: 600),
    );
  }
}


