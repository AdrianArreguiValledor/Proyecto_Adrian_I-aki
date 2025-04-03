package com.formacion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.formacion.entities.Producto;
import com.formacion.entities.Usuario;
import com.formacion.service.ApiService;
import com.formacion.service.ProductoService;
import com.formacion.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.java.Log;

@Controller
@Log
public class LoginController {


	  
	@Autowired
	private ApiService apiService;  // Inyectamos el servicio ApiService

	 
    @Autowired
    private UserService userService; // Servicio para la gestión de usuarios

    @Autowired
    private ProductoService productoService; // Servicio para la gestión de productos
    
    
    @Autowired
    private PasswordEncoder passwordEncoder; // Encriptador de contraseñas para la seguridad
    
    
 // Ruta principal de la aplicación, redirige a la página de login
    @GetMapping("/")
    public String inicio(Model model) {
        log.info("Arranca la app");
        return "index";  // Redirige a la página de login
    }

    
    // Otra ruta para la página de login ("/index"), redirige a la página de login
    @GetMapping("/index")
    public String inicioDesdeIndex(Model model) {
        log.info("Llamamos a index");
        return "index";  // Redirige a la página de login
    }

    @GetMapping("/registro")
    public String inicioRegistro(Model model) {
        log.info("Llamamos a registro");
        return "registro";  // Redirige a la página de registro
    }

    /**
     * Procesa el formulario de registro y redirige a la página de login si el registro es exitoso.
     */
    @PostMapping("/formularioRegistro")
    public String procesarFormularioRegistro(String nombre, String email, String contrasena, String apellido, String rol, RedirectAttributes redirectAttributes) {
        log.info("Procesamos el formulario de Registro");

        Usuario usuarioExistente = userService.findUserByEmail(email);

        if (usuarioExistente == null) {
            // Crear nuevo usuario
            Usuario usuario = new Usuario();
            usuario.setNombre(nombre);
            usuario.setEmail(email);
            usuario.setContrasena(passwordEncoder.encode(contrasena));
            usuario.setApellido(apellido);
            usuario.setRol(rol);

            userService.saveUser(usuario);
            
            // Mensaje de éxito con nombre del usuario
            redirectAttributes.addFlashAttribute("mensaje", "✅ El usuario: " + nombre + " ha sido creado con éxito!");
            redirectAttributes.addFlashAttribute("tipoMensaje", "success"); // Para estilos CSS
            
            return "redirect:/index"; // Redirigir al login
        } else {
            redirectAttributes.addFlashAttribute("error", "❌ El usuario " + nombre + " con email " + email + " ya está registrado!");
            return "redirect:/registro"; // Redirigir al registro
        }
    }




    

    /**
     * Procesa el formulario de login y redirige a la página principal si el login es exitoso.
     */
    @PostMapping("/formularioLogin")
    public String procesarFormularioLogin(String email, String contrasena, Model model, HttpSession session) {
        log.info("Procesamos el formulario de Login");
        log.info("Email: " + email);
        log.info("Contraseña: " + contrasena);

        // Buscar usuario por email en la base de datos
        Usuario usuarioExistente = userService.findUserByEmail(email);

        // Si el usuario no existe o la contraseña no coincide
        if (usuarioExistente == null || !passwordEncoder.matches(contrasena, usuarioExistente.getContrasena())) {
            model.addAttribute("mensaje", "❌ Credenciales incorrectas. Intenta nuevamente.");
            return "index";  // Redirige al login con mensaje de error
        }

        // Almacena el email y el rol en la sesión (además del email, guardamos el rol)
        session.setAttribute("email", email);
        session.setAttribute("rol", usuarioExistente.getRol());

        model.addAttribute("texto", "Bienvenido " + usuarioExistente.getEmail());
        return "redirect:/principal";  // Redirigir a la página principal
    }



    
    

    /**
     * Redirige entre login y registro según el origen.
     */
    @GetMapping("/loginRegistro")
    public String redirigirSegunOrigen(String source) {
        return source.equalsIgnoreCase("registro") ? "registro" : "index"; // Redirige a la vista correspondiente
    }

    
    /**
     * Redirige entre login y administrad según el origen.
     */
    // Modificado: Redirige a la página de administrador solo si el usuario es administrador
    @GetMapping("/administrador")
    public String mostrarAdministrador(Model model, HttpSession session) {
        String email = (String) session.getAttribute("email");
        String rol = (String) session.getAttribute("rol");

        if (email == null || rol == null) {
            model.addAttribute("mensaje", "No estás autenticado correctamente.");
            return "index";  
        }

        Usuario usuarioExistente = userService.findUserByEmail(email);

        if (usuarioExistente != null) {
            log.info("Rol del usuario: " + usuarioExistente.getRol());
            model.addAttribute("usuario", usuarioExistente.getNombre());

            if ("Administrador".equals(rol)) {
                model.addAttribute("mensaje", "Eres un administrador. Bienvenido al panel.");
                return "administrador";  
            } else {
                model.addAttribute("mensaje", "No tienes acceso de administrador.");
                return "index";
            }
        } else {
            model.addAttribute("mensaje", "Usuario no encontrado.");
            return "index";  
        }
    }




    @GetMapping("/administrador/prueba")
    public String mostrarAdministradorPrueba(Model model) {
        log.info("Obteniendo lista de productos...");

        // Obtener los productos desde el servicio
        List<Producto> productos = productoService.obtenerTodosLosProductos();

        // Verificar y registrar en consola
        if (productos.isEmpty()) {
            log.info("No hay productos disponibles.");
            model.addAttribute("mensaje", "No hay productos disponibles.");
        } else {
            log.info("Productos obtenidos: " + productos.size());
            for (Producto p : productos) {
                log.info("Producto -> ID: " + p.getId_producto() + ", Nombre: " + p.getNombre() +
                         ", Descripción: " + p.getDescripcion() + ", Precio: " + p.getPrecio() +
                         ", Stock: " + p.getStock() + ", Categoría: " + p.getCategoria());
            }
            model.addAttribute("productos", productos);
        }

        return "productos"; // Cargar la vista del administrador con la lista de productos
    }



    @GetMapping("/editarProducto/{id}")
    public String editarProducto(@PathVariable("id") Integer id, Model model) {
        Producto producto = productoService.obtenerProductoPorId(id); // Obtener el producto de la base de datos
        if (producto != null) {
            model.addAttribute("producto", producto);
            return "editarProducto";  // Vista JSP para editar el producto
        } else {
            model.addAttribute("mensaje", "Producto no encontrado");
            return "productos"; // Redirige a la vista de productos si no se encuentra el producto
        }
    }

    
    @PostMapping("/actualizarProducto")
    public String actualizarProducto(Producto producto, RedirectAttributes redirectAttributes) {
        // Llamamos al servicio para guardar el producto actualizado
        productoService.actualizarProducto(producto);

        // Mensaje de éxito
        redirectAttributes.addFlashAttribute("mensaje", "Producto actualizado correctamente.");
        return "redirect:/administrador/prueba";  // Redirigir a la página de productos
    }


    /**
     * Método para eliminar un producto.
     */
    @GetMapping("/borrarProducto/{id}")
    public String borrarProducto(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
        Producto producto = productoService.obtenerProductoPorId(id);

        if (producto != null) {
            productoService.eliminarProducto(id);
            redirectAttributes.addFlashAttribute("mensaje", "✅ El producto ha sido eliminado con éxito!");
        } else {
            redirectAttributes.addFlashAttribute("mensaje", "❌ Producto no encontrado.");
        }

        return "redirect:/administrador/prueba";  // Redirige de nuevo a la lista de productos
    }
    
    
    
    
 // Mostrar el formulario de inserción de productos
    @GetMapping("/insertarProducto")
    public String mostrarFormularioInsertar(Model model) {
        model.addAttribute("producto", new Producto()); // Se pasa un objeto vacío al formulario
        return "insertarProducto";  // Vista JSP para insertar producto
    }

    // Procesar el formulario y guardar el producto en la base de datos
    @PostMapping("/guardarProducto")
    public String guardarProducto(Producto producto, RedirectAttributes redirectAttributes) {
        try {
            productoService.saveProducto(producto);
            redirectAttributes.addFlashAttribute("mensaje", "✅ Producto insertado correctamente.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("mensaje", "❌ Error al insertar el producto.");
        }
        return "redirect:/administrador/prueba";  // Redirigir a la lista de productos
    }

    
    
    /**
     * Esta ruta es la principal y muestra la vista principal.jsp.
     */
    @GetMapping("/principal")
    public String principal() {
        return "principal";  // Redirige a la vista principal.jsp
    }
}
