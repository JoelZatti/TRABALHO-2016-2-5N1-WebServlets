<%-- 
    Document   : listar
    Created on : 14/09/2016, 20:35:49
    Author     : Joel
--%>

<%@page import="br.edu.ifsul.modelo.Instituicao"%>
<%@page import="br.edu.ifsul.dao.InstituicaoDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="instituicaoDAO" scope="session" type="InstituicaoDAO"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de Instituição</title>
    </head>
    <body>
        <a href="../index.html">Inicio</a>
        <h2>Instituições</h2>
        <h2><%=instituicaoDAO.getMensagem()%></h2>
        <a href="ServletInstituicao?acao=incluir">Incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th> 
                    <th>Nome</th> 
                    <th>Ano Fundação</th> 
                    <th>Alterar</th> 
                    <th>Excluir</th> 
                </tr>
            </thead>
            <tbody>
                <%
                    for (Instituicao i : instituicaoDAO.getLista()) {
                %>
            <td><%=i.getId()%></td>
            <td><%=i.getNome()%></td>
            <td><%=new SimpleDateFormat("dd/MM/yyyy").format(i.getAnoFundacao().getTime())%></td>
            <td><a href="ServletInstituicao?acao=alterar&id=<%=i.getId()%>">Alterar</a></td>
            <td><a href="ServletInstituicao?acao=excluir&id=<%=i.getId()%>">Excluir</a></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table> 

</body>
</html>
