package br.com.fatecpg.cad;

import java.util.ArrayList;

public class Database {
    private static ArrayList<Fornecedor> fornecedores = new ArrayList<>();
    
    public static ArrayList<Fornecedor> getFornecedor(){
        return fornecedores;
    }  
    private static ArrayList<Cliente> cliente = new ArrayList<>();
    
    public static ArrayList<Cliente> getCliente(){
        return cliente;
    }  
}
