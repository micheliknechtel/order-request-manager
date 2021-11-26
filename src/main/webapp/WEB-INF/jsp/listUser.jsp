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
<h1>List of User</h1>

<table width="100%" class="display" id="example">
    <thead>
    <tr>
        <th>ID</th>
        <th>Login</th>
        <th>Password</th>
    </tr>
    </thead>
</table>

<a href="http://ec2-3-137-215-86.us-east-2.compute.amazonaws.com:8080/createUser.html">Create New User</a>
</br>
<a href="http://ec2-3-137-215-86.us-east-2.compute.amazonaws.com:8080">Login</a>
</body>

<script type="text/javascript">
$(document).ready(function() {
  $('#example').DataTable({
    "Processing": true,
      "ajax": {
    "url": "http://ec2-3-137-215-86.us-east-2.compute.amazonaws.com:8080/list",
    "dataSrc": ""
      },
      "columns": [
    { "data": "id" } ,
    { "data": "login" },
    { "data": "password" }
      ]
    });
});
</script>
</html>
