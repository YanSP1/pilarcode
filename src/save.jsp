<%@page language="java" import="java.sql.*" %>
<%
  String vnome = request.getParameter("textName");
  String vemail = request.getParameter("textEmail");
  String vsenha = request.getParameter("textPassword");

  String banco = "pilarcode";
  String endereco = "jbdc:mysql://localhost:3306/" + banco;
  String usuario = "root";
  String senha = "";

  String driver = "com.mysql.jdbc.Driver";

  //Carregar o driver na memoria
  Class.forName( driver );

  //cria a variavel para conectar com o banco de dados
  Connection conexao;
  //Abrir a conexao com o banco de dados
  conexao = DriverManager.getConnection(endereco,usuario,senha);

  //Cria a variavel sql como o comando de Inserir
  String sql = "INSERT INTO alunos (nome,email,senha) values(?,?,?)";

  PreparedStatement stm = conexao.prepareStatement(sql);
  stm.setString(1, vnome);
  stm.setString(2, vemail);
  stm.setInt(3, vsenha);

  stm.execute();
%>