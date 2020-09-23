<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false" %>
<html>
<head>
<script type="text/javascript" src="//code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="//code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/css/result-light.css">
<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
	<title>Home</title>
	<style type="text/css">
    .ui-menu {
    width: 150px;
}
  </style>
	
<script type="text/javascript">
$( document ).ready(function () {

    var data = {
        menu:[ {name: 'Croatia',
        link: '0',
        sub: [{
            name: 'Croatia',
            link: '1',
            sub: null
        }, {
            name: 'England',
            link: '1',
            sub: [{
                name: 'Arsenal',
                link: '1-0',
                sub: null
            }, {
                name: 'Liverpool',
                link: '1-1',
                sub: null
            }, {
                name: 'Manchester United',
                link: '1-2',
                sub: [{name: 'Manchester United',
                    link: '1-2-0',
                    sub: null}]
            }]
        }, {
            name: 'Spain',
            link: '2',
            sub: [{
                name: 'Barcelona',
                link: '2-0',
                sub: null
            }, {
                name: 'Real Madrid',
                link: '2-1',
                sub: null
            }]
        }, {
            name: 'Germany',
            link: '3',
            sub: [{
                name: 'Bayern Munich',
                link: '3-1',
                sub: null
            }, {
                name: 'Borrusia Dortmund',
                link: '3-2',
                sub: null
            }]
        }]}]
    };
    var getMenuItem = function (itemData) {
        var item = $("<li>")
            .append(
        $("<a>", {
            href: '#' + itemData.link,
          
            html: itemData.name
        }));
        if (itemData.sub) {
            var subList = $("<ul>");
            $.each(itemData.sub, function () {
                subList.append(getMenuItem(this));
            });
            item.append(subList);
        }
        return item;
    };
    
    var $menu = $("#menu");
    $.each(data.menu, function () {
        $menu.append(
            getMenuItem(this)
        );
    });
    $menu.menu();
    
   
    
  /*  $(document).on("click",".ui-menu-item",function() {
        alert($(this).children().length);
    });*/
});
function addrow1(){
    addrow('profitLossTable'); 
};
function addrow(tableid) {        
        var sourcetr = $('#' + tableid + ' tr:last').prev("tr");
        var targettr = sourcetr.clone();
        var elementx = sourcetr.after(targettr);
        var targetinputarr=targettr.find("input");
        targetinputarr.each(function (){  
            var targetinput=$(this);
            targetinput.val('');
            if(targetinput.attr("id")){    
            var currentnum=targetinput.attr("id").match(/\d+$/);                    
            targetinput.attr("id",targetinput.attr("id").replace(currentnum,parseInt(currentnum)+1));
            targetinput.attr("name",targetinput.attr("name").replace(currentnum,parseInt(currentnum)+1));
            targetinput.attr("disabled",false);
            }
        });
    }
function deleteRow1(){
    deleteRow('profitLossTable'); 
};
function deleteRow(tableId){
    
    var ids=new Array();
    
    $("#"+tableId).find(':checkbox').each(function (){   
        
        alert($(this).is(":checked"));
        if ($(this).is(":checked")){
            //alert("checked");
            ids.push($(this).val());
            //alert($("#"+tableId).find('tr').size());
            
        }
        
    });
    $("#"+tableId).find(':checkbox').each(function (){
    if($(this).is(":checked")){
            
        $(this).closest("tr").remove();
        }else{
            alert("Can not delete the last row");
        }
    });
    //alert(ids.join(","));
    
    
}
function editRow(val){
	
	$('#product_'+val).prop("disabled", false);
	$('#desc_'+val).prop("disabled", false);
	
}
</script>
</head>
<body>
<form action="/products" method="post" enctype="multipart/form-data">
<ul id="menu"></ul>
<ul id="menu1"></ul>

<table border="2" width="70%" cellpadding="2" id="profitLossTable">  

<tr> <th align="left">&nbsp;</th><th>Product</th><th>Description</th><th>Image</th><th>Created Date</th><th>Updated Date</th></tr>  
      <c:forEach items="${productList}" varStatus="status" var="dList">
   <tr>  
   <td>
                                                     <input type="checkbox" value="${dList.id}"> 
                                                     <input type="hidden" name="chkBox${status.index}"
                                    id="chkBox_${status.index}"  
                                    value="${dList.id}"
                                    
                                    class="true" style="text-align:left;" maxlength="4"  disabled="disabled" />
                                                     
                         </td>
   
   <td><input type="text" name="productList[${status.index}].product"
                                    id="product_${status.index}"  
                                    value="${dList.product}"
                                    class="true" style="text-align:left;width: 100%;"  disabled="disabled" /></td>  
   <td><input type="text" name="productList[${status.index}].description"
                                    id="description_${status.index}"  
                                    value="${dList.description}"
                                    class="true" style="text-align:left;width: 100%;"  disabled="disabled" /></td>  
   <td><input type="file" name="productList[${status.index}].file" id="file_${status.index}"  
                                    value="${dList.file}" disabled="disabled"/></td>  
   <td><input type="text" name="productList[${status.index}].createdDate"
                                    id="createdDate_${status.index}"  
                                    value="${dList.createdDate}"
                                    class="true" style="text-align:left;width: 100%;"  disabled="disabled" /></td> 
   <td><input type="text" name="productList[${status.index}].updatedDate"
                                    id="updatedDate_${status.index}"  
                                    value="${dList.updatedDate}"
                                    class="true" style="text-align:left;width: 100%;"  disabled="disabled" /></td> 
<%--    <td><a href="#" id="editLink_${status.index}" onclick="editRow(${status.index})">Edit</a></td>   --%>
<%--    <td><a href="deleteemp/${emp.id}">Delete</a></td>   --%>
   </tr>  
   </c:forEach>
     <tr valign="bottom" id="addrow">
                         <td colspan="3" align="left"><a href="#" id="alternativeRow" class="alternativeRow" onclick="addrow1()"> +Add Row</a></td>
                         <td colspan="3" align="left"><a href="#" id="deleteRow" class="alternativeRow" onclick="deleteRow1()" > +delete</a></td>
                    </tr>
   </table>  
     

    <input type="submit" value="Submit" />
    </form>

		
</body>
</html>
