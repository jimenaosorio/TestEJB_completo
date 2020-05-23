
<nav>
    <div class="nav-wrapper orange darken-3">
        
     <c:if test="${empty rut and empty admin}">
      <a href="#" class="brand-logo">Encuentra tu Trabajo!</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="iniciarsesion.jsp">Acceder</a></li>
        <li><a href="registro.jsp">Reg�strate</a></li>
        <li><a href="ofertas.jsp">Ofertas</a></li>
      </ul>
     </c:if>
      <c:if test="${not empty rut}">
          <a href="#" class="brand-logo">Bienvenido!!</a>
          <ul id="nav-mobile" class="right hide-on-med-and-down">
               <li><a href="miperfil.jsp">Mi Perfil</a></li>
               <li><a href="mispostulaciones.jsp">Mis Postulaciones</a></li>
               <li><a href="ofertas.jsp">Ofertas</a></li>
               <li><a href="mismensajes.jsp">Mis Mensajes</a></li>
               <li><a href="salir.jsp">Salir</a></li>
          </ul>
      </c:if>
      <c:if test="${not empty admin}">
          <a href="#" class="brand-logo">Bienvenido Administrador!!</a>
          <ul id="nav-mobile" class="right hide-on-med-and-down">
               <li><a href="nuevaoferta.jsp">Crear Oferta</a></li>
               <li><a href="enviarmensaje.jsp">EnviarMensaje</a></li>
               <li><a href="cerraroferta.jsp">Cerrar Oferta</a></li>
               <li><a href="salir.jsp">Salir</a></li>
          </ul>
      </c:if>
      
      
    </div>
  </nav>