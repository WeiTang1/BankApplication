var app = angular.module("myApp",[]);
app.controller("myController",function($scope,$http){
    $scope.name= 'Wei';
    $http({
        method:'GET',
        url:'openaccount/getuserinfo',
        accept:"application/json"
    }).then(function(response){
        var usr = response.data.entity.entity;
        var address = usr.address;
        $scope.usr = usr;
        $scope.address = address;
        console.log(usr);
        console.log(address);
    },function(response){
        console.log("failed");
    })
})
var selectApp = angular.module("selectModule",[]);
selectApp.controller("selectController",function($scope,$http){
    $scope.name= 'Wei';
    $http({
        method:"Get",
        url:'openaccount/getAccountType',
        accept:"application.json"
    }).then(function(response){
        console.log(response);
        $scope.types = response.data.entity.entity;
    },function(response){});
})
angular.element(document).ready(function(){
    angular.bootstrap(document.getElementById('selectModule'),['selectModule']);
})


