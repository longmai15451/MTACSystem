
class ProcessingMethod {
  
  
  void setSelect(int index, List<bool> select) {
    for(int i=0;i<select.length;++i){
      if(i==index) continue;
      select[i] = false;
    }
  }

  void setAvailible(limitdata, List<bool> availableCheck) {
    availableCheck.replaceRange(
      0, 5, 
    [
      limitdata['7-9'],
      limitdata['9-11'],
      limitdata['13-15'],
      limitdata['15-17'],
      limitdata['17-19'],
      limitdata['19-21'],
    ]);
  }

}