match($0,/(.*),(.*)/,a){
  date=a[1];
  gsub("-","",date);
  name=a[2];
  print("holiday."date".date="date"\nholiday."date".name="name);
}
