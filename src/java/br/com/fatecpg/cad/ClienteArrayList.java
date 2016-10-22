package br.com.fatecpg.cad;

import java.util.ArrayList;

/* @author Pedro Augusto Gonçalez */

public class ClienteArrayList {
    private static ArrayList<Cliente> cliente = new ArrayList<>();
    
    public static ArrayList<Cliente> getCliente(){
        return cliente;
    }  
}
