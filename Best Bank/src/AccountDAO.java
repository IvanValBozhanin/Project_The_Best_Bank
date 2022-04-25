
/**
 * @author Ivan
 *
 */

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class AccountDAO {
	
	private Connection c;
	
	public AccountDAO() throws Exception {
		c = DriverManager.getConnection("jdbc:mysql://localhost:3306/best_bank", "root" , "");
	}
	
	public List<Account> getAccounts(int cid) throws Exception {
		List<Account> list = new ArrayList<>();
		
		Statement s = null;
		ResultSet r = null;
		
		try {
			s = c.createStatement();
			r = s.executeQuery("SELECT id, balance, dt FROM account a JOIN account_client ac ON a.id = ac.account_id WHERE ac.client_id = " + cid);
		
			while (r.next()) {
				Account account = convertToAccount(r);
				list.add(account);
			}
			
			return list;
			
		} finally {
			close(s, r);
		}
	}

	
	private Account convertToAccount(ResultSet r) throws SQLException{
		
		Account account = new Account(r.getInt("id"), r.getBigDecimal("balance"), r.getDate("dt"));
		return account;
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
		AccountDAO accountDAO = new AccountDAO();
		System.out.println(accountDAO.getAccounts(1));
	}
}
