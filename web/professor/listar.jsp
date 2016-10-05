<%-- 
    Document   : listar
    Created on : 14/09/2016, 20:35:49
    Author     : Joel
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifsul.modelo.Professor"%>
<%@page import="br.edu.ifsul.dao.ProfessorDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="professorDAO" scope="session" type="ProfessorDAO"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de professor</title>
    </head>
    <body>
        <a href="../index.html">Inicio</a>
        <h2>Professores</h2>
        <h2><%=professorDAO.getMensagem()%></h2>
        <a href="ServletProfessor?acao=incluir">Incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>Titulação</th> 
                    <th>Tópicos de interesse</th>  
                    <th>Nome</th>  
                    <th>Email</th>  
                    <th>Nascimento</th>  
                    <th>Especialidade</th>  
                    <th>Alterar</th> 
                    <th>Excluir</th> 
                </tr>
            </thead>
            <tbody>
                <%
                    for (Professor p : professorDAO.getLista()) {
                %>
            <td><%=p.getTitulacao()%></td>
            <td><%=p.getTopicosInteresse()%></td>
            <td><%=p.getNome()%></td>
            <td><%=p.getEmail()%></td>
            <td><%=new SimpleDateFormat("dd/MM/yyyy").format(p.getNascimento().getTime())%></td>
             <td><%=p.getEspecialidade().getNome()%></td>
            <td><a href="ServletProfessor?acao=alterar&id=<%=p.getId()%>">Alterar</a></td>
            <td><a href="ServletProfessor?acao=excluir&id=<%=p.getId()%>">Excluir</a></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table> 

</body>
</html>
