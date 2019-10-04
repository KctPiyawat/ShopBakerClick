class MenuItemModel {

  // Field

  String nameFood,detail,pathImage,price;


  // Constructor
  MenuItemModel(this.nameFood,this.detail,this.pathImage,this.price);
  

  MenuItemModel.fromsnapshot(Map<String,dynamic> mySnapshot){
    nameFood = mySnapshot['NameFood'];
    detail = mySnapshot['Detail'];
    pathImage = mySnapshot['PathImage'];
    price = mySnapshot['Price'];
  }
}