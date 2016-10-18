<%-- 
    Document   : FornecedorEdit
    Created on : 17/10/2016, 13:44:32
    Author     : Vilete
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.cad.Database"%>
<%@page import="br.com.fatecpg.cad.Fornecedor"%>
<%@page import="br.com.fatecpg.cad.Endereco"%>
<!DOCTYPE html>
<html>
<%
ArrayList<Fornecedor> lista = Database.getFornecedor();
int id = Integer.parseInt(request.getParameter("indice"));
Fornecedor fornecedorEditado = new Fornecedor();
fornecedorEditado = lista.get(id);

if (request.getParameter("salvar") != null) {    
Endereco e = new Endereco();
//<Endereço>
e.setCidade(request.getParameter("cidade"));
e.setEstado(request.getParameter("estado"));
e.setLogradouro(request.getParameter("logradouro"));
e.setNumero(Integer.parseInt(request.getParameter("numero")));
//</Endereço>
//<Fornecedor>
fornecedorEditado.setNome(request.getParameter("nome"));
fornecedorEditado.setTelefone(request.getParameter("telefone"));
fornecedorEditado.setEmail(request.getParameter("email"));
fornecedorEditado.setEndereco(e);
fornecedorEditado.setCnpj(request.getParameter("cnpj"));
fornecedorEditado.setRazaoSocial(request.getParameter("razaosocial"));
//</Fornecedor>
lista.set(id,fornecedorEditado);
response.sendRedirect("Fornecedor.jsp");
}

if(request.getParameter("excluir")!=null){
        String par = request.getParameter("indice");
        int i = Integer.parseInt(par);
        lista.remove(i);
        response.sendRedirect("Fornecedor.jsp");
    }

%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fornecedor - <%= fornecedorEditado.getNome()%></title>
    </head>
    <body>
        <form>
    <fieldset>
        <legend>Incluir</legend>

        Nome: <input type="text" name="nome" value="<%=fornecedorEditado.getNome()%>"/>
            Email: <input type="text" name="email" value="<%=fornecedorEditado.getEmail()%>"/>
            Telefone: <input type="text" name="telefone" value="<%=fornecedorEditado.getTelefone()%>"/>               
    </fieldset>

    <fieldset>    
        <legend>Endereço</legend>
        Cidade: <input type="text" name="cidade" value="<%=fornecedorEditado.getEndereco().getCidade()%>"/>
        Estado: <input type="text" name="estado" value="<%=fornecedorEditado.getEndereco().getEstado()%>"/>
        Logradouro: <input type="text" name="logradouro" value="<%=fornecedorEditado.getEndereco().getLogradouro()%>"/>
        Numero: <input type="text" name="numero" value="<%=fornecedorEditado.getEndereco().getNumero()%>"/>
    </fieldset>    

    <fieldset>
        <legend>Pessoa Jurídica</legend>
        Razão Social: <input type="text" name="razaosocial" value="<%=fornecedorEditado.getRazaoSocial()%>"/>
        CNPJ: <input type="text" name="cnpj" value="<%=fornecedorEditado.getCnpj()%>"/>
    </fieldset>
        <input type="submit" name="salvar" value="Salvar"/>
        <input type="submit" name="excluir" value="Excluir"/>
        <input type="hidden" name="indice" value="<%=id%>"/>
    </form>        
        
    </body>
</html>
