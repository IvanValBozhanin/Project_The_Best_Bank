import java.util.List;

import javax.swing.table.AbstractTableModel;

class AccountTableModel extends AbstractTableModel {

	private static final int ID_COL = 0;
	private static final int BALANCE_COL = 1;
	private static final int DATE_COL = 2;

	private String[] columnNames = { "ID", "Balance", "Date"};
	private List<Account> accounts;
	

	public AccountTableModel(List<Account> accounts) {
		this.accounts = accounts;
	}

	@Override
	public int getColumnCount() {
		return columnNames.length;
	}

	@Override
	public int getRowCount() {
		return accounts.size();
	}

	@Override
	public String getColumnName(int col) {
		return columnNames[col];
	}

	@Override
	public Object getValueAt(int row, int col) {

		Account tempAccount = accounts.get(row);

		switch (col) {
		case ID_COL:
			return tempAccount.getId();
		case BALANCE_COL:
			return tempAccount.getBalance();
		case DATE_COL:
			return tempAccount.getDt();
		default:
			return tempAccount.getId();
		}
	}

	@Override
	public Class getColumnClass(int c) {
		return getValueAt(0, c).getClass();
	}
}
