<%@page language="java" import="java.sql.*" %>
<%
String vnome = request.getParameter("txtNome");
int vidade = Integer.parseInt( request.getParameter("txtIdade") ); String vemail = request.getParameter("txtEmail");
String banco = "pilarcode";
String endereco = "jdbc:mysql://localhost:3306/" + banco; String usuario = "root";
String senha = "";
String driver = "com.mysql.jdbc.Driver"; //Carregar o driver na memoria
  Class.forName( driver );
  //cria a variavel para conectar com o banco de dados
Connection conexao;
//Abrir a conexao com o banco de dados
  conexao = DriverManager.getConnection(endereco,usuario,senha);
  //Cria a variavel sql como o comando de Inserir
String sql = "INSERT INTO clientes (nome,idade,email) values(?,?,?)";
PreparedStatement stm = conexao.prepareStatement(sql); stm.setString(1, vnome);
stm.setInt(2, vidade);
stm.setString(3, vemail);
  stm.execute();
  stm.close();
  out.print("Obrigado por responder nossa pesquisa! Seus dados foram
gravados com sucesso!");
  out.print("<br><br>");
  out.print("<a href='pesquisa.html'>Voltar</a>");
%>