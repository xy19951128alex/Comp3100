<html>
<head>
<title>Page Title</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js">
</script>
<script language= "JavaScript">
function Function1(){ 
var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
var name = document.getElementById("1").value;
name=encodeURI(encodeURI(name));

xmlhttp.open("POST","StartApp",true);
xmlhttp.setRequestHeader("Content-Type", "text/html;charset=UTF-8");
xmlhttp.send("name="+name);
xmlhttp.onreadystatechange=function()
  {

	if(xmlhttp.readyState==4 && xmlhttp.status==200)
	{
			alert("running!");
			function stop()
			{
				$(documemt).ready(function(){
					$('#2').trigger("click");	
				}
				);
				alert("Timeout!");
			}
			setTimeout("stop()",600000);
	}
  }
} 
function Function2(){ 
	var xmlhttp;
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	var name = document.getElementById("2").value;
	name=encodeURI(encodeURI(name));

	xmlhttp.open("POST","StartApp",true);
	xmlhttp.setRequestHeader("Content-Type", "text/html;charset=UTF-8");
	xmlhttp.send("name="+name);
	xmlhttp.onreadystatechange=function()
	  {
		if(xmlhttp.readyState==4 && xmlhttp.status==200)
		{
				alert("Stop app successful!");	
		}
	  }
	} 
</script>
</head>
<form name="form" action="">
<input id=1 type="button" name="action" onclick="Function1()" value="start"></input>
</form>
<form name="form" action="">
<input id=2 type="button" name="action" onclick="Function2()" value="stop"></input>
</form>
</body>
</html>
</html>