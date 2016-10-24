<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.cad.Database"%>
<%@page import="br.com.fatecpg.cad.Fornecedor"%>
<%@page import="br.com.fatecpg.cad.Endereco"%>
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
        lista.set(id, fornecedorEditado);
        response.sendRedirect("Fornecedor.jsp");
    }

    if (request.getParameter("excluir") != null) {
        String par = request.getParameter("indice");
        int i = Integer.parseInt(par);
        lista.remove(i);
        response.sendRedirect("Fornecedor.jsp");
    }

%>
<%@include file="WEB-INF/jspf/head.jspf" %>
<form>
    <h2>Inclusão de Fornecedor</h2>
    <fieldset class="row">
        <legend>Dados do Fornecedor</legend>
        <input type="hidden" name="indice" value="<%=id%>"/>
        <div class="col s12 m12 input-field">
            <label for="nome">Nome Fantasia</label>
            <input type="text" name="nome" id="nome" value="<%=fornecedorEditado.getNome()%>"/>
        </div>
        <div class="col s12 m6 input-field">
            <label for="email">Email</label>
            <input type="text" name="email" id="email" value="<%=fornecedorEditado.getEmail()%>"/>
        </div>
        <div class="col s12 m6 input-field">
            <label for="telefone">Telefone</label>
            <input type="text" name="telefone" id="telefone" value="<%=fornecedorEditado.getTelefone()%>"/>
        </div>
        <div class="col s12 m6 input-field">
            <label for="razaosocial">Razão Social</label>
            <input type="text" name="razaosocial" id="razaosocial" value="<%=fornecedorEditado.getRazaoSocial()%>"/>
        </div>
        <div class="col s12 m6 input-field">
            <label for="cnpj">CNPJ</label>
            <input type="text" name="cnpj" id="cnpj" value="<%=fornecedorEditado.getCnpj()%>"/>
        </div>
        <div class="col s12 m8 input-field">
            <label for="logradouro">Logradouro (Rua/Av.)</label>
            <input type="text" name="logradouro" id="logradouro" value="<%=fornecedorEditado.getEndereco().getLogradouro()%>"/>
        </div>
        <div class="col s12 m4 input-field">
            <label for="numero">Número</label>
            <input type="text" name="numero" id="numero" value="<%=fornecedorEditado.getEndereco().getNumero()%>"/>
        </div>
        <div class="col s12 m6 input-field">
            <label for="cidade">Cidade</label> 
            <input type="text" name="cidade" id="cidade" value="<%=fornecedorEditado.getEndereco().getCidade()%>"/>
        </div>
        <div class="col s12 m6 input-field">
            <select name="estado" id="estado">
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
        $("select#estado").val("<%=fornecedorEditado.getEndereco().getEstado()%>");
        $('select#estado').material_select();
    });
</script>
<%@include file="WEB-INF/jspf/footer.jspf" %>
