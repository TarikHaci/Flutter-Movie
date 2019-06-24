import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/sortcondition.dart';
import 'package:movie/models/enums/gernes.dart';
import '../../state.dart';

class FilterState implements Cloneable<FilterState> {
  bool isMovie=true;
  List<SortCondition> genres=new List<SortCondition>()..addAll(Gernes.gernes.keys.map((i){
    return SortCondition(name: Gernes.gernes[i],isSelected: false,value: i);
  }).toList());
  String keywords;
  @override
  FilterState clone() {
    return FilterState()
    ..isMovie=isMovie
    ..genres=genres
    ..keywords=keywords;
  }

  addAll(List<SortCondition> list) {}
}

FilterState initState(Map<String, dynamic> args) {
  return FilterState();
}


class FilterConnector
    extends ConnOp<DiscoverPageState, FilterState> {
  @override
  FilterState get(DiscoverPageState state) {
    final FilterState filterState=state.filterState;
    return filterState;
  }
  @override
  void set(DiscoverPageState state, FilterState subState) {
    state.filterState=subState;
  }
}