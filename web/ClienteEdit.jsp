<%-- 
    Document   : ClienteEdit
    Created on : 17/10/2016, 23:10:20
    Author     : Pedro Augusto Gonçalez
--%>

<%@page import="br.com.fatecpg.cad.ClienteArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.cad.Database"%>
<%@page import="br.com.fatecpg.cad.Cliente"%>
<%@page import="br.com.fatecpg.cad.Endereco"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
ArrayList<Cliente> lista = ClienteArrayList.getCliente();
int id = Integer.parseInt(request.getParameter("indice"));
Cliente clienteEditado = new Cliente();
clienteEditado = lista.get(id);

if (request.getParameter("salvar") != null) {    
Endereco e = new Endereco();

// ENDEREÇO
e.setCidade(request.getParameter("cidade"));
e.setEstado(request.getParameter("estado"));
e.setLogradouro(request.getParameter("logradouro"));
e.setNumero(Integer.parseInt(request.getParameter("numero")));

// CLIENTE
clienteEditado.setNome(request.getParameter("nome"));
clienteEditado.setTelefone(request.getParameter("telefone"));
clienteEditado.setEmail(request.getParameter("email"));
clienteEditado.setCPF(request.getParameter("CPF"));
clienteEditado.setRG(request.getParameter("RG"));
clienteEditado.setEndereco(e);

lista.set(id, clienteEditado);
response.sendRedirect("Cliente.jsp");
}

if(request.getParameter("excluir")!=null){
        String par = request.getParameter("indice");
        int i = Integer.parseInt(par);
        lista.remove(i);
        response.sendRedirect("Cliente.jsp");
    }
%>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente - <%= clienteEditado.getNome()%></title>
    </head>
    <body>
    <form>
        <fieldset>
          <legend>Incluir</legend>
          Nome: <input type="text" name="nome" value="<%=clienteEditado.getNome()%>"/>
          Email: <input type="text" name="email" value="<%=clienteEditado.getEmail()%>"/>
          Telefone: <input type="text" name="telefone" value="<%=clienteEditado.getTelefone()%>"/>               
        </fieldset>

        <fieldset>    
          <legend>Endereço</legend>
          Cidade: <input type="text" name="cidade" value="<%=clienteEditado.getEndereco().getCidade()%>"/>
          Estado: <input type="text" name="estado" value="<%=clienteEditado.getEndereco().getEstado()%>"/>
          Logradouro (Rua/Av.): <input type="text" name="logradouro" 
             value="<%=clienteEditado.getEndereco().getLogradouro()%>"/>
          Número: <input type="text" name="numero" value="<%=clienteEditado.getEndereco().getNumero()%>"/>
        </fieldset>    

        <fieldset>
          <legend>Pessoa Física</legend>
          RG: <input type="text" name="RG" value="<%=clienteEditado.getRG()%>"/>
          CPF: <input type="text" name="CPF" value="<%=clienteEditado.getCPF()%>"/>
        </fieldset>
        
        <input type="submit" name="salvar" value="Salvar"/>
        <input type="submit" name="excluir" value="Excluir"/>
        <input type="hidden" name="indice" value="<%=id%>"/>
        
    </form>        
    </body>
</html>