package br.com.fatecpg.cad;

/* @author Pedro Augusto Gonçalez */

public class Cliente extends Pessoa{
    private String CPF;
    private String RG;
    
    public String getCPF(){
        return CPF;
    }

    public void setCPF(String CPF){
        this.CPF = CPF;
    }
    
    public String getRG(){
        return RG;
    }

    public void setRG(String RG){
        this.RG = RG;
    }
}