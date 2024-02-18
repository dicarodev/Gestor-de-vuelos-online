package es.vuelaconmigo.controller;

import es.vuelaconmigo.model.Flight;
import es.vuelaconmigo.model.Purchase;
import es.vuelaconmigo.model.User;
import es.vuelaconmigo.repository.FlightsDAO;
import es.vuelaconmigo.repository.PurchaseDAO;
import es.vuelaconmigo.repository.UsersDAO;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
public class TaskController {

    @Autowired
    FlightsDAO flightsDAO;
    @Autowired
    UsersDAO usersDAO;
    @Autowired
    PurchaseDAO purchaseDAO;

    @Autowired
    Flight flight;
    @Autowired
    User user;
    @Autowired
    Purchase purchase;


    //Request Authentication Custom, not work!
    @RequestMapping("/")
    public String initApp(){
        return "init_app";
    }

    @RequestMapping("/login")
    public String login(@RequestParam("mail") String userMail, @RequestParam("password") String userPassword,
                        Model modelFlightList,
                        HttpSession session) {

        if (usersDAO.authenticateUser(userMail, userPassword)) {
            List<Flight> flightList = flightsDAO.getAllFlights();
            modelFlightList.addAttribute("flightList", flightList);

            session.setAttribute("email", userMail);
            session.setAttribute("userRole", usersDAO.getUserRole(userMail));

            return "flight_list";
        } else {
            return "redirect:/";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Invalida la sesión

        return "redirect:/";
    }

    @RequestMapping("/listClients")
    public String listClients(Model modelFlightList){
        List<User> userList = usersDAO.getAllUsers();
        modelFlightList.addAttribute("userList", userList);
        return "client_list";
    }

    @RequestMapping("/listFlights")
    public String listFlights(Model modelFlightList){
        List<Flight> flightList = flightsDAO.getAllFlights();
        modelFlightList.addAttribute("flightList", flightList);
        return "flight_list";
    }

    @GetMapping("/addFlight")
    public String addFlight(Model model){
        model.addAttribute("flight", flight);
        return "add_flight";
    }

    @PostMapping("/addFlight")
    public String addFlight(@ModelAttribute("flight") @Valid Flight flight, BindingResult bindingResult){
        if (!bindingResult.hasErrors()){
            if (flightsDAO.addFlight(flight)){
                return "redirect:/listFlights";
            }else {
                throw new RuntimeException("Error al añadir el vuelo en la base de datos");
            }
        }else {
            return "add_flight";
        }
    }

    @GetMapping("/edit/{idFlight}")
    public String editFlightForm(@PathVariable ("idFlight") int idFlight, Model model){
        Flight flight = flightsDAO.getFlight(idFlight);
        model.addAttribute("editFlight", flight);
        return "edit_flight";
    }

    @PostMapping("/edited")
    public String mergeEditFlight(Flight flight){
        if (flightsDAO.editFlight(flight)){
            return "redirect:/listFlights";
        }else{
            return "redirect:/edit/{"+flight.getIdFlight()+"}";
        }
    }

    @GetMapping("/remove/{idFlight}")
    public String removeFlight(@PathVariable ("idFlight") int idFlight){
        if (flightsDAO.removeFlight(idFlight)){
            return "redirect:/listFlights";
        }else {
            throw new RuntimeException("Error al eliminar el vuelo en la base de datos");
        }
    }

    @PostMapping("/filterFlights")
    public String filterFlights(@RequestParam(value = "origin", required = false) String origin,
                                @RequestParam(value = "destination", required = false) String destination,
                                @RequestParam(value = "dateFlight", required = false) LocalDate dateFlight,
                                Model modelFlightList){

        List<Flight> filteredFlightList = flightsDAO.getFilteredFlights(origin, destination, dateFlight);

        modelFlightList.addAttribute("flightList", filteredFlightList);

        return "flight_list";
    }

    @GetMapping("/registerUser")
    public String addUser(Model model){
        model.addAttribute("user", user);
        return "register_user";
    }

    @PostMapping("/registerUser")
    public String addUser(@ModelAttribute("user") @Valid User user,  BindingResult bindingResult, HttpSession session){
        if (!bindingResult.hasErrors()){
            return checkUser(user, session);
        }else {
            return "register_user";
        }
    }

    private String checkUser(User user, HttpSession session) {
        // Si es un admin el que añade user, se esta añadiendo un admin, si no, se esta realizando un autoregistro de un user cliente
        if(session.getAttribute("userRole") == null){
            user.setRol("Cliente"); //Establece rol por defecto cliente
            if (usersDAO.addUser(user)){
                session.setAttribute("userRole", usersDAO.getUserRole(user.getMail()));
                return "redirect:/listFlights";
            }else {
                throw new RuntimeException("Error al registrar el usuario administrador en la base de datos");
            }
        }else if(((String) session.getAttribute("userRole")).equalsIgnoreCase("administrador")){
            user.setRol("Administrador");
            if (usersDAO.addUser(user)){
                return "redirect:/listClients";
            }else {
                throw new RuntimeException("Error al registrar el usuario cliente en la base de datos");
            }
        }else {
            throw new RuntimeException("Error al registrar el usuario en la base de datos");
        }
    }

    @GetMapping("/editUser/{idUser}")
    public String editUserForm(@PathVariable ("idUser") int idUser, Model model){
        User user = usersDAO.getUserById(idUser);
        model.addAttribute("editUser", user);
        return "edit_user";
    }

    @PostMapping("/editedUser")
    public String mergeEditUser(User user){
        User userTemp = usersDAO.getUserById(user.getIdUser());
        user.setRol(userTemp.getRol());
        user.setPassword(userTemp.getPassword());

        if (usersDAO.editUser(user)){
            return "redirect:/listClients";
        }else{
            return "redirect:/editUser/{"+user.getIdUser()+"}";
        }
    }

    @GetMapping("/removeUser/{idUser}")
    public String removeUser(@PathVariable ("idUser") int idUser){
        if (usersDAO.removeUser(idUser)){
            return "redirect:/listClients";
        }else {
            throw new RuntimeException("Error al eliminar el cliente en la base de datos");
        }
    }

    @GetMapping("/purchase/{idFlight}")
    public String purchaseForm(@PathVariable ("idFlight") int idFlight, Model model){
        Flight flight = flightsDAO.getFlight(idFlight);
        model.addAttribute("purchaseFlight", flight);
        return "purchase_flight";
    }

    @PostMapping("/processPurchase")
    public String processPurchase(@RequestParam("idFlight") int idFlight,
                                  @RequestParam("paymentMethod") String paymentMethod,
                                  @RequestParam("amountTickets") int amountTickets,
                                  @RequestParam("companions") String companions,
                                  HttpSession session) {


        LocalDate dateSale = LocalDate.now();
        String userMail = (String) session.getAttribute("email");
        User user = usersDAO.getUserByEmail(userMail);
        Flight flight = flightsDAO.getFlight(idFlight);

        String [] companionsArray = companions.split(",");

        if (!companions.isEmpty()){
            if ((companionsArray.length + 1) == amountTickets){
                return setAndAddPurchase(paymentMethod, amountTickets, companions, dateSale, user, flight);
            }else {
                throw new RuntimeException("Error al procesar la compra");
            }
        }else {
            return setAndAddPurchase(paymentMethod, amountTickets, companions, dateSale, user, flight);
        }
    }

    private String setAndAddPurchase(String paymentMethod, int amountTickets, String companions, LocalDate dateSale, User user, Flight flight) {
        purchase.setDateSale(dateSale);
        purchase.setPaymentMethod(paymentMethod);
        purchase.setAmountTickets(amountTickets);
        purchase.setCompanions(companions);
        purchase.setUser(user);
        purchase.setFlight(flight);

        if (purchaseDAO.addPurchase(purchase)){
            flight.setAvailableSeats(flight.getAvailableSeats() - amountTickets);
            flightsDAO.editFlight(flight);

            return "redirect:/listFlights";
        }else {
            throw new RuntimeException("Error al añadir la compra en la base de datos");
        }
    }

    @RequestMapping("/listPurchases")
    public String listPurchasesByUser(Model modelPurchasesList, HttpSession session){
        String userMail = (String) session.getAttribute("email");
        User user = usersDAO.getUserByEmail(userMail);

        List<Purchase> purchaseList = user.getPurchaseList();
        modelPurchasesList.addAttribute("purchaseList", purchaseList);

        return "purchase_history";
    }
    @RequestMapping("/listPurchases/{idUser}")
    public String listPurchasesByUserId(@PathVariable int idUser, Model modelPurchasesList){
        User user = usersDAO.getUserById(idUser);

        List<Purchase> purchaseList = user.getPurchaseList();
        modelPurchasesList.addAttribute("purchaseList", purchaseList);

        return "purchase_history";
    }
}
