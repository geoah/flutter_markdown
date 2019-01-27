class MarkDownBean{

  String content;
  ContentMeta meta;

}

class ContentMeta{

  List<SelectionInfo> collection;

  ContentMeta(this.collection){
    if(collection==null){
      collection = [];
    }else{
      collection.sort(
        (SelectionInfo selection1, SelectionInfo selection2) =>
            selection1.startIndex.compareTo(selection2.startIndex)
      );
    }
  }

  SelectionInfo selectionMeta(int user) => collection[user];

  add(int user, SelectionInfo meta){
    collection[user] = meta;
  }

  remove(int user){
    collection.remove(user);
  }

}

class SelectionInfo{

  int startIndex;
  int endIndex;
  dynamic data;

  SelectionInfo(this.startIndex, this.endIndex, this.data);

  void updateIndex(int newStartIndex){
    this.endIndex += newStartIndex - this.startIndex;
    this.startIndex = newStartIndex;
  }

}