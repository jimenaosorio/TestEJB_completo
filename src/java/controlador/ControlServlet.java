/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import beans.ServicioLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Mensaje;
import modelo.Oferta;
import modelo.Perfil;
import modelo.Postulante;

/**
 *
 * @author jimenaosorio
 */
@WebServlet(name = "ControlServlet", urlPatterns = {"/control.do"})
public class ControlServlet extends HttpServlet {

    @EJB
    private ServicioLocal servicio;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String btn=request.getParameter("btn").toString();
        switch(btn)
        {
            case "ingresar":
                iniciarSesion(request,response);
                break;
            case "registro":
                registrar(request,response);
                break;
            case "postular":
                ingresarPostulacion(request,response);
                break;
            case "ingresar_perfil":
                ingresarPerfil(request,response);
                
                break;
            case "ingresar_oferta":
                ingresarOferta(request,response);
                break;
            case "buscaroferta":
                buscarOferta(request,response);
                break;
            case "enviar_mensaje":
                enviarMensaje(request,response);
                break;
            case "cerrar_oferta":
                cerrarOferta(request,response);
                break;
                
            default:
                int codigo=0;
                try{
                    codigo=Integer.parseInt(btn);
                    postular(request,response, codigo);
                    
                }catch(NumberFormatException ex)
                {
                    
                }
        }
    }
    protected void cerrarOferta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo=request.getParameter("codigo");
        servicio.cerrarOferta(Integer.parseInt(codigo));
        response.sendRedirect("cerraroferta.jsp");
    }
    
    protected void enviarMensaje(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rut=request.getParameter("rut").toString();
        String asunto=request.getParameter("asunto");
        String contenido=request.getParameter("contenido");
        String msg;
        
        if(asunto.isEmpty() || contenido.isEmpty())
        {
            msg="Faltan datos";
        }
        else{
            Mensaje m=new Mensaje(asunto,contenido);
            msg=servicio.enviarMensaje(rut,m);
        }
        request.setAttribute("msg",msg);
        request.getRequestDispatcher("enviarmensaje2.jsp").forward(request, response);
        
    }
    
    protected void buscarOferta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo=request.getParameter("codigo");
        Oferta o = servicio.buscarOferta(Integer.parseInt(codigo));
        request.setAttribute("lista", o.getMisPostulantes());
        request.getRequestDispatcher("enviarmensaje.jsp").forward(request, response);
        
        
    }
    
    protected void ingresarOferta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigoStr=request.getParameter("codigo").toString();
        String titulo=request.getParameter("titulo").toString();
        String descripcion=request.getParameter("descripcion").toString();
        int codigo=0;
        String errores="";
        
        if(codigoStr.equals(""))
        {
            errores+="Debe ingresar el código<BR/>";
        }
        else{
            try{
                codigo=Integer.parseInt(codigoStr);
            }catch(NumberFormatException ex)
            {
                errores+="Ingrese un número en el código<BR/>";
            }
        }
        if(titulo.equals(""))
        {
            errores+="Debe ingresar el título de la oferta<BR/>";
        }
        if(descripcion.equals(""))
        {
            errores+="Debe ingresar la descripción de la oferta<BR/>";
        }
        
        if(!errores.isEmpty())
        {
            request.setAttribute("msg",errores);
            request.getRequestDispatcher("nuevaoferta.jsp").forward(request, response);
        }
        else{
            Oferta oferta=new Oferta(codigo,titulo,descripcion,true);
            if(servicio.crearOferta(oferta))
            {
                response.sendRedirect("ofertas.jsp");
            }
            else{
                errores+="No se puede crear la oferta";
                request.setAttribute("msg",errores);
                request.getRequestDispatcher("nuevaoferta.jsp").forward(request, response);
        
            }
        }
        
        
        
    }
    
    protected void ingresarPerfil(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String profesion=request.getParameter("profesion");
        String experiencia=request.getParameter("experiencia");
        String presentacion=request.getParameter("presentacion");
        String errores="";
        if(profesion.equals("")){
            errores+="Debes ingresar tu profesión<br/>";
        }
        if(experiencia.equals("")){
            errores+="Debes ingresar tu experiencia<br/>";
        }
        if(presentacion.equals("")){
            errores+="Debes ingresar tu presentación<br/>";
        }
        if(errores.isEmpty())
        {
            Perfil perfil=new Perfil(profesion,experiencia,presentacion);
            String rut=(String)request.getSession().getAttribute("rut");
            String msg=servicio.ingresarPerfil(rut,perfil);
            request.setAttribute("msg",msg);
            request.getRequestDispatcher("miperfil.jsp").forward(request,response);
        }
        else{
            request.setAttribute("msg",errores);
            request.getRequestDispatcher("miperfil.jsp").forward(request,response);
        }
    }
    
    
    protected void ingresarPostulacion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Oferta oferta=(Oferta)request.getSession().getAttribute("oferta");
        String rut=(String) request.getSession().getAttribute("rut");
        String msg=servicio.postular(rut, oferta.getCodigo());
        
        //Redireccionamos a mis postulaciones
        
        request.setAttribute("msg", msg);
        request.getRequestDispatcher("mispostulaciones.jsp").forward(request, response);
    }
    
    protected void postular(HttpServletRequest request, HttpServletResponse response, int codigo)
            throws ServletException, IOException {
        Oferta oferta=servicio.buscarOferta(codigo);
        request.getSession().setAttribute("oferta",oferta);
        request.getRequestDispatcher("postular.jsp").forward(request,response);
    }
    
    
    
    protected void iniciarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rut=request.getParameter("rut").toString();
        String clave=request.getParameter("clave").toString();
        String msg="";
        if(rut.isEmpty() || clave.isEmpty())
        {
            msg+="RUT y Clave son obligatorios<BR/>";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("iniciarsesion.jsp").forward(request, response);
        }
        else{
            //Llamar al servicio para iniciar sesion
            if(servicio.iniciarSesion(rut, clave))
            {
                //El usuario y su contraseña son correctos
                //Si es administrador
                if(servicio.buscarPostulante(rut).getNombre().equals("admin"))
                {
                    //Guardamos el atributo admin dentro de la sesión
                    request.getSession().setAttribute("admin","admin");
                }
                //Si es otro usuario
                else{
                    //Guardamos el rut del postulante dentro de su sesión
                    request.getSession().setAttribute("rut",rut);
                }
                //Reenviar a ofertas.jsp
                response.sendRedirect("ofertas.jsp");
            }
            else
            {
                //error en el usuario
                msg+="El usuario no existe o la clave está incorrecta<BR/>";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("iniciarsesion.jsp").forward(request, response);
            }
            
        }
        
    }
    
    
    
    protected void registrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rut=request.getParameter("rut").toString();
        String nombre=request.getParameter("nombre").toString();
        String apellido=request.getParameter("apellido").toString();
        String correo=request.getParameter("correo").toString();
        String clave=request.getParameter("clave").toString();
        String clave2=request.getParameter("clave2").toString();
        
        String errores="";
        if(rut.equals("")){
            errores+="Debe ingresar el RUT<BR/>";
        }
        if(nombre.equals("")){
            errores+="Debe ingresar el nombre<BR/>";
        }
        if(apellido.equals("")){
            errores+="Debe ingresar el apellido<BR/>";
        }
        if(correo.equals("")){
            errores+="Debe ingresar el correo<BR/>";
        }
        if(clave.equals("")){
            errores+="Debe ingresar la clave<BR/>";
        }
        if(clave2.equals("")){
            errores+="Debe confirmar la clave<BR/>";
        }
        if(!clave.equals(clave2))
        {
            errores+="Las claves no coinciden<BR/>";
        }
        //No hay errores, ejecutamos la logica del negocio
        if(errores.equals(""))
        {
            Postulante postulante=new Postulante(rut,nombre,apellido,correo,clave);
            String msg=servicio.addPostulante(postulante);
            request.setAttribute("msg",msg);
            request.getRequestDispatcher("iniciarsesion.jsp").forward(request,response);
        }
        //Hay errores
        else{
            request.setAttribute("msg", errores);
            request.getRequestDispatcher("registro.jsp").forward(request,response);
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
