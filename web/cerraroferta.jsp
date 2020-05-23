<%@include file="templates/header.jsp" %>
<%@include file="templates/menuInicio.jsp" %>

<c:if test="${not empty admin}">
    <div class="row">
    <div class="col s6 offset-s3 white">
        <h4>Cerrar Oferta</h4>
        <table class="bordered highlight">
            <tr>
                <th>Código</th>
                <th>Título</th>
                <th>Descripción</th>
                <th></th>
            </tr>
            
                <c:forEach items="${servicio.getOfertas2()}" var="p">
                    <tr>
                        <td>${p.codigo}</td>
                        <td>${p.titulo}</td>
                        <td>${p.descripcion}</td>
                        <td>
                            <c:if test="${p.estaActiva eq true}">
                                <a href="cerraroferta2.jsp?codigo=${p.codigo}&titulo=${p.titulo}&descripcion=${p.descripcion}&estado=${p.estaActiva}"
                                   class="btn-floating red">
                                        <i class="material-icons">lock_outline</i>
                                </a>
                            </c:if>
                            <c:if test="${p.estaActiva eq false}">
                                <a href="#" class="btn-floating green">
                                    <i class="material-icons">lock_open</i>
                                </a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            
        </table>
    </div>
</div>

</c:if>

<c:if test="${empty admin}">
    <p>
        Primero debes iniciar sesión. <a href="index.jsp">Click  
        aquí para ser redireccionado.</a>
    </p>
</c:if>


<%@include file="templates/footer.jsp" %>