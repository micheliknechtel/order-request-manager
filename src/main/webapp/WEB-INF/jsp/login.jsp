<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A simple docker helloworld example.">
    <meta name="author" content="Micheli Knechtel">
    <meta name="viewport" content="width=device-width, initial-scale=1">

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

<body onload="updateVisit(); updateClock(); setInterval('updateClock()', 1000 )">
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

<div class="container theme-showcase" role="main">

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
        <h1>Service Order Management</h1>
        </br>
        </br>
        </br>


        <form action="/doLogin" method="POST">
            <table>
                <tr>
                    <td>Login</td>
                    <td><input type="text" name="login" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Sign in" /></td>
                </tr>

            </table>
            <a href="http://ec2-3-137-215-86.us-east-2.compute.amazonaws.com:8080/createUser.html">Create an account</a>
        </form>
    </div>
    <hr />
    <div class="footer">
        <p>2021 Micheli Knechtel,&nbsp;Visits:&nbsp;<span id="visits">&nbsp;</span>,&nbsp;&nbsp;<span id="clock">&nbsp;</span></p>

    </div>
</div> <!-- /container -->
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.1.1/js.cookie.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
        crossorigin="anonymous"></script>
</body>

</html>
