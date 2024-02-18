package es.vuelaconmigo.repository;

import es.vuelaconmigo.model.User;

import java.util.List;

public interface UsersDAO {
    boolean authenticateUser(String username, String password);

    String getUserRole(String mail);

    User getUserByEmail(String email);

    User getUserById(int idUser);

    boolean addUser(User user);

    boolean editUser(User user);

    boolean removeUser(int idUser);

    List<User> getAllUsers();
}
