<%--
  Created by IntelliJ IDEA.
  User: MrWiskers
  Date: 12/02/2024
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
    <head>
        <title>Registrate</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Vuela Conmigo</a>
                </div>
                <ul class="nav navbar-nav">
                    <c:if test="${userRole == 'Administrador'}">
                        <li class="active"><a href="listFlights">Vuelos</a></li>
                        <li><a href="listClients">Clientes</a></li>
                    </c:if>

                    <c:if test="${userRole == 'Cliente'}">
                        <li><a href="listPurchases">Histórico de compras</a></li>
                    </c:if>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="logout"><span class="glyphicon glyphicon-user"></span> Cerrar sesión</a></li>
                </ul>
            </div>
        </nav>

        <section class="p-8">
            <form:form class="form-horizontal" action="registerUser" modelAttribute="user" method="post">
                <fieldset>
                    <legend>Registro de usuario</legend>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="name">Nombre</label>
                        <div class="col-md-4">
                            <form:input type="text" id="name" path="name" class="form-control imput-md"/>
                            <form:errors path="name" class="text-red-500"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="surnames">Apellidos</label>
                        <div class="col-md-4">
                            <form:input type="text" id="surnames" path="surnames" class="form-control imput-md"/>
                            <form:errors path="surnames" class="text-red-500"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="address">Dirección</label>
                        <div class="col-md-4">
                            <form:input type="text" id="address" path="address" class="form-control imput-md"/>
                            <form:errors path="address" class="text-red-500"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="phone">Teléfono</label>
                        <div class="col-md-4">
                            <form:input type="text" id="phone" path="phone" class="form-control imput-md"/>
                            <form:errors path="phone" class="text-red-500"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="mail">Correo electrónico</label>
                        <div class="col-md-4">
                            <form:input type="email" id="mail" path="mail" class="form-control imput-md"/>
                            <form:errors path="mail" class="text-red-500"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="password">Contraseña</label>
                        <div class="col-md-4">
                            <form:input type="password" id="password" path="password" class="form-control imput-md"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="guardarCambios"></label>
                        <div class="col-md-4">
                            <button id="guardarCambios" class="btn btn-primary" type="submit">Registrar usuario</button>
                            <c:if test="${userRole == 'Administrador'}">
                                <a href="listClients" class="btn btn-danger">Cancelar</a>
                            </c:if>

                            <c:if test="${userRole == null}">
                                <a href="logout" class="btn btn-danger">Cancelar</a>
                            </c:if>

                        </div>
                    </div>
                </fieldset>
            </form:form>
        </section>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    </body>
</html>
