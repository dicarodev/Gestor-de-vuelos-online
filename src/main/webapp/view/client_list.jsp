<%--
  Created by IntelliJ IDEA.
  User: MrWiskers
  Date: 13/02/2024
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
    <head>
        <title>Clientes</title>
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
            <h1 class="text-3xl font-bold mb-4 text-center">Listado de usuarios</h1>

            <div class="flex justify-center  mb-4">
                <a href="registerUser" class="btn btn-primary">Agregar usuario administrador</a>
            </div>

            <table class="table table-striped table-bordered">
                <thead class="bg-gray-200 text-gray-700">
                <tr>
                    <th>ID User</th>
                    <th>Rol</th>
                    <th>Nombre</th>
                    <th>Apellidos</th>
                    <th>Dirección</th>
                    <th>Teléfono</th>
                    <th>Email</th>
                    <th>Compras</th>
                    <th colspan="3" class="text-center">Gestiones</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="user" items="${userList}">
                    <tr>
                        <td class="py-2 px-4">${user.idUser}</td>
                        <td class="py-2 px-4">${user.rol}</td>
                        <td class="py-2 px-4">${user.name}</td>
                        <td class="py-2 px-4">${user.surnames}</td>
                        <td class="py-2 px-4">${user.address}</td>
                        <td class="py-2 px-4">${user.phone}</td>
                        <td class="py-2 px-4">${user.mail}</td>
                        <td class="py-2 px-4">${user.purchaseList.size()}</td>
                        <td class="py-2 px-4"><a href="editUser/${user.idUser}" class="text-blue-500 hover:text-blue-700">Editar cliente</a></td>
                        <td class="py-2 px-4"><a href="removeUser/${user.idUser}" class="text-red-500 hover:text-red-700">Eliminar cliente</a></td>
                        <td class="py-2 px-4"><a href="listPurchases/${user.idUser}" class="text-blue-500 hover:text-blue-700">Ver compras</a></td>
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
