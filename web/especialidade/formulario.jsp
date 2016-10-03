<%-- 
    Document   : formulario
    Created on : 14/09/2016, 21:32:16
    Author     : Joel
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifsul.dao.EspecialidadeDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="especialidadeDAO" scope="session" type="EspecialidadeDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Especialidade</title>
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
        <h2>Edição de especialidade</h2>
        <h2><%=especialidadeDAO.getMensagem()%></h2>
        <form name="form" id="form" action="ServletEspecialidade" method="post">
            Código: <input type="text" name="id" id="id" value="<%= especialidadeDAO.getObjetoSelecionado().getId()==null
                    ? "" : especialidadeDAO.getObjetoSelecionado().getId()%>" size="6" readonly /><br/>
            Nome <input type="text" name="nome" id="nome" value="<%= especialidadeDAO.getObjetoSelecionado().getNome() == null
                    ? "" : especialidadeDAO.getObjetoSelecionado().getNome()%>" size="40" /><br/>
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/><br/>
            <input type="hidden" value="" name="acao" id="acao"/><br/>
        </form>
    </body>
</html>
