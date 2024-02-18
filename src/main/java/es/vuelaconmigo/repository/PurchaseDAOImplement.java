package es.vuelaconmigo.repository;

import es.vuelaconmigo.model.Purchase;
import es.vuelaconmigo.model.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PurchaseDAOImplement implements PurchaseDAO{
    private EntityManagerFactory entityManagerFactory;
    private EntityManager entityManager;
    private String persistenceUnit = "VUELACONMIGO";

    public PurchaseDAOImplement() {
        entityManagerFactory = Persistence.createEntityManagerFactory(persistenceUnit);
    }

    @Override
    public boolean addPurchase(Purchase purchase) {
        entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(purchase);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception ex){
            return false;
        }
    }
}
