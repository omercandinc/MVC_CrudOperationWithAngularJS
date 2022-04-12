const app = angular.module("myApp", ['ui.bootstrap']);
app.controller("myCtrl", ($scope, $http, $uibModal) => {
    $scope.InsertProduct = function () {
        var ProductInsert = {
            PName: document.getElementById("addinputPNAME").value,
            Price: document.getElementById("addinputPrice").value,
            Category: document.getElementById("addinputCategory").value,
            Manufacturer: document.getElementById("addinputManufacturer").value,
        };
        
        $http({
            method: "post",
            url: "/Product/InsertProduct",
            datatype: "json",
            data: JSON.stringify(ProductInsert)
        }).then(function (response) {
            alert(response.data);
            $scope.GetAllRecord();
            $scope.CloseModal();
        })
    };
    
    $scope.GetAllRecord = function () {
        $http({
            method: "get",
            url: "/Product/GetAllRecord"
        }).then(function (response) {
            $scope.Product = response.data;
        }, function () {
            alert("Error Occur");
        })
    };
    $scope.DeleteProduct = function (id) {

        $http({
            method: "post",
            url: "/Product/DeleteProduct",
            datatype: "json",
            data: "{id: " + id + "}"
        }).then(function (response) {
            alert(response.data);
            $scope.CloseModal();
            $scope.GetAllRecord();
        })
    };


    $scope.UpdateProduct = function (prd) {
        var ProductUpdate = {
            ID: document.getElementById("editinputID").value,
            PName: document.getElementById("editinputPNAME").value,
            Price: document.getElementById("editinputPrice").value,
            Category: document.getElementById("editinputCategory").value,
            Manufacturer: document.getElementById("editinputManufacturer").value,
        };

        $http({
            method: "post",
            url: "/Product/UpdateProduct",
            datatype: "json",
            data: JSON.stringify(ProductUpdate)
        }).then(function (response) {
            alert(response.data);
            $scope.GetAllRecord();
            $scope.CloseModal();
        })
    }

    $scope.openEditModal = (prd) => {
        console.log('OpenEditModal');
        console.log(prd);
        $scope.ProductID = prd.ID;
        $scope.PName = prd.PName;
        $scope.Price = prd.Price;
        $scope.Category = prd.Category;
        $scope.Manufacturer = prd.Manufacturer;
        console.log($scope.ProductID);
        

        $scope.modalVariableEdit = true;
    };
    $scope.openAddModal = function () {
        console.log('openAddModal');
        $scope.modalVariableAdd = true;
    };

    $scope.openDeleteModal = (prd) => {
        $scope.modalVariableDelete = true;
        $scope.ProductDeleteModal = prd;
    }

    $scope.CloseModal = function () {
        console.log('CloseModal');
        $scope.modalVariableEdit = false;
        $scope.modalVariableDelete = false;
        $scope.modalVariableAdd = false;
        $scope.ProductID = '';
        $scope.PName = '';
        $scope.Price = '';
        $scope.Category = '';
        $scope.Manufacturer = '';
    };

})


app.controller('ModalContentCtrl', function ($scope, $uibModalInstance) {

    $scope.ok = function () {
        $uibModalInstance.close("Ok");
    }

    $scope.cancel = function () {
        $uibModalInstance.dismiss();
    }

});
