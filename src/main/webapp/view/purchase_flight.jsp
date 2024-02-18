<%--
  Created by IntelliJ IDEA.
  User: MrWiskers
  Date: 12/02/2024
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
    <head>
        <title>Comfirmar compra</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Vuela Conmigo</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="../listFlights">Vuelos</a></li>
                    <c:if test="${userRole == 'Administrador'}">
                        <li><a href="../listClients">Clientes</a></li>
                    </c:if>

                    <c:if test="${userRole == 'Cliente'}">
                        <li><a href="../listPurchases">Histórico de compras</a></li>
                    </c:if>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="../logout"><span class="glyphicon glyphicon-user"></span> Cerrar sesión</a></li>
                </ul>
            </div>
        </nav>

        <section class="p-8">
            <form class="form-horizontal" modelAttribute="purchaseFlight" method="post">
                <fieldset>

                    <legend class="text-center">Vuelo</legend>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="nationalFlight">Nacional / Internacional</label>
                        <div class="col-md-4">
                            <c:if test="${purchaseFlight.nationalFlight}">
                                <input type="text" id="nationalFlight" name="nationalFlight" value="Vuelo Nacional" class="form-control imput-md" readonly="true"/>
                            </c:if>
                            <c:if test="${!purchaseFlight.nationalFlight}">
                                <input type="text" id="nationalFlight" name="nationalFlight" value="Vuelo Internacional" class="form-control imput-md" readonly="true"/>
                            </c:if>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="origin">Origen</label>
                        <div class="col-md-4">
                            <input type="text" id="origin" name="origin" value="${purchaseFlight.origin}" class="form-control imput-md" readonly="true"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="destination">Destino</label>
                        <div class="col-md-4">
                            <input type="text" id="destination" name="destination" value="${purchaseFlight.destination}" class="form-control imput-md" readonly="true"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="dateFlight">Fecha</label>
                        <div class="col-md-4">
                            <input type="date" id="dateFlight" name="dateFlight" value="${purchaseFlight.dateFlight}" class="form-control imput-md" readonly="true"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="availableSeats">Plazas disponibles</label>
                        <div class="col-md-4">
                            <input type="number" id="availableSeats" name="availableSeats" value="${purchaseFlight.availableSeats}" class="form-control imput-md" readonly="true"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="departureTime">Salida</label>
                        <div class="col-md-4">
                            <input type="text" id="departureTime" name="departureTime" value="${purchaseFlight.arrivalTime}" class="form-control imput-md" readonly="true"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="arrivalTime">Llegada</label>
                        <div class="col-md-4">
                            <input type="text" id="arrivalTime" name="arrivalTime" value="${purchaseFlight.departureTime}" class="form-control imput-md" readonly="true"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="duration">Duración</label>
                        <div class="col-md-4">
                            <input type="text" id="duration" name="duration" value="${purchaseFlight.duration}" class="form-control imput-md" readonly="true"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="capacity">Capacidad</label>
                        <div class="col-md-4">
                            <input type="number" id="capacity" name="capacity" value="${purchaseFlight.capacity}" class="form-control imput-md" readonly="true"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="price">Precio</label>
                        <div class="col-md-4">
                            <input type="number" id="price" name="price" value="${purchaseFlight.price}" class="form-control imput-md" readonly="true"/>
                        </div>
                    </div>
                </fieldset>
            </form>

            <c:if test="${userRole == 'Cliente'}">
                <form class="form-horizontal" action="../processPurchase" modelAttribute="purchaseFlight" method="post">
                    <fieldset>

                        <legend class="text-center">Confirmar compra</legend>

                        <div class="form-group">
                            <label class="col-md-4 control-label" for="idFlight">ID Vuelo</label>
                            <div class="col-md-4">
                                <input type="number" id="idFlight" name="idFlight" value="${purchaseFlight.idFlight}" class="form-control imput-md" readonly="true"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-4 control-label" for="paymentMethod">Nacional / Internacional</label>
                            <div class="col-md-4">
                                <select id="paymentMethod" name="paymentMethod" class="form-control">
                                    <option value="Tarjeta de credito">Tarjeta de credito</option>
                                    <option value="Transferencia">Transferencia</option>
                                    <option value="Paypal">Paypal</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-4 control-label" for="amountTickets">Cantidad de billetes</label>
                            <div class="col-md-4">
                                <input type="number" id="amountTickets" name="amountTickets" value="1" class="form-control imput-md"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-4 control-label" for="companions">Acompañantes</label>
                            <div class="col-md-4">
                                <input type="text" id="companions" name="companions" value="" class="form-control imput-md"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-4 control-label" for="confirmarCompra"></label>
                            <div class="col-md-4">
                                <button id="confirmarCompra" class="btn btn-primary" type="submit">Confirmar compra</button>
                                <a href="../listFlights" class="btn btn-danger">Cancelar</a>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </c:if>
        </section>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    </body>
</html>
