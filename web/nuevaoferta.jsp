<%@include file="templates/header.jsp" %>
<%@include file="templates/menuInicio.jsp" %>

<c:if test="${not empty admin}">
    <!-- C�digo -->
    
    <div class="row">
    <div class="col s6 offset-s3 white">
    <h4>Nueva Oferta</h4>
    <form method="post" action="control.do">
        <div class="input-field col s12">
            <input name="codigo" id="codigo" type="text" >
            <label for="codigo">C�digo</label>
        </div>
        <div class="input-field col s12">
            <input name="titulo" id="titulo" type="text" >
            <label for="titulo">T�tulo</label>
        </div>
        <div class="input-field col s12">
            <input name="descripcion" id="descripcion" type="text" >
            <label for="descripcion">Descripci�n</label>
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
        No est� registrado para estar aqu�.
        <a href="index.jsp">Ir al inicio</a>
    </p> 
</c:if>

<%@include file="templates/footer.jsp" %>