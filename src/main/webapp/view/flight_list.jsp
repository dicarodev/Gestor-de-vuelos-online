<%--
  Created by IntelliJ IDEA.
  User: MrWiskers
  Date: 07/02/2024
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>A vista de pájaro</title>
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
            <h2 class="text-3xl font-bold mb-4 text-center">Filtrar vuelos</h2>

            <form class="form-horizontal" action="filterFlights" method="post">
                <fieldset>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="origin">Origen: </label>
                        <div class="col-md-4">
                            <select id="origin" name="origin" class="form-control">
                                <option value="">Selecciona el origen</option>
                                <c:forEach var="flight" items="${flightList}">
                                    <option value="${flight.origin}">${flight.origin}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="destination">Destino: </label>
                        <div class="col-md-4">
                            <select id="destination" name="destination" class="form-control">
                                <option value="">Selecciona el destino</option>
                                <c:forEach var="flight" items="${flightList}">
                                    <option value="${flight.destination}">${flight.destination}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="dateFlight">Fecha: </label>
                        <div class="col-md-4">
                            <input type="date" id="dateFlight" name="dateFlight" class="form-control imput-md"/>
                        </div>
                    </div>

                    <div class="flex justify-center space-x-4">
                        <button type="submit" class="btn btn-primary">Filtrar</button>
                        <a href="listFlights" class="btn btn-danger">Borrar filtros</a>
                    </div>
                </fieldset>
            </form>

            <h2 class="text-3xl font-bold mb-4 text-center">Listado de vuelos disponibles</h2>

            <c:if test="${userRole == 'Administrador'}">
                <div class="flex justify-center  mb-4">
                    <a href="addFlight" class="btn btn-primary">Agregar vuelo</a>
                </div>
            </c:if>

            <table class="table table-striped table-bordered">
                <thead class="bg-gray-200 text-gray-700">
                <tr>
                    <th>ID Vuelo</th>
                    <th>Nacional / Internacional</th>
                    <th>Origen</th>
                    <th>Destino</th>
                    <th>Fecha</th>
                    <th>Plazas disponibles</th>
                    <th>Salida</th>
                    <th>Llegada</th>
                    <th>Duración</th>
                    <th>Capacidad</th>
                    <th>Precio</th>
                    <th colspan="2" class="text-center">Gestiones</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="flight" items="${flightList}">
                    <tr>
                        <td class="py-2 px-4">${flight.idFlight}</td>

                        <c:if test="${flight.nationalFlight}">
                            <td class="py-2 px-4">Vuelo Nacional</td>
                        </c:if>
                        <c:if test="${!flight.nationalFlight}">
                            <td class="py-2 px-4">Vuelo Internacional</td>
                        </c:if>

                        <td class="py-2 px-4">${flight.origin}</td>
                        <td class="py-2 px-4">${flight.destination}</td>
                        <td class="py-2 px-4">${flight.dateFlight}</td>
                        <td class="py-2 px-4">${flight.availableSeats}</td>
                        <td class="py-2 px-4">${flight.departureTime}</td>
                        <td class="py-2 px-4">${flight.arrivalTime}</td>
                        <td class="py-2 px-4">${flight.duration}</td>
                        <td class="py-2 px-4">${flight.capacity}</td>
                        <td class="py-2 px-4">${flight.price}</td>

                        <c:if test="${userRole == 'Administrador'}">
                            <td class="py-2 px-4"><a href="edit/${flight.idFlight}" class="text-blue-500 hover:text-blue-700">Editar vuelo</a></td>
                            <td class="py-2 px-4"><a href="remove/${flight.idFlight}" class="text-red-500 hover:text-red-700">Eliminar vuelo</a></td>
                        </c:if>

                        <c:if test="${userRole == 'Cliente'}">
                            <c:choose>
                                <c:when test="${flight.availableSeats == 0}">
                                    <td class="py-2 px-4">No hay asientos disponibles</td>
                                </c:when>
                                <c:otherwise>
                                    <td class="py-2 px-4"><a href="purchase/${flight.idFlight}" class="text-blue-500 hover:text-blue-700">Comprar vuelo</a></td>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </section>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    </body>
</html>