<%-- 
    Document   : formulario
    Created on : 14/09/2016, 21:32:16
    Author     : Joel
--%>

<%@page import="br.edu.ifsul.dao.EspecialidadeDAO"%>
<%@page import="br.edu.ifsul.modelo.Especialidade"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifsul.dao.ProfessorDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="professorDAO" scope="session" type="ProfessorDAO"/>
<jsp:useBean id="especialidadeDAO" scope="session" type="EspecialidadeDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Professor</title>
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
        <h2>Edição de professor</h2>
        <h2><%=professorDAO.getMensagem()%></h2>
        <form name="form" id="form" action="ServletProfessor" method="post">
            Titulação <input type="text" name="titulacao" id="titulacao" value="<%= professorDAO.getObjetoSelecionado().getTitulacao()==null
                    ? "" : professorDAO.getObjetoSelecionado().getTitulacao()%>" size="40" /><br/>
            Tópicos de interesse <input type="text" name="topicos_interesse" id="topicos_interesse" value="<%= professorDAO.getObjetoSelecionado().getTopicosInteresse()==null
                    ? "" : professorDAO.getObjetoSelecionado().getTopicosInteresse()%>" size="40" /><br/>
            Nome <input type="text" name="nome" id="nome" value="<%= professorDAO.getObjetoSelecionado().getNome()==null
                    ? "" : professorDAO.getObjetoSelecionado().getNome()%>" size="40" /><br/>
            Email <input type="text" name="email" id="email" value="<%= professorDAO.getObjetoSelecionado().getEmail()==null
                    ? "" : professorDAO.getObjetoSelecionado().getEmail()%>" size="20" /><br/>
            Nascimento <input type="text" name="nascimento" id="nascimento" value="<%= professorDAO.getObjetoSelecionado().getNascimento()==null
                    ? "" : new SimpleDateFormat("dd/MM/yyyy").format(professorDAO.getObjetoSelecionado().getNascimento().getTime())%>" size="6" /><br/>
                        <br/>Especialidade: 
            <select name="idEspecialidade" id="idEspecialidade">
                <%
                  for (Especialidade e : especialidadeDAO.getLista())  {
                      String selected = "";
                      if (professorDAO.getObjetoSelecionado().getEspecialidade()!= null){
                        if(professorDAO.getObjetoSelecionado().getEspecialidade().getId().equals(e.getId())){
                            selected = "selected";
                        }                  
                      }
                %>    
                    <option value="<%=e.getId()%>" <%=selected%> > <%=e.getNome()%> </option>
                <%
                  }  
                %>                        
            </select>
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/><br/>
            <input type="hidden" value="" name="acao" id="acao"/><br/>
        </form>
    </body>
</html>
