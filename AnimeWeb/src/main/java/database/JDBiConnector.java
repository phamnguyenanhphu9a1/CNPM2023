package database;
import org.jdbi.v3.core.Jdbi;



public class JDBiConnector {
	static Jdbi jdbi;

	public static Jdbi me() {
		if (jdbi == null)
			makeConnect();
		return jdbi;
	}

	private static void makeConnect() {
		jdbi = Jdbi.create(DataSource.ds);

	}



	public static void main(String[] args) {

	}

}
