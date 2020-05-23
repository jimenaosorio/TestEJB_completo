/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.ArrayList;
import javax.ejb.Singleton;
import modelo.*;

/**
 *
 * @author jimenaosorio
 */
@Singleton
public class Servicio implements ServicioLocal {
    
    private ArrayList<Oferta> ofertas = new ArrayList();
    private ArrayList<Postulante> postulantes=new ArrayList();
    
    
    

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    public Servicio() {
        ofertas.add(new Oferta(1,"Desarrollador Java","Desarrollador de tiempo completo",true));
        ofertas.add(new Oferta(2,"Diseñador grafico","Diseñador con experiencia 2 años",true));
        postulantes.add(new Postulante("111","admin","admin","admin@localhost","admin"));
    }

    @Override
    public Oferta buscarOferta(int codigoOferta) {
        for(Oferta of:ofertas)
        {
            if(of.getCodigo()==codigoOferta)
            {
                return of;
            }
        }
        return null;
    }

    @Override
    public Postulante buscarPostulante(String rut) {
        for(Postulante p:postulantes)
        {
            if(p.getRut().equals(rut)){
                return p;
            }
        }
        return null;
    }

    @Override
    public boolean cerrarOferta(int codigo) {
        Oferta oferta=buscarOferta(codigo);
        if(oferta.isEstaActiva()){
            oferta.setEstaActiva(false);
            return true;
        }
        
        return false;
    }

    @Override
    public boolean crearOferta(Oferta oferta) {
        Oferta tmp=buscarOferta(oferta.getCodigo());
        if(tmp==null)
        {
            ofertas.add(oferta);
            return true;
        }
        return false;
    }

    @Override
    public String enviarMensaje(String rut, Mensaje msg) {
        Postulante p=buscarPostulante(rut);
        if(p!=null)
        {
            ArrayList<Mensaje> mensajes=p.getMisMensajes();
            mensajes.add(msg);
            p.setMisMensajes(mensajes);
            return "Se ha enviado el mensaje correctamente";
        }
        
        return "No se puede enviar el mensaje";
    }

    @Override
    public ArrayList<Oferta> getOfertas() {
        ArrayList<Oferta> tmp=new ArrayList();
        for(Oferta of:ofertas)
        {
            //Ingresamos solo las ofertas activas
            if(of.isEstaActiva()){
                tmp.add(of);
            }
        }
        return tmp;
    }
    
     

    @Override
    public ArrayList<Postulante> getPostulantes() {
        return postulantes;
    }

    @Override
    public boolean iniciarSesion(String rut, String pass) {
        Postulante p=buscarPostulante(rut);
        if(p!=null && p.getPass().equals(pass)){
            return true;
        }
        return false;
    }

    @Override
    public String postular(String rut, int codigoOferta) {
        Postulante p=buscarPostulante(rut);
        Oferta of=buscarOferta(codigoOferta);
        if(p!=null && of!=null && of.isEstaActiva())
        {
            //Asociar la oferta al postulante
            ArrayList<Oferta> postulaciones=p.getMisPostulaciones();
            postulaciones.add(of);
            p.setMisPostulaciones(postulaciones);
            
            //Asociar el postulante a la oferta
            ArrayList<Postulante> postu=of.getMisPostulantes();
            postu.add(p);
            of.setMisPostulantes(postu);
            
            return "Postulacion realizada exitosamente";
        }
        return "No se puede postular";
    }

    @Override
    public String addPostulante(Postulante postulante) {
        String msg;
        Postulante p=buscarPostulante(postulante.getRut());
        //El postulante no está, puedo ingresarlo
        if(p==null)
        {
            postulantes.add(postulante);
            msg="Acabas de registrarte como postulante";
        }
        else{
            msg="El postulante ya existe";
        }
        
        return msg;
    }

    @Override
    public String ingresarPerfil(String rut, Perfil perfil) {
        Postulante p=buscarPostulante(rut);
        p.setMiPerfil(perfil);
        return "Perfil actualizado correctamente";
    }

    @Override
    public ArrayList<Oferta> getOfertas2() {
        return ofertas;
    }
    
    
    
    
}
