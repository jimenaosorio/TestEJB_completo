<%@include file="templates/header.jsp" %>
<%@include file="templates/menuInicio.jsp"%>

<c:if test="${not empty rut or not empty admin}">
    <div class="row">
    <div class="col s6 offset-s3 white">
    <h1>Postular</h1>
    <form method="post" action="control.do">
        <div class="input-field col s12">
            <input name="codigo" id="codigo" type="text" value="${oferta.codigo}">
            <label for="codigo">C�digo</label>
        </div>
        <div class="input-field col s12">
            <input name="titulo" id="titulo" type="text" value="${oferta.titulo}">
            <label for="titulo">T�tulo</label>
        </div>
        <div class="input-field col s12">
            <input name="descripcion" id="descripcion" type="text" value="${oferta.descripcion}">
            <label for="descripcion">Descipci�n</label>
        </div>
        <div class="col">
             <button type="submit" name="btn" value="postular"
                   class="waves-effect waves-light btn right">Postular</button>
         </div>
        
    </form>
    </div>
    </div>
    
    
    
    
</c:if>
<c:if test="${empty rut and empty admin}">
    <p>No est� autorizado para estar aqu�</p>
    <p>
        <a href="index.jsp">Click aqu� para ser redireccionado</a>
    </p>
</c:if>




<%@include file="templates/footer.jsp" %>
           
