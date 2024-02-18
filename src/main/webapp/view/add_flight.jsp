<%--
  Created by IntelliJ IDEA.
  User: MrWiskers
  Date: 09/02/2024
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
    <head>
        <title>Agregar vuelo</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Vuela Conmigo</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="listFlights">Vuelos</a></li>
                    <c:if test="${userRole == 'Administrador'}">
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
            <form:form class="form-horizontal" action="addFlight" modelAttribute="flight" method="post">
                <fieldset>

                    <legend>Añadir nuevo vuelo</legend>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="nationalFlight">Nacional / Internacional</label>
                        <div class="col-md-4">
                            <form:select id="nationalFlight" path="nationalFlight" class="form-control">
                                <form:option value="true">Vuelo Nacional</form:option>
                                <form:option value="false">Vuelo Internacional</form:option>
                            </form:select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="origin">Origen</label>
                        <div class="col-md-4">
                            <form:input type="text" id="origin" path="origin" class="form-control imput-md"/>
                            <form:errors path="origin" class="text-red-500"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="destination">Destino</label>
                        <div class="col-md-4">
                            <form:input type="text" id="destination" path="destination" class="form-control imput-md"/>
                            <form:errors path="destination" class="text-red-500"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="dateFlight">Fecha</label>
                        <div class="col-md-4">
                            <form:input type="date" id="dateFlight" path="dateFlight" class="form-control imput-md"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="availableSeats">Plazas disponibles</label>
                        <div class="col-md-4">
                            <form:input type="number" id="availableSeats" path="availableSeats" class="form-control imput-md"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="departureTime">Hora de salida</label>
                        <div class="col-md-4">
                            <form:input type="text" id="departureTime" path="departureTime" class="form-control imput-md"/>
                            <form:errors path="departureTime" class="text-red-500"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="arrivalTime">Hora de llegada</label>
                        <div class="col-md-4">
                            <form:input type="text" id="arrivalTime" path="arrivalTime" class="form-control imput-md"/>
                            <form:errors path="arrivalTime" class="text-red-500"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="duration">Duración</label>
                        <div class="col-md-4">
                            <form:input type="text" id="duration" path="duration" class="form-control imput-md"/>
                            <form:errors path="duration" class="text-red-500"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="capacity">Capacidad</label>
                        <div class="col-md-4">
                            <form:input type="number" id="capacity" path="capacity" class="form-control imput-md"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="price">Precio</label>
                        <div class="col-md-4">
                            <form:input type="number" id="price" path="price" class="form-control imput-md"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="guardarCambios"></label>
                        <div class="col-md-4">
                            <button id="guardarCambios" class="btn btn-primary" type="submit">Guardar cambios</button>
                            <a href="listFlights" class="btn btn-danger">Cancelar</a>
                        </div>
                    </div>
                </fieldset>
            </form:form>
        </section>
    </body>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
</html>
