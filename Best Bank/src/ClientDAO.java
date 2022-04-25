
/**
 * @author Ivan
 *
 */

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ClientDAO {
	
	private Connection c;
	
	public ClientDAO() throws Exception {
		c = DriverManager.getConnection("jdbc:mysql://localhost:3306/best_bank", "root" , "");
	}
	
	public List<Client> getClients() throws Exception {
		List<Client> list = new ArrayList<>();
		
		Statement s = null;
		ResultSet r = null;
		
		try {
			s = c.createStatement();
			r = s.executeQuery("SELECT id, username, address FROM client c JOIN client_employee ce ON c.id = ce.client_id WHERE ce.employee_id = " + EmployeePage.idEmp);
		
			while (r.next()) {
				Client client = convertToClient(r);
				list.add(client);
			}
			
			return list;
			
		} finally {
			close(s, r);
		}
	}

	
	private Client convertToClient(ResultSet r) throws SQLException{
		
		Client Client = new Client(r.getInt("id"), r.getString("username"), r.getString("address"));
		return Client;
	}
	
	private void close(Statement myStmt, ResultSet myRs) throws SQLException {
		close(null, myStmt, myRs);		
	}
	
	private static void close(Connection myConn, Statement myStmt, ResultSet myRs)
			throws SQLException {

		if (myRs != null) {
			myRs.close();
		}
		
		if (myConn != null) {
			myConn.close();
		}
	}
	
	public static void main(String [] args) throws Exception {
		ClientDAO ClientDAO = new ClientDAO();
		System.out.println(ClientDAO.getClients());
	}
}

