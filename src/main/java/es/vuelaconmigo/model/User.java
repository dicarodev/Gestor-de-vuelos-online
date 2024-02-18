package es.vuelaconmigo.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.*;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="USERS")
@Component
@Scope(value = "prototype")
public class User {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "ID_USER")
    private int idUser;

    private String rol;

    @NotEmpty
    @Size(max = 20)
    @Pattern(regexp = "^[a-zA-ZñÑáéíóúÁÉÍÓÚ\\s]+$")
    private String name;

    @NotEmpty
    @Size(max = 20)
    @Pattern(regexp = "^[a-zA-ZñÑáéíóúÁÉÍÓÚ\\s]+$")
    private String surnames;

    @NotEmpty
    @Size(max = 30)
    private String address;

    @NotEmpty
    @Size(max = 30)
    private String phone;

    @Column(unique = true)
    @NotEmpty
    private String mail;
    private String password;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    private List<Purchase> purchaseList = new ArrayList<>();


}
