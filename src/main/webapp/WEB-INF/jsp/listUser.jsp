<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script type="text/javascript" src="./jquery-latest.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js">
    </script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
          crossorigin="anonymous">
</head>
<body>
<!-- Fixed navbar -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Docker Helloworld</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="https://github.com/micheliknechtel">About</a></li>
                <li><a href="https://www.linkedin.com/in/micheliknechtel/">Contact</a></li>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</nav>
iv class="container theme-showcase" role="main">

<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron">
    <center><h2> Service Order Management</h2></center>
    </br>
    </br>
    </br>

    <!-- /container -->

    <table width="97%" class="display" id="example">
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
</div>
<hr />
<div class="footer">
    <p>2021 Micheli Knechtel,&nbsp;Visits:&nbsp;<span id="visits">&nbsp;</span>,&nbsp;&nbsp;<span id="clock">&nbsp;</span></p>
    <div title="The container ID is the ID of the container (or host) that is the helloworld application.">Container
        ID: HOSTNAME
    </div>
</div>
</div>

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