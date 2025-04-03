package com.formacion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.formacion.entities.Usuario;
import com.formacion.repository.UserRepository;

import java.util.List;

@Service  // Anotación que marca la clase como un servicio de Spring, que contiene la lógica de negocio.
public class UserService {

    // Inyección de dependencia de UserRepository, que es el repositorio que maneja las operaciones CRUD para la entidad Usuario.
    private final UserRepository userRepository;

    // Constructor de la clase, donde se inyecta el repositorio de usuarios.
    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;  // Se asigna el repositorio inyectado a la propiedad
    }

    // Método para buscar un usuario por su email.
    public Usuario findUserByEmail(String email) {
        return userRepository.findByEmail(email);  // Utiliza el método findByEmail del repositorio para encontrar un usuario por su email.
    }

    // Método para guardar un usuario en la base de datos.
    public void saveUser(Usuario user) {
        System.out.println("Guardando usuario: " + user.getEmail());  // Log de ejemplo que muestra el email del usuario antes de guardarlo.
        userRepository.save(user);  // Utiliza el método save del repositorio para guardar el usuario en la base de datos.
        System.out.println("Usuario guardado con éxito: " + user.getEmail());  // Log de éxito indicando que el usuario ha sido guardado.
    }

    // Método para obtener todos los usuarios almacenados en la base de datos.
    public List<Usuario> findAllUsers() {
        return userRepository.findAll();  // Llama al método findAll del repositorio que devuelve una lista con todos los usuarios.
    }
}
