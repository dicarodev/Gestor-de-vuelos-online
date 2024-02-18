package es.vuelaconmigo.utils;

import es.vuelaconmigo.model.Flight;
import es.vuelaconmigo.repository.FlightsDAO;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.time.LocalDate;


public class InitDefaultFlights {
    public static void main(String[] args) {

        ApplicationContext appContext = new AnnotationConfigApplicationContext("es.vuelaconmigo");

        FlightsDAO flightsDAO = appContext.getBean("flightsDAOImplement", FlightsDAO.class);

        Flight flight = appContext.getBean("flight", Flight.class);

        flight.setNationalFlight(true);
        flight.setOrigin("Madrid");
        flight.setDestination("Barcelona");
        flight.setDateFlight(LocalDate.of(2024, 8, 5));
        flight.setAvailableSeats(150);
        flight.setDepartureTime("08:00");
        flight.setArrivalTime("10:00");
        flight.setDuration("2 hours");
        flight.setCapacity(200);
        flight.setPrice(100.0);
        flightsDAO.addFlight(flight);

        flight.setNationalFlight(true);
        flight.setOrigin("Barcelona");
        flight.setDestination("Madrid");
        flight.setDateFlight(LocalDate.of(2024, 8, 5));
        flight.setAvailableSeats(180);
        flight.setDepartureTime("12:00");
        flight.setArrivalTime("14:00");
        flight.setDuration("2 hours");
        flight.setCapacity(200);
        flight.setPrice(120.0);
        flightsDAO.addFlight(flight);

        flight.setNationalFlight(false);
        flight.setOrigin("New York");
        flight.setDestination("Los Angeles");
        flight.setDateFlight(LocalDate.of(2024, 8, 5));
        flight.setAvailableSeats(200);
        flight.setDepartureTime("09:30");
        flight.setArrivalTime("12:30");
        flight.setDuration("3 hours");
        flight.setCapacity(250);
        flight.setPrice(250.0);
        flightsDAO.addFlight(flight);

        flight.setNationalFlight(false);
        flight.setOrigin("London");
        flight.setDestination("Paris");
        flight.setDateFlight(LocalDate.of(2024, 8, 5));
        flight.setAvailableSeats(120);
        flight.setDepartureTime("15:00");
        flight.setArrivalTime("17:00");
        flight.setDuration("2 hours");
        flight.setCapacity(150);
        flight.setPrice(150.0);
        flightsDAO.addFlight(flight);

        flight.setNationalFlight(false);
        flight.setOrigin("Tokyo");
        flight.setDestination("Seoul");
        flight.setDateFlight(LocalDate.of(2024, 8, 5));
        flight.setAvailableSeats(160);
        flight.setDepartureTime("14:30");
        flight.setArrivalTime("16:30");
        flight.setDuration("2 hours");
        flight.setCapacity(180);
        flight.setPrice(180.0);
        flightsDAO.addFlight(flight);

        ((AnnotationConfigApplicationContext)appContext).close();
    }
}
