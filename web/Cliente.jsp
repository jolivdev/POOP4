<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.cad.Database"%>
<%@page import="br.com.fatecpg.cad.Cliente"%>
<%@page import="br.com.fatecpg.cad.Endereco"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    ArrayList<Cliente> lista = Database.getCliente();
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
        p.setCPF(request.getParameter("cpf"));
        p.setRG(request.getParameter("rg"));
        p.setEndereco(e);

        lista.add(p);
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("excluir") != null) {
        String par = request.getParameter("indice");
        int i = Integer.parseInt(par);
        lista.remove(i);
        response.sendRedirect(request.getRequestURI());
    }
%>

<%@include file="WEB-INF/jspf/head.jspf" %>
<%@include file="WEB-INF/jspf/header.jspf" %>
<form id="inclusao" class="hide">
    <h2>Inclusão de Cliente</h2>
    <fieldset class="row">
        <legend>Dados do Cliente</legend>
        <div class="col s12 m12 input-field">
            <label for="nome">Nome</label>
            <input type="text" name="nome"  maxlength="100" id="nome" required/>
        </div>
        <%@include file="WEB-INF/jspf/formDados.jspf" %>
        <div class="col s12 m6 input-field">
            <label for="cpf">CPF</label>
            <input type="text" name="cpf" id="cpf" required/>
        </div>
        <div class="col s12 m6 input-field">
            <label for="rg">RG</label>
            <input type="text" name="rg" id="rg" required maxlength="12"/>
        </div>
        <%@include file="WEB-INF/jspf/formEndereco.jspf" %>
        <div class="col s12 m12 center-align">
            <input class="btn btn-large waves-effect waves-light" type="submit" name="incluir" value="Incluir"/>
        </div>
    </fieldset>
</form>
<div class="row">
    <div class="col s10 m11">
        <h2>Lista de Clientes</h2>
    </div>
    <div class="col s2 m1 add-button">
        <a id="adicionar" class="btn-floating right-align btn-large waves-effect waves-light red" title="Adicionar cliente"><i class="material-icons">add</i></a>
    </div>
</div>
<% if (!lista.isEmpty()) { %>
<table>
    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>Email</th>
        <th>Telefone</th>
        <th>Endereço</th>
        <th>CPF</th>   
        <th>RG</th> 
        <th></th>
    </tr>
    <% for (Cliente p : lista) {%>
    <tr>
        <td><%= lista.indexOf(p)%></td>
        <td>
            <%= p.getNome()%> 
            <a class="waves-effect waves-teal btn-flat" href="ClienteEdit.jsp?indice=<%= lista.indexOf(p)%>">
                <i class="material-icons">mode_edit</i>
            </a>
        </td>
        <td><%= p.getEmail()%></td>
        <td><%= p.getTelefone()%></td>
        <td><%= String.format("%1s, nº %4s. %2s - %3s", p.getEndereco().getLogradouro(), p.getEndereco().getNumero(), p.getEndereco().getCidade(), p.getEndereco().getEstado()) %></td>
        <td><%= p.getCPF()%></td>  
        <td><%= p.getRG()%></td> 
        <td>
            <form>
                <input type="hidden" name="indice" value="<%= lista.indexOf(p)%>"/>
                <input class="btn red waves-effect waves-light" type="submit" name="excluir" value="Excluir"/>
            </form>
        </td>
    </tr>
    <% }%>
</table> 
<% } else { %>
    <p>A lista de Clientes está vazia. Para adicionar um novo clique no botão +</p>
<% }%>
<%@include file="WEB-INF/jspf/footer.jspf" %>