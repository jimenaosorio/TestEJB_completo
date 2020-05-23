<%@include file="templates/header.jsp" %>
<%@include file="templates/menuInicio.jsp" %>

<c:if test="${not empty admin}">
    
    <div class="row">
    <div class="col s6 offset-s3 white">
    <h4>Enviar Mensaje</h4>
    <form method="post" action="control.do">
        <div class="input-field col s12">
            <input name="rut" id="rut" type="text" value="${param.rut}" >
            <label for="rut">RUT</label>
        </div>
        <div class="input-field col s12">
            <input name="asunto" id="asunto" type="text" value="${param.asunto}" >
            <label for="asunto">Asunto</label>
        </div>
        <div class="input-field col s12">
            <textarea name="contenido" id="contenido" type="text" ></textarea>
            <label for="contenido">Contenido</label>
        </div>
        <div class="col s12">
             <button type="submit" name="btn" value="enviar_mensaje"
                   class="waves-effect waves-light btn right">Enviar</button>
         </div>
         <div class="col s12">
             ${requestScope.msg}
         </div> 
           
        
    </form>
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

