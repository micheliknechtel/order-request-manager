<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <script type="text/javascript" src="./jquery-latest.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js">
    </script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
          crossorigin="anonymous">
    <script type="text/javascript">
        function init() {
            timeDisplay = document.createTextNode("");
            document.getElementById("clock").appendChild(timeDisplay);
        }

        function updateVisit() {
            visitDisplay = document.createTextNode("");
            document.getElementById("visits").appendChild(visitDisplay);

            var counter = Cookies.get('counter');
            if (counter == null) {
                console.log(counter);
                counter = 1;
            } else {
                counter = Number(counter) + 1;
            }
            Cookies.set('counter', counter);
            document.getElementById("visits").firstChild.nodeValue = counter;
        }

        function updateClock() {
            var currentTime = new Date();

            var currentHours = currentTime.getHours();
            var currentMinutes = currentTime.getMinutes();
            var currentSeconds = currentTime.getSeconds();

            // Pad the minutes and seconds with leading zeros, if required
            currentMinutes = (currentMinutes < 10 ? "0" : "") + currentMinutes;
            currentSeconds = (currentSeconds < 10 ? "0" : "") + currentSeconds;

            // Choose either "AM" or "PM" as appropriate
            var timeOfDay = (currentHours < 12) ? "AM" : "PM";

            // Convert the hours component to 12-hour format if needed
            currentHours = (currentHours > 12) ? currentHours - 12 : currentHours;

            // Convert an hours component of "0" to "12"
            currentHours = (currentHours == 0) ? 12 : currentHours;

            // Compose the string for display
            var currentTimeString = currentHours + ":" + currentMinutes + ":" + currentSeconds + " " + timeOfDay;

            // Update the time display
            document.getElementById("clock").firstChild.nodeValue = currentTimeString;
        }
    </script>
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
            <a class="navbar-brand" href="#">Spring-boot Example</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="http://ec2-3-137-215-86.us-east-2.compute.amazonaws.com:8080/">Home</a></li>
                <li><a href="https://github.com/micheliknechtel/order-request-manager">Git Repository</a></li>
                <li><a href="https://www.linkedin.com/in/micheliknechtel/">Linkedin</a></li>
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
            <th>Order Request ID</th>
            <th>Client</th>
            <th>Device Brand</th>
        </tr>
        </thead>
    </table>

    <a href="http://ec2-3-137-215-86.us-east-2.compute.amazonaws.com:8080/admin/createOsNew/">New Order Request</a>
    </br>

    </form>
</div>
<hr />
<div class="footer">
    <p>2021 Micheli Knechtel,&nbsp;Visits:&nbsp;<span id="visits">&nbsp;</span>,&nbsp;&nbsp;<span id="clock">&nbsp;</span></p>

</div>
</div>

</body>

<script type="text/javascript"  >
    $(document).ready(function() {
        $('#example').DataTable({
            "Processing": true,
            "ajax": {
                "url": "http://ec2-3-137-215-86.us-east-2.compute.amazonaws.com:8080/admin/listOs",
                "dataSrc": ""
            },
            "columns": [
                { "data": "id" ,
                    "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
                        $(nTd).html("<a href='/admin/details/"+oData.id+"'>"+oData.id+"</a>");
                    }
                } ,
                { "data": "client.name" ,
                    "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
                        $(nTd).html("<a href='/geraRelatorio/?id="+oData.id+"'>"+oData.client.name+"</a>");
                    }
                } ,
                {"data": "equipment.brand"}

            ]
        });
    });
</script>
</html>