<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DAO.UserDAO"%>
<%@page import="DTO.UserDTO"%>

<%@page import="DAO.AnimalClienteDAO"%>
<%@page import="DTO.Animal_UserDTO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Deletar Usuário e Animais</title>
  </head>
  <body>
    <%
      int idDesejado = Integer.parseInt(request.getParameter("huser"));

      // Deleta todos os animais associados ao usuário
      AnimalClienteDAO animalClienteDAO = new AnimalClienteDAO();
      ArrayList<Animal_UserDTO> animaisDoUsuario = animalClienteDAO.ListarAnimaisClientes();
      for (Animal_UserDTO animal : animaisDoUsuario) {
        if (animal.getCliente().getId_user() == idDesejado) {
          animalClienteDAO.DeletarAnimalCliente(animal.getId_animal());
        }
      }

      // Deleta o usuário
      UserDAO userdao = new UserDAO();
      boolean sucessoUsuario = userdao.DeletUser(idDesejado);

      if (sucessoUsuario) {
        response.sendRedirect("../index/index.html?conf=deleta");
      } else {
        response.sendRedirect("../index/index.html?conf=erro_deleta");
      }
    %>
  </body>
</html>
