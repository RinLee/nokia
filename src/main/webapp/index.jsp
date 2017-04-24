<%@ page isELIgnored="false"%>
<html>
<body>
<h2>Hello World!${userInfo.userName}</h2>
</body>
<script type="text/javascript">
    function change(){
        document.getElementById("body1").innerHTML += "<script type='text/javascript' src='jquery.min.js'><\/script>";
}
</script>

</html>
