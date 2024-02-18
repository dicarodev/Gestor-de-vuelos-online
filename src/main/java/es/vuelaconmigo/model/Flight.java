package es.vuelaconmigo.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="FLIGHTS")
@Component
@Scope(value = "prototype")
public class Flight {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "ID_FLIGHT")
    private int idFlight;

    private boolean nationalFlight;

    @NotBlank
    private String origin;

    @NotBlank
    private String destination;

    private LocalDate dateFlight;

    private int availableSeats;

    @NotBlank
    private String departureTime;

    @NotBlank
    private String arrivalTime;

    @NotBlank
    private String duration;
    private int capacity;
    private double price;

    @OneToMany(mappedBy = "flight", fetch = FetchType.EAGER)
    private List<Purchase> purchaseList = new ArrayList<>();
}