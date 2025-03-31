package com.formacion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.formacion.entities.Usuario;
import com.formacion.service.UserService;

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
    public String procesarFormularioRegistro(String nombre, String email, String contrasena, String apellido, Model model) {
        log.info("Procesamos el formulario de Registro");
        log.info("Nombre: " + nombre);
        log.info("Email: " + email);
        log.info("Contraseña: " + contrasena);
        log.info("Apellido: " + apellido);

        String mensaje;
        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setEmail(email);
        usuario.setContrasena(passwordEncoder.encode(contrasena)); // Contraseña no cifrada
        usuario.setApellido(apellido);

        // Verificamos si el usuario ya existe
        Usuario usuarioExistente = userService.findUserByEmail(email);
        log.info("Comprobamos si el usuario ya existe");

        if (usuarioExistente == null) {
            // Si el usuario no existe, lo creamos
            userService.saveUser(usuario);
            mensaje = "El usuario ha sido creado con éxito!";
            log.info("Usuario creado con éxito: " + usuario.getEmail());
            model.addAttribute("mensaje", mensaje); // Pasamos el mensaje a la vista
            return "redirect:/index"; // Redirige a la página de login después de registro exitoso
        } else {
            // Si el usuario ya existe, mostramos un mensaje de error
            mensaje = "El usuario ya está registrado!";
            log.info("El usuario ya está registrado: " + email);
            model.addAttribute("mensaje", mensaje); // Pasamos el mensaje a la vista
            return "registro"; // Si el usuario ya existe, regresa a la vista de registro con el mensaje
        }
    }

    

    /**
     * Procesa el formulario de login y redirige a la página principal si el login es exitoso.
     */
    @PostMapping("/formularioLogin")
    public String procesarFormularioLogin(String email, String contrasena, Model model) {
        log.info("Procesamos el formulario de Login");
        log.info(email);
        log.info(contrasena);

        Usuario usuarioExistente = userService.findUserByEmail(email);

        if (usuarioExistente == null || !passwordEncoder.matches(contrasena, usuarioExistente.getContrasena())) {

            model.addAttribute("mensaje", "Credenciales incorrectas. Intenta nuevamente.");
            return "index";  // Redirige al login con mensaje de error
        }

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
     * Esta ruta es la principal y muestra la vista principal.jsp.
     */
    @GetMapping("/principal")
    public String principal() {
        return "principal";  // Redirige a la vista principal.jsp
    }
}
