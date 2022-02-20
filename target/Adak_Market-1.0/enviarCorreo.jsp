<%-- 
    Document   : iniciar_sesion
    Created on : 19/05/2021, 08:26:06 AM
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="myCss/formulariosUsuario.css">
    <link rel="stylesheet" href="css/all.css">
    <link rel="short icon" href="img/Logotipo Adak.png">
    <title>Contactar</title>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="jumbotron">
                <h1 style="text-align: center;">Enviar e-mail</h1>
            </div>
            <form method="POST" action="<%=request.getContextPath()%>/SendMail?accion=email" id="emailForm" class="container">
                <div class="form-group">
                    <label>Nombre</label>
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon"><i class="fa fa-fw fa-user" aria-hidden="true"></i></div>
                        <input type="text" class="form-control" name="nombre" placeholder="Nombre"/>
                    </div>
                </div>
                <div class="form-group">
                    <label>Correo</label>
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon">@</div>
                        <input type="email" class="form-control" name="email" placeholder="ejemplo@gmail.com"/>
                    </div>
                </div>
                <div class="form-group">
                    <label>Asunto</label>
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon"><i class="fa fa-fw fa-envelope-open" aria-hidden="true"></i></div>
                        <input type="text" class="form-control" name="asunto" placeholder="Asunto"/>
                    </div>
                </div>
                <div class="form-group">
                    <label>Mensaje</label>
                    <textarea class="form-control" rows="5" name="contenido"></textarea>
                </div>
                <div style="margin-bottom: 10px">
                    <button type="submit" class="btn btn-success btn-block">Enviar</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
