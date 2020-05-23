<%@page import="javax.naming.InitialContext"%>
<%@page import="beans.ServicioLocal"%>
<%@page import="modelo.Postulante"%>
<%@include file="templates/header.jsp" %>


<%@include file="templates/menuInicio.jsp"%>

<c:if test="${not empty rut or not empty admin}">
    
    <%
    String rut=(String)request.getSession().getAttribute("rut");
    Postulante postulante=servicio.buscarPostulante(rut);
    %>
    
    <c:set var="postulante" scope="page" value="<%=postulante%>" />
    
    <div class="row">
    <div class="col s6 offset-s3 white">
    <h1>Postular</h1>
    <form method="post" action="control.do">
        <div class="input-field col s12">
            <input name="profesion" id="profesion" type="text" value="${postulante.miPerfil.profesion}">
            <label for="profesion">Profesión</label>
        </div>
        <div class="input-field col s12">
            <input name="experiencia" id="experiencia" type="text" value="${postulante.miPerfil.experiencia}">
            <label for="experiencia">Experiencia</label>
        </div>
        <div class="input-field col s12">
            <input name="presentacion" id="presentacion" type="text" value="${postulante.miPerfil.presentacion}">
            <label for="presentacion">Presentacion</label>
        </div>
        <div class="col s12">
             <button type="submit" name="btn" value="ingresar_perfil"
                   class="waves-effect waves-light btn right">Ingresar Perfil</button>
         </div>
            
         <div class="col s12">
             ${requestScope.msg}
         </div>   
        
    </form>
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
           
