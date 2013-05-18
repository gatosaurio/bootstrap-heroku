function ProductsCtrl($scope, $http) {
  $http.get('/orders/new.json').success(function(data) {
    $scope.products = data;
    console.log(data);
  });
}