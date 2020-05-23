<%@include file="templates/header.jsp" %>
<%@include file="templates/menuInicio.jsp" %>

<c:if test="${not empty admin}">
    
    <div class="row">
        <div class="col s6 offset-s3">
            <div class="card-panel">
                <h4>Enviar Mensaje</h4>
                <form action="control.do" method="post">
                    <div class="row valign-wrapper">
                        <div class="col s7">
                            <div class="input-field">
                                <select name="codigo">
                                    <c:forEach items="${servicio.ofertas}" var="o">
                                        <option value="${o.codigo}">${o.titulo}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col s3">
                            <button class="btn-floating z-depth-3" name="btn" value="buscaroferta">
                                <i class="material-icons">search</i>
                            </button>
                                   
                        </div>
                    </div>
                </form>
                
                <div class="row">
                    <table class="bordered responsive-img">
                        <tr>
                            <td>RUT</td>
                            <td>Nombre</td>
                            <td>Apellido</td>
                            <td></td>
                        </tr>
                        <c:forEach items="${lista}" var="p">
                            <tr>
                                <td>${p.rut}</td>
                                <td>${p.nombre}</td>
                                <td>${p.apellido}</td>
                                <td>
                                    <a href="enviarmensaje2.jsp?rut=${p.rut}" class="btn-floating blue">
                                        <i class="material-icons">email</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
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