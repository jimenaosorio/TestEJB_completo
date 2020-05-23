<%@include file="templates/header.jsp" %>
<%@include file="templates/menuInicio.jsp" %>

<c:if test="${not empty admin}">
    
    <div class="row">
    <div class="col s6 offset-s3 white">
    <h4>Nueva Oferta</h4>
    <form method="post" action="control.do">
        <div class="input-field col s12">
            <input name="codigo" id="codigo" type="text" value="${param.codigo}" readonly>
            <label for="codigo">C�digo</label>
        </div>
        <div class="input-field col s12">
            <input name="titulo" id="titulo" type="text" value="${param.titulo}" readonly>
            <label for="titulo">T�tulo</label>
        </div>
        <div class="input-field col s12">
            <input name="descripcion" id="descripcion" type="text" value="${param.descripcion}" readonly >
            <label for="descripcion">Descripci�n</label>
        </div>
        <div class="col s12">
             <button type="submit" name="btn" value="cerrar_oferta"
                   class="waves-effect waves-light btn right red">Cerrar Oferta</button>
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
        Primero debes iniciar sesi�n. <a href="index.jsp">Click  
        aqu� para ser redireccionado.</a>
    </p>
</c:if>


<%@include file="templates/footer.jsp" %>
