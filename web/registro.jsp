<%@include file="templates/header.jsp" %>
<%@include file="templates/menuInicio.jsp" %>

<div class="row">
    <div class="col s6 offset-s3 white">
        <form method="post" action="control.do">
            <div class="input-field col s12">
                <input id="rut" name="rut" type="text" class="validate">
                <label for="rut">RUT</label>
            </div>
            <div class="input-field col s12">
                <input id="nombre" name="nombre" type="text" class="validate">
                <label for="nombre">Nombre</label>
            </div>
            <div class="input-field col s12">
                <input id="apellido" name="apellido" type="text" class="validate">
                <label for="apellido">Apellido</label>
            </div>
            <div class="input-field col s12">
                <input id="correo" name="correo" type="text" class="validate">
                <label for="correo">Correo</label>
            </div>
            <div class="input-field col s12">
                <input id="clave" name="clave" type="password" class="validate">
                <label for="clave">Clave</label>
            </div>
            <div class="input-field col s12">
                <input id="clave2" name="clave2" type="password" class="validate">
                <label for="clave2">Confirme clave</label>
            </div>
            <div>
                <button type="submit" name="btn" value="registro" class="waves-effect waves-light btn right">Registrar</button>
            </div>
            <div>
                ${requestScope.msg}
            </div>
        </form>
    </div>
</div>


<%@include file="templates/footer.jsp" %>
