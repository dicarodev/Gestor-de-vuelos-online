package es.vuelaconmigo.repository;

import es.vuelaconmigo.model.Purchase;
import es.vuelaconmigo.model.User;

import java.util.List;

public interface PurchaseDAO {
    boolean addPurchase(Purchase purchase);
}
