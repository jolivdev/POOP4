<%-- 
    Document   : Cliente
    Created on : 17/10/2016, 22:58:10
    Author     : Pedro Augusto Gonçalez
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.cad.Database"%>
<%@page import="br.com.fatecpg.cad.Cliente"%>
<%@page import="br.com.fatecpg.cad.Endereco"%>
<%@page import="br.com.fatecpg.cad.ClienteArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    ArrayList<Cliente> lista = ClienteArrayList.getCliente();
    if (request.getParameter("incluir") != null) {
        Cliente p = new Cliente();
        Endereco e = new Endereco();
        
        // Endereço
        e.setCidade(request.getParameter("cidade"));
        e.setEstado(request.getParameter("estado"));
        e.setLogradouro(request.getParameter("logradouro"));
        e.setNumero(Integer.parseInt(request.getParameter("numero")));
        
        // Cliente
        p.setNome(request.getParameter("nome"));
        p.setTelefone(request.getParameter("telefone"));
        p.setEmail(request.getParameter("email"));
        p.setCPF(request.getParameter("CPF"));
        p.setRG(request.getParameter("RG"));
        p.setEndereco(e);
       
        lista.add(p);
        response.sendRedirect(request.getRequestURI());
    }
    
    if(request.getParameter("excluir")!=null){
        String par = request.getParameter("1");
        int i = Integer.parseInt(par);
        lista.remove(i);
        response.sendRedirect(request.getRequestURI());
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
    </head>
    <body>
    <form>
        <fieldset>
            <legend>Incluir</legend>
             Nome: <input type="text" name="nome"/>
             Email: <input type="text" name="email"/>
             Telefone: <input type="text" name="telefone"/>               
        </fieldset>
            
        <fieldset>    
            <legend>Endereço</legend>
             Cidade: <input type="text" name="cidade"/>
             Estado: <input type="text" name="estado"/>
             Logradouro (Rua/Av.): <input type="text" name="logradouro"/>
             Número: <input type="text" name="numero"/>
        </fieldset>    
            
        <fieldset>
            <legend>Pessoa Física</legend>
            CPF: <input type="text" name="CPF"/>
            RG: <input type="text" name="RG"/>
        </fieldset>
            
        <input type="submit" name="incluir" value="Incluir"/>
            
    </form>
        <h2>Lista</h2>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Telefone</th>
                <th>Endereço</th>
                <th>CPF</th>   
                <th>RG</th> 
                <th>Remover</th>
            </tr>
            <% for(Cliente p: lista) { %>
            <tr>
                <td><%= lista.indexOf(p) %></td>
                <td><%= p.getNome() %></td>
                <td><%= p.getEmail() %></td>
                <td><%= p.getTelefone() %></td>
                <td><%= String.format("%1s, %2s - %3s, Nº%4s",
                        p.getEndereco().getCidade(),
                        p.getEndereco().getEstado(),
                        p.getEndereco().getLogradouro(),
                        p.getEndereco().getNumero()) %>
                </td>
                <td><%= p.getCPF() %></td>  
                <td><%= p.getRG() %></td> 
                <td>
                 <form>
                    <input type="hidden" name="1" value="<%= lista.indexOf(p)%>"/>
                    <input type="submit" name="excluir" value="Excluir"/>
                 </form>
                </td>
            </tr>
            <% } %>
        </table> 
    </body>
</html>