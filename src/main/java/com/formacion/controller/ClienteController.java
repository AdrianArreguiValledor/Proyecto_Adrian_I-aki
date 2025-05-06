package com.formacion.controller;

import com.formacion.entities.User;
import com.formacion.repository.User2Repository;
import com.formacion.service.ApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class ClienteController {

    @Autowired
    private ApiService apiService;

    @Autowired
    private User2Repository user2Repository;

    @Autowired
    private PasswordEncoder passwordEncoder; // Encriptador de contraseñas para la seguridad
    
    
    
    // Mostrar datos de los clientes
    @GetMapping("/cliente")
    public String viewClientes(Model model) {
        // Llamar al servicio para obtener los datos de la API y guardarlos en la base de datos
        apiService.fetchAndSaveUserData();  // Este método guarda los datos en la base de datos

        // Obtener todos los usuarios de la base de datos
        List<User> usuarios = user2Repository.findAll();  // Obtiene todos los usuarios guardados

        // Pasar los usuarios al modelo para ser utilizados en la JSP
        model.addAttribute("usuarios", usuarios);

        // Redirigir a la página cliente.jsp
        return "cliente";
    }

    // Mostrar formulario de inserción
    @GetMapping("/insertar")
    public String insertarUsuarioForm(Model model) {
        return "insertarUsuario";  // Redirige a la vista de inserción
    }

    // Guardar usuario
    @PostMapping("/guardar")
    public String guardarUsuario(User usuario) {
    	usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));
        user2Repository.save(usuario);  // Guardar el nuevo usuario
        return "redirect:/cliente";  // Redirigir a la vista de clientes
    }

    // Método para borrar un usuario
    @GetMapping("/borrar/{id}")
    public String borrarUsuario(@PathVariable("id") Long id) {
        // Eliminar el usuario de la base de datos
        user2Repository.deleteById(id);  // Eliminar por ID

        // Redirigir nuevamente a la página de clientes después de eliminar
        return "redirect:/cliente";  // Redirige a la página donde se muestran los clientes
    }

    // Mostrar formulario de edición
    @GetMapping("/editar/{id}")
    public String editarUsuario(@PathVariable("id") Long id, Model model) {
        // Buscar el usuario por ID
        User usuario = user2Repository.findById(id).orElse(null);

        // Pasar el usuario al modelo para ser editado
        model.addAttribute("usuario", usuario);

        // Redirigir a la página de edición (suponiendo que tienes una vista de edición)
        return "editarUsuario";  // Aquí la vista 'editar.jsp' sería la página de edición
    }

    // Actualizar usuario
    @PostMapping("/actualizar/{id}")
    public String actualizarUsuario(@PathVariable("id") Long id, User usuario) {
        usuario.setId(id);  // Asegúrate de que el ID sea correcto
        usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));
        user2Repository.save(usuario);  // Actualiza el usuario
        return "redirect:/cliente";  // Redirige a la vista de clientes
    }
}
