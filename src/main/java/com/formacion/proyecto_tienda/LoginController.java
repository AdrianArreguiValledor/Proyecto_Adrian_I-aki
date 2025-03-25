package com.formacion.proyecto_tienda;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Controller lo usaremos para movernos entre vistas (HTML, JSP...) 
 * 
 */
@Controller
public class LoginController {
	
	/**
	 * Muestra la pagina de login
	 * @param model
	 * @return
	 */
	@GetMapping("/")
	public String mostrarLogin(Model model) {
		return "index"; //Redirige a la vista login.jsp
	}
	
	 @PostMapping("/login")  // Cambio a POST para mayor seguridad
	    public String procesarLogin(@RequestParam String email, @RequestParam String password, Model model) {
	        
	        // Mostrar en consola el intento de login
	        System.out.println("Intento de login con Email: " + email + " | Password: " + password);
	        
	        // Simulación de autenticación
	        if ("user@example.com".equals(email) && "passw123".equals(password)) {
	            System.out.println("Login exitoso");
	            model.addAttribute("mensaje", "Login exitoso");
	            return "home"; // Redirige a la página principal
	        } else {
	            System.out.println("Error: Usuario o contraseña incorrectos");
	            model.addAttribute("error", "Usuario o contraseña incorrectos");
	            return "index"; // Vuelve a cargar la página de login
	        }
	    }
	}
	
