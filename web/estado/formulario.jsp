<%-- 
    Document   : formulario
    Created on : 14/09/2016, 21:32:16
    Author     : Joel
--%>

<%@page import="br.edu.ifsul.dao.AlunoDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="alunoDao" scope="session" type="AlunoDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Alunos</title>
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
        <h2>Edição de alunos</h2>
        <h2><%=alunoDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletAluno" method="post">
            Código: <input type="text" name="id" id="id" value="<%= alunoDao.getObjetoSelecionado().getId()==null
                    ? "" : alunoDao.getObjetoSelecionado().getId()%>" size="6" readonly /><br/>
            Nome <input type="text" name="nome" id="nome" value="<%= alunoDao.getObjetoSelecionado().getNome()==null
                    ? "" : alunoDao.getObjetoSelecionado().getNome()%>" size="40" /><br/>
            Email <input type="text" name="uf" id="uf" value="<%= alunoDao.getObjetoSelecionado().getEmail()==null
                    ? "" : alunoDao.getObjetoSelecionado().getEmail()%>" size="2" /><br/>
            Nascimento <input type="text" name="uf" id="uf" value="<%= alunoDao.getObjetoSelecionado().getNascimento()==null
                    ? "" : alunoDao.getObjetoSelecionado().getNascimento()%>" size="2" /><br/>
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/><br/>
            <input type="hidden" value="" name="acao" id="acao"/><br/>
        </form>
    </body>
</html>
