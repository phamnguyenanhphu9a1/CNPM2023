package controller;

import java.io.IOException;
import java.util.Locale;

import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import database.DAOAccounts;

import model.Account;
import model.Encode;
import model.Role;
import model.VerifyRecaptcha;

@WebServlet("/anime-main/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String userName = request.getParameter("loginName");
		String password = request.getParameter("loginPassword");
		HttpSession session = request.getSession();
		Account account = null;
		String recaptcha = request.getParameter("g-recaptcha-response");
		boolean verify = VerifyRecaptcha.verify(recaptcha); // bước 2.1.5 kiểm tra tính hợp lệ của captcha
		String lang = (String) session.getAttribute("LANG");

		boolean isValidUsername;
		String error="";
		String encryptPassword;
		Encode encode = new Encode();
		Role role;
		ResourceBundle bundle = lang!=null?ResourceBundle.getBundle("app_vi_VN"):
				ResourceBundle.getBundle("app");

		String direct = "/anime-main/login.jsp";
		boolean isManagerment;
		if(verify){// đây là trường hợp nếu verify=true;
			isValidUsername= DAOAccounts.isValidUsername(userName); // bước 2.1.6 xác minh username có tồn tại trong hệ thống hay không
			if(isValidUsername) { //  nếu 2.1.6 isValidUsername=true
				encryptPassword = encode.toSHA1(password); // bước 2.1.7 hệ thống mã hóa mật khẩu người dùng nhập vào
				account = DAOAccounts.login(userName,encryptPassword); // bước 2.1.8 xác thực với cơ sở dữ liệu username và password mã hóa
				if(account!=null){// tài khoản khác null có nghĩa là cơ sở dữ liệu có tài khoản phù hợp, đây là tài khoản hợp lệ
					role = DAOAccounts.getRoleUser(account.getId());// bước 2.1.9 hệ thống tìm vai trò của tài khoản
					account.setRole(role);//bước 2.1.10 gán vai trò cho tài khoản
					session.setAttribute("account",account); //bước 2.1.11 setattribute account cho phiene làm việc
					isManagerment=account.isManagement();// bước 2.1.12 hệ thống kiểm tra tài khoản có phải admin không.
					if(isManagerment){ // nếu tài khoản là admin
						direct="/admin/Index.jsp";
						response.sendRedirect(getServletContext().getContextPath()+direct);// bước 2.1.13 chuyển đến trang quản lý
						return;
					}else{// đây là tài khoản thường
						direct="/anime-main/index.jsp";
						response.sendRedirect(getServletContext().getContextPath()+direct);// bước 2.2.4.1 chuyển đến trang home page
						return;
					}


				}else{ // mat khau khong hop le
					error=bundle.getString("login.errorPassword");//bước 2.2.3.1 hệ thống xác định lỗi do sai mật khẩu
					request.setAttribute("error",error);
				}
			}else{//không tồn tại username
				error= bundle.getString("login.errorUsername");//bước 2.2.2.1 hệ thống xác định lỗi do không tồn tại username
				request.setAttribute("error",error);

			}

		}else{//xác thực captcha thất bại hoặc không xác thực
			error=bundle.getString("login.errorCaptcha");//bước 2.2.1.1 hệ thống xác định lỗi do xác thực captcha thất bại và đính kèm lỗi
			request.setAttribute("error",error);
		}

		request.setAttribute("usName",userName);
		request.setAttribute("usPass",password);
		request.getRequestDispatcher(direct).forward(request,response);//bước 2.2.1.4, 2.2.2.4,2.2.3.4 chuyển hướng người dùng lại trang đăng nhập kèm theo lỗi.

	}

}
