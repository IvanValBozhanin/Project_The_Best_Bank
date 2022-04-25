public class Client {
	private int id;
	private String username;
	private String address;
	

	public Client(int id, String username, String address) {
		super();
		this.id = id;
		this.username = username;
		this.address = address;
	}

	@Override
	public String toString() {
		return String.format("Client [id=%s, username=%s, address=%s]",
				id, username, address);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}
