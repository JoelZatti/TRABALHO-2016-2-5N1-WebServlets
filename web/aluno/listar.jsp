<%-- 
    Document   : listar
    Created on : 14/09/2016, 20:35:49
    Author     : Joel
--%>

<%@page import="br.edu.ifsul.modelo.Aluno"%>
<%@page import="br.edu.ifsul.dao.AlunoDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="alunoDao" scope="session" type="AlunoDAO"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de Alunos</title>
    </head>
    <body>
        <a href="../index.html">Inicio</a>
        <h2>Alunos</h2>
        <h2><%=alunoDao.getMensagem()%></h2>
        <a href="ServletAluno?acao=incluir">Incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th> 
                    <th>Nome</th> 
                    <th>Email</th> 
                    <th>Nascimento</th> 
                    <th>Alterar</th> 
                    <th>Excluir</th> 
                </tr>
            </thead>
            <tbody>
                <%
                    for (Aluno e : alunoDao.getLista()) {
                %>
            <td><%=e.getId()%></td>
            <td><%=e.getNome()%></td>
            <td><%=e.getEmail()%></td>
            <td><%=e.getNascimento()%></td>
            <td><a href="ServletAluno?acao=alterar&id=<%=e.getId()%>">Alterar</a></td>
            <td><a href="ServletAluno?acao=excluir&id=<%=e.getId()%>">Excluir</a></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table> 

</body>
</html>
