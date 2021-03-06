<%--
  Created by IntelliJ IDEA.
  User: lrz0927
  Date: 19/3/17
  Time: 4:40 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<title>Individual Session</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<style>
    body, h1, h2, h3, h4, h5, h6 {
        font-family: "Lato", sans-serif
    }

    .w3-navbar, h1, button {
        font-family: "Montserrat", sans-serif
    }

    .fa-anchor, .fa-coffee {
        font-size: 200px
    }
</style>
<body>

<!-- Navbar -->
<div class="w3-top">
    <ul class="w3-navbar w3-indigo w3-card-2 w3-left-align w3-large">
        <li class="w3-hide-medium w3-hide-large w3-opennav w3-right">
            <a class="w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()"
               title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
        </li>
        <li><a href="../index.jsp" class="w3-padding-large w3-white">Home</a></li>
        <li class="w3-hide-small"><a href="main_features.jsp" class="w3-padding-large w3-hover-white">Main Features</a></li>
        <li class="w3-hide-small"><a href="benefit.jsp" class="w3-padding-large w3-hover-white">Benefit for your code</a></li>
        <li class="w3-hide-small"><a href="about_us.jsp" class="w3-padding-large w3-hover-white">About us</a></li>
    </ul>

    <!-- Navbar on small screens -->
    <div id="navDemo" class="w3-hide w3-hide-large w3-hide-medium">
        <ul class="w3-navbar w3-left-align w3-large w3-black">
            <li><a class="w3-padding-large" href="main_features.jsp">Main Features</a></li>
            <li><a class="w3-padding-large" href="benefit.jsp">Benefit for your code</a></li>
            <li><a class="w3-padding-large" href="about_us.jsp">About us</a></li>
        </ul>
    </div>
</div>

<!-- Header -->
<header class="w3-container w3-blue w3-center w3-padding-64">
    <h1 class="w3-margin w3-jumbo">Choose your test</h1>
    <table id = "1">
        <form class="w3-left-align">
            <tr>
                <input  type="radio" name="test" value="webbank"> web bank<br></tr>
            <tr>
                <input  type="radio" name="test" value="test2"> test2<br>
            </tr>
        </form>
    </table>
    <button class="w3-btn w3-padding-8 w3-large w3-margin-top" onclick="Selection()" type="button">Confirm
    </button>
</header>
<script language="JavaScript">
    function Selection() {
        var xmlhttp;
        if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        }
        else {// code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        var Selection = document.getElementById("1").value;
        Selection = encodeURI(encodeURI(Selection));
        xmlhttp.open("POST", "/Selection", true);
        xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlhttp.send("Selection=" + Selection + "&publicDNS="+ window.location.href.split("?")[1].split("=")[1]);
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    window.open('http://'+xmlhttp.getResponseHeader('publicDNS')+':8080/webbank');
            }
        }
    }
</script>
<script>
    // Used to toggle the menu on small screens when clicking on the menu button
    function myFunction() {
        var x = document.getElementById("navDemo");
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
        } else {
            x.className = x.className.replace(" w3-show", "");
        }
    }
</script>

</body>
</html>
