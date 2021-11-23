<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script type="text/javascript" src="../jquery-latest.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js">


    </script>

</head>
<body>
<h1>Order Request</h1>
<table width="100%" class="display" id="example">
    <thead>
    <tr>
        <th>Order Request ID</th>
        <th>Client</th>
        <th>Device Brand</th>
    </tr>
    </thead>
</table>

<a href="http://localhost:8080/admin/createOsNew/">New Order Request</a>
</br>

</body>

<script type="text/javascript">
$(document).ready(function() {
  $('#example').DataTable({
    "Processing": true,
      "ajax": {
    "url": "http://localhost:8080/admin/listOs",
    "dataSrc": ""
      },
      "columns": [
    { "data": "id" ,
     "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
            $(nTd).html("<a href='/admin/details/"+oData.id+"'>"+oData.id+"</a>");
        }
    } ,
    { "data": "client.name" },
    {"data": "equipment.brand"}

]
    });
});
</script>
</html>