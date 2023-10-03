package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.Animal_UserDTO;
import DTO.UserDTO;
import Util.Conexao;

public class AnimalClienteDAO {

    public boolean InserirAnimalCliente(Animal_UserDTO animalCliente) {
        Conexao con = null;
        try {
            con = new Conexao();
            con.executeUpdate("INSERT INTO animalcliente(nome_animal, especie, raca, data_nascimento, id_cliente) VALUES ('"
                    + animalCliente.getNome_animal() + "','"
                    + animalCliente.getEspecie() + "','"
                    + animalCliente.getRaca() + "','"
                    + animalCliente.getData_nascimento() + "','"
                    + animalCliente.getCliente().getId_user() + "');");
            return true;
        } catch (SQLException e) {
            System.out.println("Erro ao inserir animal cliente: " + e);
            return false;
        }
    }

    public ArrayList<Animal_UserDTO> ListarAnimaisClientes() {
        Conexao con = null;
        try {
            con = new Conexao();
            ResultSet resultado = con.executeQuery("SELECT a.*, u.nome AS nome_cliente FROM animalcliente a INNER JOIN usuarios u ON a.id_cliente = u.id_user;");
            ArrayList<Animal_UserDTO> listaAnimaisClientes = new ArrayList<Animal_UserDTO>();
            
            while (resultado.next()) {
                Animal_UserDTO animalCliente = new Animal_UserDTO();
                animalCliente.setId_animal(resultado.getInt("id_animal"));
                animalCliente.setNome_animal(resultado.getString("nome_animal"));
                animalCliente.setEspecie(resultado.getString("especie"));
                animalCliente.setRaca(resultado.getString("raca"));
                animalCliente.setData_nascimento(resultado.getString("data_nascimento"));
                
                UserDTO cliente = new UserDTO();
                cliente.setId_user(resultado.getInt("id_cliente"));
                cliente.setNome(resultado.getString("nome_cliente"));
                animalCliente.setCliente(cliente);
                
                listaAnimaisClientes.add(animalCliente);
            }
            
            return listaAnimaisClientes;
        } catch (SQLException e) {
            System.out.println("Erro na função listar animais clientes DAO: " + e);
            return null;
        }
    }

    public Animal_UserDTO ProcurarAnimalCliente(int id_animal) {
        Conexao con = null;
        try {
            con = new Conexao();
            ResultSet resultado = con.executeQuery("SELECT a.*, u.nome AS nome_cliente FROM animalcliente a INNER JOIN usuarios u ON a.id_cliente = u.id_user WHERE a.id_animal=" + id_animal + ";");
            
            if (resultado.next()) {
                Animal_UserDTO animalCliente = new Animal_UserDTO();
                animalCliente.setId_animal(resultado.getInt("id_animal"));
                animalCliente.setNome_animal(resultado.getString("nome_animal"));
                animalCliente.setEspecie(resultado.getString("especie"));
                animalCliente.setRaca(resultado.getString("raca"));
                animalCliente.setData_nascimento(resultado.getString("data_nascimento"));
                
                UserDTO cliente = new UserDTO();
                cliente.setId_user(resultado.getInt("id_cliente"));
                cliente.setNome(resultado.getString("nome_cliente"));
                animalCliente.setCliente(cliente);
                
                return animalCliente;
            }
            
            return null;
        } catch (SQLException e) {
            System.out.println("Erro na função procurar animal cliente DAO: " + e);
            return null;
        }
    }

    public boolean AtualizarAnimalCliente(Animal_UserDTO animalCliente) {
        Conexao con = null;
        try {
            con = new Conexao();
            con.executeUpdate("UPDATE animalcliente SET "
                    + "nome_animal='" + animalCliente.getNome_animal() + "', "
                    + "especie='" + animalCliente.getEspecie() + "', "
                    + "raca='" + animalCliente.getRaca() + "', "
                    + "data_nascimento='" + animalCliente.getData_nascimento() + "', "
                    + "id_cliente=" + animalCliente.getCliente().getId_user() + " " 
                    + "WHERE id_animal=" + animalCliente.getId_animal());
            return true;
        } catch (SQLException e) {
            System.out.println("Erro na função atualizar animal cliente DAO: " + e);
            return false;
        }
    }

    public boolean DeletarAnimalCliente(int id_animal) {
        Conexao con = null;
        try {
            con = new Conexao();
            con.executeUpdate("DELETE FROM animalcliente WHERE id_animal=" + id_animal);
            return true;
        } catch (SQLException e) {
            System.out.println("Erro na função deletar animal cliente DAO: " + e);
            return false;
        }
    }
}
