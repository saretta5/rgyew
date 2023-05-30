<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Tum4World</title>

    <% if(session.getAttribute("ruolo")==null) { %>
    <link rel="stylesheet" href="css/base.css">
    <%} else if(session.getAttribute("ruolo").equals("Admin")){ %>
    <link rel="stylesheet" href="css/amministratore.css">
    <%} else if(session.getAttribute("ruolo").equals("Aderente")){ %>
    <link rel="stylesheet" href="css/aderente.css">
    <%} else if(session.getAttribute("ruolo").equals("Simpatizzante")){ %>
    <link rel="stylesheet" href="css/simpatizzante.css">
    <%}%>

</head>
<body>
<div class="text-white fixed-top">
    <h1 class="text-center">Turn4World</h1>
    <nav class="navbar" data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">Home</a>
            <a class="navbar-brand" href="chi_siamo.jsp">Chi siamo</a>
            <a class="navbar-brand" href="attività.jsp">Attività</a>
            <a class="navbar-brand" href="contatti.jsp">Contatti</a>
            <% if(session.getAttribute("logged")!=null && session.getAttribute("logged") == Boolean.TRUE) {%>
            <a class="navbar-brand" href="#">Profilo</a>
            <a class="navbar-brand" href="#">Logout</a>
            <%} else { %>
            <a class="navbar-brand" href="sign_in.jsp">Sign-in</a>
            <a class="navbar-brand" href="login.jsp">Login</a>
            <% } %>
        </div>
    </nav>
</div>
<div class="container text-center">
    <div class="w-25 mx-auto p-2" style="position: absolute;top: 30%;left:38%">
        <p><h6>Indirizzo: Turn4World, via Fittizia 0, Citta Fittizia</h6></p>
        <p><h6>Numero di telefono: +00 000 000 0000</h6></p>
        <form name="contattiForm" action="ContattiServlet" method="post" class="row g-3">
        <div class="row-auto">
            <h3>Contattaci</h3>
        </div>
        <div class="row-auto">
            <input type="text" class="form-control" name="nomecognomecont" placeholder="Nome e Cognome">
        </div>
        <div class="row-auto">
            <input type="text" class="form-control"  name="emailcont" placeholder="Email">
        </div>
        <div class="row-auto">
            <select class="form-select" aria-label="Default select example" nome="ruolosignin">
                <option value="1">Motivo 1</option>
                <option value="2">Motivo 2</option>
                <option value="3">Altro</option>
            </select>
        </div>
        <div class="row-auto">
            <textarea class="form-control" placeholder="Qualche informazione in più..."  rows="3"></textarea>
        </div>
        <div class="row-auto">
            <button type="button" onclick="ValidateEmail()" class="btn btn-primary mb-3">Invia</button>
            <button type="reset" class="btn btn-primary mb-3">Reset</button>
        </div>
        </form>
    </div>
</div>
<div class="text-white fixed-bottom">
    <p class="fst-italic text-center">Turn4World, via Fittizia 0, CAP: 16000, Citta Fittizia, Nazione Fittizia</p>
</div>
</body>
</html>


<script>
    function ValidateEmail(){
        let x = document.forms["contattiForm"]["emailcont"].value;
        if(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(x)){
            location.reload();
            //document.forms['contattiForm'].submit();
        }else{
            alert("Hai inserito un'email invalida!");
        }
    }
</script>