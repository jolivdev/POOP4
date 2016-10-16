package br.com.fatecpg.cad;

import java.util.ArrayList;

public class Database {
    private static ArrayList<Fornecedor> fornecedores = new ArrayList<>();
    
    public static ArrayList<Fornecedor> getFornecedor(){
        return fornecedores;
    }  
}
