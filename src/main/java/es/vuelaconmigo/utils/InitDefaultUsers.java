package es.vuelaconmigo.utils;

import es.vuelaconmigo.model.User;
import es.vuelaconmigo.repository.UsersDAO;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class InitDefaultUsers {
    public static void main(String[] args) {

        ApplicationContext appContext = new AnnotationConfigApplicationContext("es.vuelaconmigo");

        UsersDAO usersDAO = appContext.getBean("usersDAOImplement", UsersDAO.class);
        //Init user admin
        User user = appContext.getBean("user", User.class);

        user.setRol("Administrador");
        user.setName("Diego");
        user.setSurnames("Garcia Pérez");
        user.setAddress("Av. Americas, 13");
        user.setPhone("654987321");
        user.setMail("diego@vuelaconmigo.es");
        user.setPassword("toor");
        usersDAO.addUser(user);

        user.setRol("Cliente");
        user.setName("Carlos");
        user.setSurnames("Alvarez Roman");
        user.setAddress("C/ Torpedo, 18");
        user.setPhone("654987321");
        user.setMail("carlosAL@gmail.com");
        user.setPassword("carlos1234");
        usersDAO.addUser(user);

        user.setRol("Cliente");
        user.setName("Ana");
        user.setSurnames("González López");
        user.setAddress("Av. Libertad, 25");
        user.setPhone("689745123");
        user.setMail("ana.gonzalez@gmail.com");
        user.setPassword("ana4567");
        usersDAO.addUser(user);

        user.setRol("Cliente");
        user.setName("Pedro");
        user.setSurnames("Martínez García");
        user.setAddress("C/ Primavera, 12");
        user.setPhone("657321789");
        user.setMail("pedro.martinez@hotmail.com");
        user.setPassword("pedro7890");
        usersDAO.addUser(user);

        user.setRol("Cliente");
        user.setName("María");
        user.setSurnames("Sánchez Pérez");
        user.setAddress("Plaza Mayor, 7");
        user.setPhone("632147895");
        user.setMail("maria.sanchez@yahoo.com");
        user.setPassword("maria5678");
        usersDAO.addUser(user);

        user.setRol("Cliente");
        user.setName("Juan");
        user.setSurnames("López Martín");
        user.setAddress("C/ Sol, 3");
        user.setPhone("654789321");
        user.setMail("juan.lopez@gmail.com");
        user.setPassword("juan4321");
        usersDAO.addUser(user);


        ((AnnotationConfigApplicationContext)appContext).close();
    }
}
