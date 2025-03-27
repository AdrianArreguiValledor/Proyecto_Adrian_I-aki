package com.formacion.proyecto_tienda;

import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;

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
	
    private Cad cad;
    
    public LoginController() throws SQLException {
        this.cad = new Cad(); // Inicializa la conexión con la base de datos
    }

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
	 
	 
	    /**
	     * Muestra la página de pedidos.
	     */
	    @GetMapping("/pedido")
	    public String mostrarPedido() {
	        return "pedido"; // Redirige a pedido.jsp
	    }
	    
	    @PostMapping("/crearPedido")
	    public String crearPedido(@RequestParam int cantidad,
	                              @RequestParam() Date fecha_pedido,
	                              @RequestParam(required = false) Date fecha_entrega,
	                              @RequestParam() int id_user,
	                              @RequestParam() int id_producto,
	                              Model model) {
	        try {
	            // Si no se proporciona fecha_pedido, se asigna la fecha actual
	            if (fecha_pedido == null) {
	                fecha_pedido = new Date(System.currentTimeMillis()); // Fecha actual
	            }


	            
	            
	            
	            // Crear pedido y guardarlo en la base de datos
	            Pedido nuevoPedido = new Pedido(cantidad, fecha_pedido, fecha_entrega, id_user, id_producto);
	            cad.crearPedido(nuevoPedido);

	            model.addAttribute("mensaje", "Pedido creado exitosamente");
	        } catch (Exception e) {
	            model.addAttribute("error", "Error al crear el pedido: " + e.getMessage());
	        }

	        return "pedido"; // Vuelve a cargar la página con el mensaje
	    }
}
	
	
