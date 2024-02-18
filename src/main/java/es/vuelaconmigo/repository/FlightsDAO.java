package es.vuelaconmigo.repository;

import es.vuelaconmigo.model.Flight;

import java.time.LocalDate;
import java.util.List;

public interface FlightsDAO {
    Flight getFlight(int idFlight);

    boolean addFlight(Flight flight);

    boolean editFlight(Flight flight);

    boolean removeFlight(int idFlight);

    List<Flight> getAllFlights();

    List<Flight> getFilteredFlights(String origin, String destination, LocalDate dateFlight);
}
