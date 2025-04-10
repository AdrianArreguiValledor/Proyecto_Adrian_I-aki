package com.formacion.service;

import com.formacion.entities.ApiUserResponse;
import com.formacion.entities.User;
import com.formacion.repository.User2Repository;

import java.util.Optional;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

@Service
public class ApiService {

    private final WebClient webClient;
    private final User2Repository user2Repository;
    private final PasswordEncoder passwordEncoder;
    
    public ApiService(WebClient webClient, User2Repository user2Repository,PasswordEncoder passwordEncoder) {
        this.webClient = webClient;
        this.user2Repository = user2Repository;
		this.passwordEncoder = passwordEncoder;
    }

    // Este método obtiene los datos de la API y los guarda en la base de datos
    public void fetchAndSaveUserData() {
       
            String url = "https://dummyjson.com/users/1"; // URL de la API

            
         // Verificar si el usuario ya existe en la base de datos
            Optional<User> existingUser = user2Repository.findByfirstName("Emily"); // Usando "username" como ejemplo
            if (existingUser.isPresent()) {
                // Si el usuario ya existe, no hacer nada
                return;
            }
            
            
            // Realizar la llamada a la API y obtener los datos
            ApiUserResponse apiUserResponse = webClient.get()
                    .uri(url)
                    .retrieve()
                    .bodyToMono(ApiUserResponse.class)
                    .block(); // Bloquea para obtener el resultado (no reactivo)

            // Convertir la respuesta de la API en un objeto User
            User user = mapApiResponseToUser(apiUserResponse);
            
            // Hashear la contraseña 
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            
            // Guardar el usuario en la base de datos
            user2Repository.save(user);  // Asegúrate de que esto guarda correctamente el objeto User
        }
    
    
    // Este método mapea la respuesta de la API a un objeto User
    private User mapApiResponseToUser(ApiUserResponse apiUserResponse) {
        User user = new User();
        user.setFirstName(apiUserResponse.getFirstName());
        user.setLastName(apiUserResponse.getLastName());
        user.setMaidenName(apiUserResponse.getMaidenName());
        user.setAge(apiUserResponse.getAge());
        user.setGender(apiUserResponse.getGender());
        user.setEmail(apiUserResponse.getEmail());
        user.setPhone(apiUserResponse.getPhone());
        user.setUsername(apiUserResponse.getUsername());
        user.setPassword(apiUserResponse.getPassword());
        user.setBirthDate(apiUserResponse.getBirthDate());
        user.setImage(apiUserResponse.getImage());
        user.setBloodGroup(apiUserResponse.getBloodGroup());
        user.setHeight(apiUserResponse.getHeight());
        user.setWeight(apiUserResponse.getWeight());
        user.setEyeColor(apiUserResponse.getEyeColor());
        //añadir pelo
        user.setHairType(apiUserResponse.getHair().getType());
        user.setHairColor(apiUserResponse.getHair().getColor());

        // Mapear los campos de la dirección
        if (apiUserResponse.getAddress() != null) {
            user.setAddress(apiUserResponse.getAddress().getAddress());
            user.setCity(apiUserResponse.getAddress().getCity());
            user.setState(apiUserResponse.getAddress().getState());
            user.setStateCode(apiUserResponse.getAddress().getStateCode());
            user.setPostalCode(apiUserResponse.getAddress().getPostalCode());
            user.setLat(apiUserResponse.getAddress().getCoordinates().getLat());
            user.setLng(apiUserResponse.getAddress().getCoordinates().getLng());
            user.setCountry(apiUserResponse.getAddress().getCountry());
        }

        // Mapear otros campos
        user.setMacAddress(apiUserResponse.getMacAddress());
        user.setUniversity(apiUserResponse.getUniversity());
        user.setBankCardExpire(apiUserResponse.getBank().getCardExpire());
        user.setBankCardNumber(apiUserResponse.getBank().getCardNumber());
        user.setBankCardType(apiUserResponse.getBank().getCardType());
        user.setBankCurrency(apiUserResponse.getBank().getCurrency());
        user.setBankIban(apiUserResponse.getBank().getIban());
        user.setCompanyDepartment(apiUserResponse.getCompany().getDepartment());
        user.setCompanyName(apiUserResponse.getCompany().getName());
        user.setCompanyTitle(apiUserResponse.getCompany().getTitle());
        user.setCompanyAddress(apiUserResponse.getCompany().getAddress().getAddress());
        user.setCompanyCity(apiUserResponse.getCompany().getAddress().getCity());
        user.setCompanyState(apiUserResponse.getCompany().getAddress().getState());
        user.setCompanyStateCode(apiUserResponse.getCompany().getAddress().getStateCode());
        user.setCompanyPostalCode(apiUserResponse.getCompany().getAddress().getPostalCode());
        user.setCompanyLat(apiUserResponse.getCompany().getAddress().getCoordinates().getLat());
        user.setCompanyLng(apiUserResponse.getCompany().getAddress().getCoordinates().getLng());
        user.setCompanyCountry(apiUserResponse.getCompany().getAddress().getCountry());
        user.setEin(apiUserResponse.getEin());
        user.setSsn(apiUserResponse.getSsn());
        user.setUserAgent(apiUserResponse.getUserAgent());
        user.setCryptoCoin(apiUserResponse.getCrypto().getCoin());
        user.setCryptoWallet(apiUserResponse.getCrypto().getWallet());
        user.setCryptoNetwork(apiUserResponse.getCrypto().getNetwork());
        user.setRole(apiUserResponse.getRole());

        return user;
    }
}
