<%-- 
    Document   : formulario
    Created on : 14/09/2016, 21:32:16
    Author     : Joel
--%>

<%@page import="br.edu.ifsul.dao.InstituicaoDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="instituicaoDAO" scope="session" type="InstituicaoDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Instituições</title>
        <script>
            function doSalvar() {
                document.getElementById("acao").value = "salvar";
                document.getElementById("form").submit();
            }
            function doCancelar() {
                document.getElementById("acao").value = "cancelar";
                document.getElementById("form").submit();
            }
        </script>
    </head>
    <body>
        <h2>Edição de Instituições</h2>
        <h2><%=instituicaoDAO.getMensagem()%></h2>
        <form name="form" id="form" action="ServletInstituicao" method="post">
            Código: <input type="text" name="id" id="id" value="<%= instituicaoDAO.getObjetoSelecionado().getId()==null
                    ? "" : instituicaoDAO.getObjetoSelecionado().getId()%>" size="6" readonly /><br/>
            Nome <input type="text" name="nome" id="nome" value="<%= instituicaoDAO.getObjetoSelecionado().getNome()==null
                    ? "" : instituicaoDAO.getObjetoSelecionado().getNome()%>" size="50" /><br/>
            Ano de Fundação <input type="text" name="ano_fundacao" id="ano_fundacao" value="<%= instituicaoDAO.getObjetoSelecionado().getAnoFundacao()==null
                    ? "" : new SimpleDateFormat("dd/MM/yyyy").format(instituicaoDAO.getObjetoSelecionado().getAnoFundacao().getTime())%>" size="6" /><br/>
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/><br/>
            <input type="hidden" value="" name="acao" id="acao"/><br/>
        </form>
    </body>
</html>
