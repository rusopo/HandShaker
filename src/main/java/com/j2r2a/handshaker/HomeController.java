package com.j2r2a.handshaker;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.j2r2a.handshaker.model.Categoria;
import com.j2r2a.handshaker.model.Comentario;
import com.j2r2a.handshaker.model.Negociacion;
import com.j2r2a.handshaker.model.OfertaEnviada;
//import com.j2r2a.handshaker.model.OfertaRecibida;
import com.j2r2a.handshaker.model.Servicio;
import com.j2r2a.handshaker.model.Usuario;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@PersistenceContext
	private EntityManager entityManager;
	
	/**
	 * Intercepts login requests generated by the header; then continues to load normal page
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@Transactional
	public String login(HttpServletRequest request, Model model, HttpSession session) {
		
		String formName = request.getParameter("name");
		String formPass = request.getParameter("pass");
		String formSource = request.getParameter("source");
		logger.info("Login attempt from '{}' while visiting '{}'", formName, formSource);
		
		
		// validate request
		
		if (formName == null || formName.length() < 5 || formPass == null || formPass.length() < 5) {
			
			model.addAttribute("loginError", "Usuario y/o contraseña: 5 caracteres minimo");
		} 
		
		else {
			
			Usuario u = null;
			
			try {
				
				u = (Usuario)entityManager.createNamedQuery("ExisteUsuarioLogin").setParameter("UsuarioMetido", formName).getSingleResult();
				
				if (u.isPassValid(formPass)) {
					
					logger.info("pass was valid");	
					
					session.setAttribute("usuario", u);
					
					// sets the anti-csrf token
					getTokenForSession(session);
					
					if(u.getAlias().equals("admin") && u.getContrasenia().equals("4e472a2779abd6d6571c76b0f845cb5d20e084e7")){ //Contrase�a:admin cifrada
						
						return "redirect:" + "administrador";
					}
										
				} else {
					
					logger.info("pass was NOT valid");
					model.addAttribute("loginError", "Error en usuario o contraseña");
				
				}
				
			}
			catch (NoResultException nre) {
				
				logger.info("no such login: {}", formName);
				
				model.addAttribute("loginError", "No existe el usuario introducido");
				
			}
		}
		
		return "redirect:" + formSource;		
	}
	
	/**
	 * Logout (also returns to home view).
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("User '{}' logged out", session.getAttribute("usuario"));
		session.invalidate();
		return "redirect:/";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/registro", method = RequestMethod.GET)
	public String registroHome(HttpServletRequest request,Locale locale, Model model) {
		
		
		return "registro";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/nuevoRegistro", method = RequestMethod.POST)
	@Transactional
	
	public String nuevoRegistroForm(HttpServletRequest request, Model model, HttpSession session,
			@RequestParam("fotoRegistro") MultipartFile formFotoRegistro) {
		
				
		String formAliasRegistro = request.getParameter("AliasRegistro");
		String formNombreRegistro = request.getParameter("NombreRegistro");
		long formEdadRegistro = Long.parseLong(request.getParameter("EdadRegistro"));
		String formEmailRegistro = request.getParameter("EmailRegistro");
		String formContrasenia1Registro = request.getParameter("ContraseniaRegistro");
		String formContrasenia2Registro = request.getParameter("Contrasenia2Registro");
		double formLatitudRegistro = Double.parseDouble(request.getParameter("lat"));
		double formLongitudRegistro =  Double.parseDouble(request.getParameter("lng"));
				
		List<Usuario> lista_usuarios = entityManager.createQuery("select u from Usuario u").getResultList();
		int contadorUsuarios = lista_usuarios.size();
		String id_usuario = String.valueOf(contadorUsuarios+1).toString();
		
		if(formContrasenia1Registro.equals(formContrasenia2Registro)){
			
							
			if (!formFotoRegistro.isEmpty()) {
					
				try{
					          
	                byte[] bytes = formFotoRegistro.getBytes();
	                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(ContextInitializer.getFile("usuario", id_usuario)));
	                stream.write(bytes);
	                stream.close();
	                
	                logger.info( "You successfully uploaded " + id_usuario + 
	               		" into " + ContextInitializer.getFile("usuario", id_usuario).getAbsolutePath() + "!");
														
				}
				catch (Exception e) {
					// TODO: handle exception
					logger.info("You failed to upload " + id_usuario + " => " + e.getMessage());
				}
				
			}	
			else{
								
				logger.info( "El usuario con id " + id_usuario + "no ha elegido ninguna foto");
				
			}
			
			
			Usuario user = Usuario.crearUsuario(formAliasRegistro, formNombreRegistro,formEdadRegistro, formEmailRegistro, formContrasenia1Registro,formLatitudRegistro,formLongitudRegistro);			
			String habilidades_metidas=request.getParameter("servs");					
			List<Servicio> lista_habilidades = new ArrayList<Servicio>();
			
			String aux = habilidades_metidas.replaceAll("[^0-9]+","");
			
			for(int i=0; i < aux.length();i++){
				
				long id_serv =(long)(aux.charAt(i)-'0');				
				Servicio s = (Servicio)entityManager.createNamedQuery("ExisteServicioPorNombre").setParameter("IdServicioMetido", id_serv).getSingleResult();				
				s.setContadorUsuarios(s.getContadorUsuarios()+1);
				lista_habilidades.add(s);				
				
			}
			
			user.setHabilidades(lista_habilidades);
			
			String intereses_metidos=request.getParameter("intereses");
			List<Servicio> lista_intereses = new ArrayList<Servicio>();
			
			String auxInteres = intereses_metidos.replaceAll("[^0-9]+","");
			
			for(int i=0; i < auxInteres.length();i++){
				
				long id_serv =(long)(auxInteres.charAt(i)-'0');				
				Servicio s = (Servicio)entityManager.createNamedQuery("ExisteServicioPorNombre").setParameter("IdServicioMetido", id_serv).getSingleResult();
				lista_intereses.add(s);				
				
			}
			
			user.setIntereses(lista_intereses);
						
			entityManager.persist(user);				
			session.setAttribute("usuario", user);			
			user.printUsuario();
				
		}
							
		return "redirect:" +"index";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/mi_perfil", method = RequestMethod.GET)
	public String mi_perfilHome(HttpServletRequest request,Model model,HttpSession session) {
							
		long idUsuarioPulsado= Long.parseLong(request.getParameter("usuario"));
		
		if(idUsuarioPulsado==0){
			
			Usuario u = null;
		}
		
		else{
		
			Usuario u = (Usuario)entityManager.createNamedQuery("ExisteUsuarioPorID").setParameter("IDMetido", idUsuarioPulsado).getSingleResult();
						
			if(u!=null){
				
				model.addAttribute("usuarioPerfil", u);
				
				List<Servicio> listaServiciosUsuario= entityManager.createQuery("SELECT DISTINCT u.habilidades from Usuario u join u.habilidades h where u.id = "+ idUsuarioPulsado +"").getResultList();
				
				if(listaServiciosUsuario!=null){
					model.addAttribute("listaServiciosUsuario",listaServiciosUsuario);
				}
				
				List<Servicio> listaInteresesUsuario= entityManager.createQuery("SELECT DISTINCT u.intereses from Usuario u join u.intereses h where u.id = "+ idUsuarioPulsado +"").getResultList();
				
				if(listaInteresesUsuario!=null){
					model.addAttribute("listaInteresesUsuario",listaInteresesUsuario);
				}
			}
		}	
		
		model.addAttribute("listaActiva2","class='active'");
		
		return "mi_perfil";
	}
	
	
	/**
		 * Returns a users' photo
		 * @param id id of user to get photo from
		 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/mi_perfil/usuario", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	 public byte[] userPhoto(HttpServletRequest request,HttpSession session) throws IOException {
			
			long iDusuario=Long.parseLong(request.getParameter("id_usuario"));
		
			Usuario u = (Usuario)entityManager.createNamedQuery("ExisteUsuarioPorID").setParameter("IDMetido", iDusuario).getSingleResult();
			
		    File f = ContextInitializer.getFile("usuario", String.valueOf(u.getId()).toString());
		    InputStream in = null;
		    if (f.exists()) {
		    	in = new BufferedInputStream(new FileInputStream(f));
		    } else {
		    	in = new BufferedInputStream(
		    			this.getClass().getClassLoader().getResourceAsStream("unknown-user.jpg"));
		    }
		    
		    return IOUtils.toByteArray(in);
		}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
				
		List<Categoria> listaCategorias = entityManager.createNamedQuery("ListaCategorias").getResultList();
		model.addAttribute("listaCategorias", listaCategorias);
		
		List<Servicio> lista_servicios_todas = entityManager.createNamedQuery("ListarTodo").getResultList();
		model.addAttribute("ListarPorCategoria", lista_servicios_todas);
		
		model.addAttribute("listaActiva1","class='active'");

		return "index";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String indexHome(Model model) {
		
		
		List<Categoria> listaCategorias = entityManager.createNamedQuery("ListaCategorias").getResultList();
		model.addAttribute("listaCategorias", listaCategorias);
		
		List<Servicio> lista_servicios_todas = entityManager.createQuery("select s from Servicio s").getResultList();
		model.addAttribute("ListarPorCategoria", lista_servicios_todas);
		
		model.addAttribute("listaActiva1","class='active'");

		return "index";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/busquedaIndex", method = RequestMethod.POST)
	@Transactional
	
	public String busquedaIndexForm(HttpServletRequest request, Model model, HttpSession session) {
		
		String formTextoBuscado=request.getParameter("textoBuscado");
		
		String formCategoria= request.getParameter("categoria");
		
		long formCategoriaSeleccionada=1;
		
		if(formCategoria.equals("-- Selecciona --")){
			
			formCategoriaSeleccionada=1;
		}
		else{
		
			formCategoriaSeleccionada= Long.parseLong(request.getParameter("categoria"));
		
		}
		
		if(!formTextoBuscado.equals("")){
			
			if(formCategoriaSeleccionada==1){
				List<Servicio> lista_servicios_todas = entityManager.createNamedQuery("BusquedaServicioPorSoloTexto").setParameter("textoMetido", "%" + formTextoBuscado + "%").getResultList();
				model.addAttribute("ListarPorCategoria", lista_servicios_todas);
			}
			else{
				List<Servicio> lista_servicios_todas = entityManager.createNamedQuery("BusquedaServicioPorTextoYCategoria").setParameter("textoMetido", "%" + formTextoBuscado + "%").setParameter("categoriaMetida", formCategoriaSeleccionada).getResultList();
				model.addAttribute("ListarPorCategoria", lista_servicios_todas);
			}
		}
		
		else{
		
			if(formCategoriaSeleccionada==1){
				
				List<Servicio> lista_servicios_todas = entityManager.createQuery("select s from Servicio s").getResultList();
				model.addAttribute("ListarPorCategoria", lista_servicios_todas);
			}
			else{
			
				List<Servicio> lista_servicios_buscadas = entityManager.createNamedQuery("BusquedaPorCategoria").setParameter("CategoriaMetida",formCategoriaSeleccionada).getResultList();
				model.addAttribute("ListarPorCategoria", lista_servicios_buscadas);
			
			}
			
		}
		return "resultadosBusqueda";
	}
	
	@RequestMapping(value = "/dameServicios", method = RequestMethod.POST)
	@Transactional // needed to allow lazy init to work
	
	public ResponseEntity<String> dameServicios(HttpServletRequest request) {
		try {
			
			List<Categoria> listaCategorias = entityManager.createNamedQuery("ListaCategorias").getResultList();
			
			StringBuilder sb = new StringBuilder("[");
			
			for(int i=0; i < listaCategorias.size();i++){
				
				if (sb.length()>1) sb.append(",");
				
				sb.append("{ "
						+ "\"id\": \"" + listaCategorias.get(i).getId_categoria() + "\", "
						+ "\"nombre\": \"" + listaCategorias.get(i).getNombreCategoria() + "\", "
						+ "\"valores\":");
								
				List<Servicio> listaServicios = entityManager.createQuery("select s from Servicio s").getResultList();
					
				StringBuilder sb2 = new StringBuilder("[");
				
				for(int j=0;j < listaServicios.size();j++){
					
					if(listaCategorias.get(i).getId_categoria()==1){
						
						if (sb2.length()>1) sb2.append(",");
						sb2.append("{ "
								+ "\"id\": \"" + listaServicios.get(j).getId_servicio() + "\", "
								+ "\"nombre\": \"" + listaServicios.get(j).getNombre() + "\"}");
					}
					
					else{
					
						if(listaServicios.get(j).getCategoria().getId_categoria() == listaCategorias.get(i).getId_categoria()){
						
							if (sb2.length()>1) sb2.append(",");
							sb2.append("{ "
									+ "\"id\": \"" + listaServicios.get(j).getId_servicio() + "\", "
									+ "\"nombre\": \"" + listaServicios.get(j).getNombre() + "\"}");
						}
					}
				}
				sb2.append("]");				
				sb.append(sb2);				
				sb.append("}");
			}
			
			logger.info(sb + "]");
			
			return new ResponseEntity<String>(sb + "]", HttpStatus.OK);
			
		} catch (NoResultException nre) {
			logger.error("No existen servicios o categorias", nre);
		}
		return new ResponseEntity<String>("Error: No existen categorias o servicios de alguna categoria", HttpStatus.BAD_REQUEST);		
	}			
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/administrador", method = RequestMethod.GET)
	public String administradorHome(Model model, HttpSession session) {
		
        Usuario u = (Usuario)session.getAttribute("usuario");
		
		
		if(u!=null){
			model.addAttribute("usuario", u);
		}
		
		List<Usuario> lista_usuarios = entityManager.createQuery("select u from Usuario u").getResultList();
		List<Usuario> lista_servicios = entityManager.createNamedQuery("ListarTodo").getResultList();
		
		model.addAttribute("lista_todos_usuarios", lista_usuarios);
		model.addAttribute("lista_todos_servicios", lista_servicios);
		model.addAttribute("listaActiva5","class='active'");
		
		return "administrador";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/mi_historial", method = RequestMethod.GET)
	public String mi_historialHome(Model model) {
		
		
		
		
		model.addAttribute("listaActiva3","class='active'");

		
		return "mi_historial";
	}
	
	
	/**
	 * Checks the anti-csrf token for a session against a value
	 * @param session
	 * @param token
	 * @return the token
	 */
	static boolean isTokenValid(HttpSession session, String token) {
	    Object t=session.getAttribute("csrf_token");
	    return (t != null) && t.equals(token);
	}
	
	/**
	 * Returns an anti-csrf token for a session, and stores it in the session
	 * @param session
	 * @return
	 */
	static String getTokenForSession (HttpSession session) {
	    String token=UUID.randomUUID().toString();
	    session.setAttribute("csrf_token", token);
	    return token;
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/delUser", method = RequestMethod.POST)
	@ResponseBody
	@Transactional // needed to allow DB change
	public ResponseEntity<String> borrarUsuario(@RequestParam("id") long id,
			@RequestParam("csrf") String token, HttpSession session) {
		
	    if (entityManager.createNamedQuery("delUser")
				.setParameter("idParam", id).executeUpdate() == 1) {
			return new ResponseEntity<String>("Ok: user " + id + " removed", 
					HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("Error: no such user", 
					HttpStatus.BAD_REQUEST);
		}
	}			
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/mis_ofertas", method = RequestMethod.GET)
	@Transactional
	public String mis_ofertasHome(Model model, HttpSession session,HttpServletRequest request) {
		
		Usuario u = (Usuario)session.getAttribute("usuario");
		
		if(u!=null){
			model.addAttribute("usuario", u);
			
			List<OfertaEnviada> listaOfertasEnviadasUsuario= entityManager.createNamedQuery("ListaOfertaEnviadaUsuario").setParameter("UsuarioMetido", u).getResultList();
			List<OfertaEnviada> listaOfertasRecibidasUsuario= entityManager.createNamedQuery("ListaOfertaRecibidaUsuario").setParameter("UsuarioMetido", u).getResultList();
			
			if(listaOfertasEnviadasUsuario.size() !=0){
				model.addAttribute("listaOfertasEnviadasUsuario",listaOfertasEnviadasUsuario);
			}
			if(listaOfertasRecibidasUsuario.size() !=0){
				model.addAttribute("listaOfertasRecibidasUsuario",listaOfertasRecibidasUsuario);
			}
			
		}			
		
		model.addAttribute("listaActiva4","class='active'");
	
		return "mis_ofertas";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/negociacion", method = RequestMethod.GET)
	@Transactional
	public String negociacionHome(Model model, HttpSession session,HttpServletRequest request) {
		
	
		System.out.print("aaa");
		
		Usuario u = (Usuario)session.getAttribute("usuario");
		Negociacion negociacion ;
		
		
		long id_negociacion_pulsada= Long.parseLong(request.getParameter("id_negociacionNombre"));
		
		 
		
		negociacion= (Negociacion)entityManager.createNamedQuery("ExisteNegociacionPorID").setParameter("IdNegociacionMetido", id_negociacion_pulsada).getSingleResult();
		List <Comentario> listaComentarios = entityManager.createNamedQuery("DameListaComentarios").setParameter("IdNegociacionMetido", id_negociacion_pulsada).getResultList();
		    
		if(negociacion != null){
			
			
			model.addAttribute("ListaComentarios",listaComentarios);
			model.addAttribute("NegociacionPorID", negociacion); // el primer atributo es el que hay que usar en la vista.
			model.addAttribute("usuario", u);
		
		}
	
		
		model.addAttribute("listaActiva6","class ='active'");
		return "negociacion";
	}
	/*
	@ResponseBody
	@RequestMapping(value="/negociacion/comentario", method = RequestMethod.GET)
	 public String ComentariosGome(HttpServletRequest request,HttpSession session) {
	
		
		return "/negociacion/comentario";
	}
	
	*/
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/servicio", method = RequestMethod.GET)
	public String servicioHome(HttpServletRequest request, Model model, HttpSession session) {
		
		long id_servicio_pulsado= Long.parseLong(request.getParameter("id_servicio"));
		
		Servicio s=(Servicio)entityManager.createNamedQuery("ExisteServicioPorNombre").setParameter("IdServicioMetido", id_servicio_pulsado).getSingleResult();
		Usuario u = (Usuario)session.getAttribute("usuario");
		
		List<Usuario> listaUsuarios=entityManager.createNamedQuery("ListaUsuariosServicio").setParameter("IdServicioMetido", id_servicio_pulsado).setParameter("idUsuarioMetido", u.getId()).getResultList();
				
		if(listaUsuarios!=null){
			model.addAttribute("listaUsuariosServicio",listaUsuarios);
		}
					
		model.addAttribute("usuario",u);
		model.addAttribute("servicio", s);
		model.addAttribute("usuario_registrado", u);
		
		return "servicio";
	}
	
}