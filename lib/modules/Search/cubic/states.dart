abstract class ShopSearchStates{}
class SearchInitailState extends ShopSearchStates{}
class SearchLoadingState extends ShopSearchStates{}
class SearchSuccessState extends ShopSearchStates{


}
class   SearchErrorState extends ShopSearchStates{
  final String error;
  SearchErrorState(this.error);
}