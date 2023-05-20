package database;

import java.io.FileNotFoundException;


import model.*;
import org.jdbi.v3.core.Jdbi;

public class DAOAccounts {
	public static Account login(String userName, String encryptPassword){


		Account account = null;
		String query = "SELECT id,userName,password,avatar,fullName FROM accounts where userName= :UserName and password = :Password";//tìm tài khoản phù hợp với username và password
		Jdbi me = JDBiConnector.me(); // lấy kết nối nếu có sẵn hoặc tạo kết nối mới JDBI
		account = me.withHandle(handle -> {
			return handle.createQuery(query).bind("UserName", userName).bind("Password", encryptPassword) //truyền các tham số vào câu query
					.mapToBean(Account.class).findFirst().orElse(null); // map dòng dữ liệu vừa tìm được thành lớp Account. findFirst() dùng để lấy đúng 1 dòng dầu tiên
			//orElse(null) nghĩa là trả về null nếu không có dữ liệu phù hợp

		});

		return account;
	}
	public static boolean isValidUsername(String userName){
		boolean result;
		String query = "SELECT EXISTS (SELECT 1 FROM accounts where userName= :UserName)"; // tìm username trong bảng accounts
		Jdbi me = JDBiConnector.me();
		result = me.withHandle(handle -> {
			return handle.createQuery(query).bind("UserName", userName) // truyền tham số vào câu truy vấn
					.mapTo(Integer.class).one(); //nếu đúng sẽ trả về 1, nếu sai trả về 0

		})==1;// kiểm tra xem có phải trả về 1 không, nếu trả về 1 có nghĩa là có tồn tại tên tài khoản

		return result;
	}

	public static Role getRoleUser(int idUser) {
		String query = "select distinct a.idRole,description from account_roles a join roles r on a.idRole = r.id where a.idAccount=:idAccount";//tìm role của tài khoản
		Jdbi me = JDBiConnector.me();
		Role result;
		result = me.withHandle(handle -> {
			return handle.createQuery(query)
					.bind("idAccount", idUser).mapToBean(Role.class).one();// truyền tham số vào câu truy vấn và chuyển trường dữ liệu nhận được thành lớp Role
		});
		return result;
	}




	public static void main(String[] args) {

	}


	

	
}
