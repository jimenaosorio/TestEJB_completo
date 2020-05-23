<%@include file="templates/header.jsp" %>
<%@include file="templates/menuInicio.jsp" %>

<div class="row">
    <div class="col s12 m5 offset-l3">
        <div class="card">
            <div class="card-image">
              <img src="images/programacion.jpg">
              <span class="card-title">Ingresar</span>
            </div>
            <div class="card-content">
                <form method="post" action="control.do">
                    <div class="input-field col s12">
                        <input name="rut" id="rut" type="text" class="validate">
                        <label for="rut">RUT</label>
                    </div>
                    <div class="input-field col s12">
                        <input name="clave" id="clave" type="password" class="validate">
                        <label for="clave">Clave</label>
                    </div>
                    <div>
                        <button type="submit" name="btn" value="ingresar"
                                class="waves-effect waves-light btn right">Ingresar</button>
                    </div>
                    <div class="row">
                        ${requestScope.msg}
                    </div>
                </form>
            </div>
            
          </div>
    </div>
</div>


<%@include file="templates/footer.jsp" %>
