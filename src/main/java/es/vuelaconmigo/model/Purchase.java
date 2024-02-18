package es.vuelaconmigo.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="PURCHASES")
@Component
@Scope(value = "prototype")
public class Purchase {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "ID_SALE")
    private int idSale;
    private LocalDate dateSale;
    private String paymentMethod;
    private int amountTickets;
    private String companions;

    @ManyToOne
    @JoinColumn(name = "ID_USER", foreignKey = @ForeignKey(name = "ID_USER"))
    private User user;

    @ManyToOne
    @JoinColumn(name = "ID_FLIGHT", foreignKey = @ForeignKey(name = "ID_FLIGHT"))
    private Flight flight;
}
