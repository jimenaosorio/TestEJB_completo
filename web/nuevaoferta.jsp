<%@include file="templates/header.jsp" %>
<%@include file="templates/menuInicio.jsp" %>

<c:if test="${not empty admin}">
    <!-- Código -->
    
    <div class="row">
    <div class="col s6 offset-s3 white">
    <h4>Nueva Oferta</h4>
    <form method="post" action="control.do">
        <div class="input-field col s12">
            <input name="codigo" id="codigo" type="text" >
            <label for="codigo">Código</label>
        </div>
        <div class="input-field col s12">
            <input name="titulo" id="titulo" type="text" >
            <label for="titulo">Título</label>
        </div>
        <div class="input-field col s12">
            <input name="descripcion" id="descripcion" type="text" >
            <label for="descripcion">Descripción</label>
        </div>
        <div class="col s12">
             <button type="submit" name="btn" value="ingresar_oferta"
                   class="waves-effect waves-light btn right">Ingresar Oferta</button>
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
        No está registrado para estar aquí.
        <a href="index.jsp">Ir al inicio</a>
    </p> 
</c:if>

<%@include file="templates/footer.jsp" %>