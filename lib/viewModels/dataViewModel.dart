import '../models/dataModel.dart';

class DataViewModel {
  DataModel? dataModel;
  DataViewModel({this.dataModel});

  get id => dataModel?.id ?? '';
  get title => dataModel?.title ?? '';
  get price => dataModel?.price ?? '';
  get description => dataModel?.description ?? '';
  get category => dataModel?.category ?? '';
  get image => dataModel?.image ?? '';
  get rating => dataModel?.rating ?? '';
  

}