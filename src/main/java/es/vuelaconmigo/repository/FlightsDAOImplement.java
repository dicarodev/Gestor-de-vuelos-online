package es.vuelaconmigo.repository;

import es.vuelaconmigo.model.Flight;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public class FlightsDAOImplement implements FlightsDAO{
    private EntityManagerFactory entityManagerFactory;
    private EntityManager entityManager;
    private String persistenceUnit = "VUELACONMIGO";

    public FlightsDAOImplement() {
        entityManagerFactory = Persistence.createEntityManagerFactory(persistenceUnit);
    }

    @Override
    public Flight getFlight(int idFlight) {
        entityManager = entityManagerFactory.createEntityManager();
        return entityManager.find(Flight.class, idFlight);
    }

    @Override
    public List<Flight> getAllFlights(){
        entityManager = entityManagerFactory.createEntityManager();
        String hql = "from Flight f";
        Query query = entityManager.createQuery(hql);

        return query.getResultList();
    }

    @Override
    public List<Flight> getFilteredFlights(String origin, String destination, LocalDate dateFlight) {
        entityManager = entityManagerFactory.createEntityManager();
        String hql = "from Flight f where 1=1";

        // Agregar condiciones según los parámetros recibidos
        if (origin != null && !origin.isEmpty()) {
            hql += " and f.origin = :origin";
        }
        if (destination != null && !destination.isEmpty()) {
            hql += " and f.destination = :destination";
        }
        if (dateFlight != null) {
            hql += " and f.dateFlight = :dateFlight";
        }

        Query query = entityManager.createQuery(hql);

        // Asignar valores a los parámetros de la consulta, si es necesario
        if (origin != null && !origin.isEmpty()) {
            query.setParameter("origin", origin);
        }
        if (destination != null && !destination.isEmpty()) {
            query.setParameter("destination", destination);
        }
        if (dateFlight != null) {
            query.setParameter("dateFlight", dateFlight);
        }

        return query.getResultList();
    }


    @Override
    public boolean addFlight(Flight flight) {
        entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(flight);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception ex){
            return false;
        }
    }

    @Override
    public boolean editFlight(Flight flight) {
        entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(flight);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception ex){
            return false;
        }
    }

    @Override
    public boolean removeFlight(int idFlight) {
        entityManager = entityManagerFactory.createEntityManager();
        try {
            Flight flight = getFlight(idFlight);
            entityManager.getTransaction().begin();
            entityManager.remove(flight);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception ex){
            return false;
        }
    }
}
