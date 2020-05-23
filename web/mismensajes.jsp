<%@page import="modelo.Postulante"%>
<%@include file="templates/header.jsp" %>


<%
    String rut=(String)request.getSession().getAttribute("rut");
    Postulante postulante=servicio.buscarPostulante(rut);
%>

<c:set var="postulante" scope="page" value="<%=postulante%>"/>


<%@include file="templates/menuInicio.jsp"%>

<c:if test="${not empty rut or not empty admin}">
    
    <div class="row">
        <div class="col s6 offset-s3 white">
            <table class="bordered highlight">
                <tr>
                    <th width="30%">Asunto</th>
                    <th>Contenido</th>
                    
                </tr>
                <c:forEach items="${postulante.misMensajes}" var="p">
                    <tr>
                        <td>${p.asunto}</td>
                        <td>${p.contenido}</td>
                        
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    
    
</c:if>
<c:if test="${empty rut and empty admin}">
    <p>No está autorizado para estar aquí</p>
    <p>
        <a href="index.jsp">Click aquí para ser redireccionado</a>
    </p>
</c:if>




<%@include file="templates/footer.jsp" %>
           
