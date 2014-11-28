package com.j2r2a.handshaker;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.j2r2a.handshaker.model.Categoria;
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
					
					if(u.getAlias().equals("admin") && u.getContrasenia().equals("4e472a2779abd6d6571c76b0f845cb5d20e084e7")){ //Contrase�a:admin cifrada
						
						return "redirect: /administrador";
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
		
			
		/*
		List<Categoria> listaCategorias = entityManager.createNamedQuery("ListaCategorias").getResultList();
		model.addAttribute("listaCategorias", listaCategorias);
		
		long formCategoriaSeleccionada= Long.parseLong(request.getParameter("categoria"));
		
		List<Servicio> lista_servicios_buscadas = entityManager.createNamedQuery("BusquedaPorCategoria").setParameter("CategoriaMetida",formCategoriaSeleccionada).getResultList();
		model.addAttribute("ListarPorCategoria", lista_servicios_buscadas);
		
		*/
		
		List<Categoria> listaCategorias = entityManager.createNamedQuery("ListaCategorias").getResultList();
		model.addAttribute("listaCategorias", listaCategorias);
		
		List<Servicio> lista_servicios_todas = entityManager.createNamedQuery("ListarTodo").getResultList();
		model.addAttribute("ListarPorCategoria", lista_servicios_todas);
		
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
			
			
			List<Servicio> lista_habilidades=user.getHabilidades();
			long formServicioCategoria=Long.parseLong(request.getParameter("categoria"));
			long formServicioNombre=Long.parseLong(request.getParameter("servicio"));
			
			Servicio s = (Servicio)entityManager.createNamedQuery("ExisteServicioPorNombre").setParameter("IdServicioMetido", formServicioNombre).getSingleResult();
			lista_habilidades.add(s);
			
			
			entityManager.persist(user);				
			session.setAttribute("usuario", user);
			
			user.printUsuario();
				
		}
							
		return "redirect: /index";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/mi_perfil", method = RequestMethod.GET)
	public String mi_perfilHome(Model model,HttpSession session) {
				
		Usuario u = (Usuario)session.getAttribute("usuario");
		
		if(u!=null){
			model.addAttribute("usuario", u);
		}
		
		//BORRAR ESTE IF MAS ADELANTE XQ ES SOLO PARA DEPURAR
		
		if(u != null){
			if(u.getAlias().equals("admin") || u.getAlias().equals("rusopo") || u.getAlias().equals("test1")){
				u.setHabilidades(null);
			}
		}
		
		if(u != null){
			List<Servicio> listaServiciosUsuario= u.getHabilidades();
						
			if(listaServiciosUsuario!=null){
				model.addAttribute("listaServiciosUsuario",listaServiciosUsuario);
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
		public byte[] userPhoto(HttpSession session) throws IOException {
			
			Usuario u = (Usuario)session.getAttribute("usuario");
			
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
		long formCategoriaSeleccionada= Long.parseLong(request.getParameter("categoria"));
		
		if(formCategoriaSeleccionada==1){
			
			List<Servicio> lista_servicios_todas = entityManager.createQuery("select s from Servicio s").getResultList();
			model.addAttribute("ListarPorCategoria", lista_servicios_todas);
		}
		else{
		
			List<Servicio> lista_servicios_buscadas = entityManager.createNamedQuery("BusquedaPorCategoria").setParameter("CategoriaMetida",formCategoriaSeleccionada).getResultList();
			model.addAttribute("ListarPorCategoria", lista_servicios_buscadas);
		
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
				
				//long id_categoria=listaCategorias.get(i).getId_categoria();				
				//List<Servicio> listaServicios = entityManager.createNamedQuery("BusquedaPorCategoria").setParameter("CategoriaMetida",id_categoria).getResultList();
				
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
	public String administradorHome(Model model) {
		
				
		
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
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/mis_ofertas", method = RequestMethod.GET)
	public String mis_ofertasHome(Model model) {
		
				
		
		model.addAttribute("listaActiva4","class='active'");
	
		return "mis_ofertas";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/negociacion", method = RequestMethod.GET)
	public String negociacionHome(Model model) {
		
				
		
		return "negociacion";
	}
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/servicio/{id}", method = RequestMethod.GET)
	public String servicioHome(@PathVariable("id") long id_servicio_pulsado,HttpServletRequest request, Model model) {
				
		Servicio s=(Servicio)entityManager.createNamedQuery("ExisteServicioPorNombre").setParameter("IdServicioMetido", id_servicio_pulsado).getSingleResult();
		
		model.addAttribute("servicio", s);
		
		model.addAttribute("prefix", "../");
		
		return "servicio";
	}
	
}
