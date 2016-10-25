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
        clienteEditado.setCPF(request.getParameter("cpf"));
        clienteEditado.setRG(request.getParameter("rg"));
        clienteEditado.setEndereco(e);

        lista.set(id, clienteEditado);
        response.sendRedirect("Cliente.jsp");
    }

    if (request.getParameter("excluir") != null) {
        String par = request.getParameter("indice");
        int i = Integer.parseInt(par);
        lista.remove(i);
        response.sendRedirect("Cliente.jsp");
    }
%>
<%@include file="WEB-INF/jspf/head.jspf" %>
<%@include file="WEB-INF/jspf/header.jspf" %>
<form>
    <h2>Edição de Cliente</h2>
    <fieldset class="row">
        <legend>Dados do Cliente</legend>
        <input type="hidden" name="indice" value="<%=id%>"/>
        <div class="col s12 m12 input-field">
            <label for="nome">Nome</label>
            <input type="text" name="nome" id="nome" value="<%=clienteEditado.getNome()%>" required/>
        </div>
        <div class="col s12 m6 input-field">
            <label for="email">Email</label>
            <input type="text" name="email" id="email" value="<%=clienteEditado.getEmail()%>" required/>
        </div>
        <div class="col s12 m6 input-field">
            <label for="telefone">Telefone</label>
            <input type="text" name="telefone" id="telefone" value="<%=clienteEditado.getTelefone()%>" required/>
        </div>
        <div class="col s12 m6 input-field">
            <label for="cpf">CPF</label>
            <input type="text" name="cpf" id="cpf" value="<%=clienteEditado.getCPF()%>" required/>
        </div>
        <div class="col s12 m6 input-field">
            <label for="rg">RG</label>
            <input type="text" name="rg" id="rg"  value="<%=clienteEditado.getRG()%>" required/>
        </div>
        <div class="col s12 m8 input-field">
            <label for="logradouro">Logradouro (Rua/Av.)</label>
            <input type="text" name="logradouro" id="logradouro" value="<%=clienteEditado.getEndereco().getLogradouro()%>" required/>
        </div>
        <div class="col s12 m4 input-field">
            <label for="numero">Número</label>
            <input type="number" name="numero" id="numero" value="<%=clienteEditado.getEndereco().getNumero()%>" required/>
        </div>
        <div class="col s12 m6 input-field">
            <label for="cidade">Cidade</label> 
            <input type="text" name="cidade" id="cidade" value="<%=clienteEditado.getEndereco().getCidade()%>" required/>
        </div>
        <div class="col s12 m6 input-field">
            <select name="estado" id="estado" required>
                <option selected="" value="">Selecione o Estado (UF)</option>
                <option value="Acre">Acre</option>
                <option value="Alagoas">Alagoas</option>
                <option value="Amapá">Amapá</option>
                <option value="Amazonas">Amazonas</option>
                <option value="Bahia">Bahia</option>
                <option value="Ceará">Ceará</option>
                <option value="Distrito Federal">Distrito Federal</option>
                <option value="Espírito Santo">Espírito Santo</option>
                <option value="Goiás">Goiás</option>
                <option value="Maranhão">Maranhão</option>
                <option value="Mato Grosso">Mato Grosso</option>
                <option value="Mato Grosso do Sul">Mato Grosso do Sul</option>
                <option value="Minas Gerais">Minas Gerais</option>
                <option value="Pará">Pará</option>
                <option value="Paraíba">Paraíba</option>
                <option value="Paraná">Paraná</option>
                <option value="Pernambuco">Pernambuco</option>
                <option value="Piauí">Piauí</option>
                <option value="Rio de Janeiro">Rio de Janeiro</option>
                <option value="Rio Grande do Sul">Rio Grande do Sul</option>
                <option value="Rio Grande do Norte">Rio Grande do Norte</option>
                <option value="Rondônia">Rondônia</option>
                <option value="Roraima">Roraima</option>
                <option value="Santa Catarina">Santa Catarina</option>
                <option value="São Paulo">São Paulo</option>
                <option value="Sergipe">Sergipe</option>
                <option value="Tocantins">Tocantins</option>
            </select>
            <label for="estado">Estado</label>
        </div>
        <div class="col s12 m12 center-align">
            <input class="btn btn-large waves-effect waves-light red" type="submit" name="excluir" value="Excluir"/>
            <input class="btn btn-large waves-effect waves-light" type="submit" name="salvar" value="Salvar"/>
        </div>
    </fieldset>
</form>
<script>
    $(document).ready(function(){
        $("select#estado").val("<%=clienteEditado.getEndereco().getEstado()%>");
        $('select#estado').material_select();
    });
</script>
<%@include file="WEB-INF/jspf/footer.jspf" %>