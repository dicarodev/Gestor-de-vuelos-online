<%--
  Created by IntelliJ IDEA.
  User: MrWiskers
  Date: 12/02/2024
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
    <head>
        <title>Histórico de compras</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Vuela Conmigo</a>
                </div>
                <ul class="nav navbar-nav">
                    <c:if test="${userRole == 'Administrador'}">
                        <li class="active"><a href="../listFlights">Vuelos</a></li>
                        <li><a href="../listClients">Clientes</a></li>
                    </c:if>

                    <c:if test="${userRole == 'Cliente'}">
                        <li class="active"><a href="listFlights">Vuelos</a></li>
                        <li><a href="listPurchases">Histórico de compras</a></li>
                    </c:if>
                </ul>
                <c:if test="${userRole == 'Administrador'}">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="../logout"><span class="glyphicon glyphicon-user"></span> Cerrar sesión</a></li>
                    </ul>
                </c:if>
                <c:if test="${userRole == 'Cliente'}">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="logout"><span class="glyphicon glyphicon-user"></span> Cerrar sesión</a></li>
                    </ul>
                </c:if>
            </div>
        </nav>

        <section class="p-8">
            <h1 class="text-3xl font-bold mb-4 text-center">Histórico de compras</h1>

            <table class="table table-striped table-bordered">
                <thead class="bg-gray-200 text-gray-700">
                <tr>
                    <th>ID Compra</th>
                    <th>Fecha de compra</th>
                    <th>Método de pago</th>
                    <th>Billetes</th>
                    <th>Acompañantes</th>
                    <c:if test="${userRole == 'Cliente'}">
                        <th colspan="3" class="text-center">Vuelo</th>
                    </c:if>
                    <c:if test="${userRole == 'Administrador'}">
                        <th colspan="4" class="text-center">Vuelo</th>
                    </c:if>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="purchase" items="${purchaseList}">
                    <tr>
                        <td class="py-2 px-4">${purchase.idSale}</td>
                        <td class="py-2 px-4">${purchase.dateSale}</td>
                        <td class="py-2 px-4">${purchase.paymentMethod}</td>
                        <td class="py-2 px-4">${purchase.amountTickets}</td>
                        <td class="py-2 px-4">${purchase.companions}</td>
                        <td class="py-2 px-4">Origen: ${purchase.flight.origin}</td>
                        <td class="py-2 px-4">Destino: ${purchase.flight.destination}</td>
                        <td class="py-2 px-4">Hora salida: ${purchase.flight.departureTime}</td>
                        <c:if test="${userRole == 'Administrador'}">
                            <td class="py-2 px-4"><a href="../purchase/${purchase.flight.idFlight}" class="text-blue-500 hover:text-blue-700">Ver vuelo</a></td>
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
