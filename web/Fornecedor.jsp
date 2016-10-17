<%-- 
    Document   : Fornecedor
    Created on : 17/10/2016, 13:12:17
    Author     : Vilete
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.cad.Database"%>
<%@page import="br.com.fatecpg.cad.Fornecedor"%>
<%@page import="br.com.fatecpg.cad.Endereco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<Fornecedor> lista = Database.getFornecedor();
    if (request.getParameter("incluir") != null) {
        Fornecedor p = new Fornecedor();
        Endereco e = new Endereco();
        //<Endereço>
        e.setCidade(request.getParameter("cidade"));
        e.setEstado(request.getParameter("estado"));
        e.setLogradouro(request.getParameter("logradouro"));
        e.setNumero(Integer.parseInt(request.getParameter("numero")));
        //</Endereço>
        //<Fornecedor>
        p.setNome(request.getParameter("nome"));
        p.setTelefone(request.getParameter("telefone"));
        p.setEmail(request.getParameter("email"));
        p.setEndereco(e);
        p.setCnpj(request.getParameter("cnpj"));
        p.setRazaoSocial(request.getParameter("razaosocial"));
        //</Fornecedor>
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
        <title>Fornecedor</title>
        
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
            Logradouro: <input type="text" name="logradouro"/>
            Numero: <input type="text" name="numero"/>
        </fieldset>    
            
        <fieldset>
            <legend>Pessoa Jurídica</legend>
            Razão Social: <input type="text" name="razaosocial"/>
            CNPJ: <input type="text" name="cnpj"/>
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
                <th>Razão Social</th>
                <th>CNPJ</th>
                
                
                <th>Remover</th>
            </tr>
            <% for(Fornecedor p: lista) { %>
            <tr>
                <td><%= lista.indexOf(p) %></td>
                <td><%= p.getNome() %></td>
                <td><%= p.getEmail() %></td>
                <td><%= p.getTelefone() %></td>
                <td><%= String.format("%1s, %2s - %3s, Nº%4s", p.getEndereco().getCidade(), p.getEndereco().getEstado(), p.getEndereco().getLogradouro(), p.getEndereco().getNumero()) %></td>
                <td><%= p.getRazaoSocial() %></td>
                <td><%= p.getCnpj() %></td>                
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
