<%@page import="DAO.UserDAO"%>
<%@page import="DTO.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1">
    <title>Verificar e Entrar</title>
  </head>
  <body>
    <%
      String email = request.getParameter("email");
      String senha = request.getParameter("senha_entrar");
      
      int id_User = 0;
      String nome_User = "";
      String email_User = "";
      String senha_User = "";
      
      boolean verifica = false;
      UserDAO listar = new UserDAO();
      ArrayList<UserDTO> lista = listar.ArrayListarUser();
      
      for (UserDTO user : lista) {
        if (user.getEmail().equals(email) && user.getSenha().equals(senha)) {
          verifica = true;
          
          nome_User = user.getNome();
          email_User = user.getEmail();
          senha_User = user.getSenha();
          id_User = user.getId_user();
        }
      }
      if (verifica) { 
       %>
    <form id="return_Form" action="../index/Logado/Tela_de_Logado.jsp" method="post">
      <input type="hidden" name="nome_User" id="nome_User" value="<%=nome_User%>" />
      <input type="hidden" name="email_User" id="email_User" value="<%=email_User%>" />
      <input type="hidden" name="senha_User" id="senha_User" value="<%=senha_User%>" />
      <input type="hidden" name="id_User" id="id_User" value="<%=id_User%>" />    
      <input type="submit" value="Enviar" />
    </form>
    <script>
      document.getElementById("return_Form").submit();
    </script>
    <%
      } else {
        response.sendRedirect("../index/index.html?conf=error");
      }
      %>
  </body>
</html>