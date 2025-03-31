package com.formacion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.formacion.entities.Usuario;
import com.formacion.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.java.Log;

@Controller
@Log
public class LoginController {


	  
    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @GetMapping("/")
    public String inicio(Model model) {
        log.info("Arranca la app");
        return "index";  // Redirige a la página de login
    }

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
        // Recuperar el email y el rol desde la sesión
        String email = (String) session.getAttribute("email");
        String rol = (String) session.getAttribute("rol");

        if (email == null || rol == null) {
            model.addAttribute("mensaje", "No estás autenticado correctamente.");
            return "index";  // Redirige al login si no hay email o rol en sesión
        }

        // Buscar el usuario en la base de datos con el email
        Usuario usuarioExistente = userService.findUserByEmail(email);

        if (usuarioExistente != null) {
            log.info("Rol del usuario: " + usuarioExistente.getRol());

            // Siempre pasar el nombre del usuario
            model.addAttribute("usuario", usuarioExistente.getNombre());

            // Si el rol es "Administrador", muestra el mensaje de administrador
            if ("Administrador".equals(rol)) {
                model.addAttribute("mensaje", "Eres un administrador ////// Bienvenido al panel.");
            } else {
                // Si no es administrador, puedes pasar un mensaje diferente
                model.addAttribute("mensaje", "No tienes acceso de administrador.");
            }

            return "administrador";  // Redirige a administrador.jsp
        } else {
            model.addAttribute("mensaje", "Usuario no encontrado.");
            return "administrador";  // Redirige a administrador.jsp con el mensaje de error
        }
    }






    
    
    
    /**
     * Esta ruta es la principal y muestra la vista principal.jsp.
     */
    @GetMapping("/principal")
    public String principal() {
        return "principal";  // Redirige a la vista principal.jsp
    }
}
