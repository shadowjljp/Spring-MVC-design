package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.json.simple.JSONValue;

/**
 * Servlet implementation class JerryForJQuery
 */
@WebServlet("/JerryForJQuery")
public class JerryForJQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Context ctx = null;
		DataSource dataSource  = null;	
		
		String query = "select id,prodid,price from spider";
		try {
			ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/ReadShareDB");
			 System.out.println("datasource established");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try{
			conn = dataSource.getConnection();
			 System.out.println("Connection is successful");
			stmt = conn.prepareStatement(query);
			 System.out.println(query);
			 rs = stmt.executeQuery();
			
			 LinkedList<HashMap<String,String>> l1 = new LinkedList<HashMap<String,String>>();
			 System.out.println("Ready to receive data.");
			 while (rs.next()) {
				 HashMap<String,String>  m1 = new HashMap<String,String>();       
				 m1.put("id",rs.getString(1));   
				 m1.put("prodid", rs.getString(2)); 
				 m1.put("price",rs.getString(3)); 
				 l1.add(m1);
				
			 }
//			 Map m2 = new HashMap();
			 HashMap<String,LinkedList<HashMap<String,String>>> m2 = new HashMap<String,LinkedList<HashMap<String,String>>>();
			 m2.put("data", l1);
			// String jsonString = JSONValue.toJSONString(l1);   
			 String jsonString = JSONValue.toJSONString(m2);  
			 out.println(jsonString);
//			 System.out.println("here i am 3");
		}catch (SQLException e) {
			e.printStackTrace();
			out.println("Error:" + e.getMessage());
		} finally {
			try {
				if (rs != null)
	                rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException se2) {
			}
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
