package com.thinking.machines.school.servlets;
import com.thinking.machines.school.dao.*;
import com.thinking.machines.school.beans.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
public class AddStudent extends HttpServlet
{
public void doPost(HttpServletRequest rq,HttpServletResponse rs)
{
try{
StudentBean sb=(StudentBean)rq.getAttribute("studentBean");
int rollNumber=sb.getRollNumber();
String name=sb.getName();
String address=sb.getAddress();
String gender=sb.getGender();
boolean indian=sb.getIndian();
int cityCode=sb.getCityCode();
java.sql.Date dateOfBirth=java.sql.Date.valueOf(sb.getDateOfBirth());
System.out.println(rollNumber+","+name+","+address+","+gender+","+indian+","+cityCode+","+dateOfBirth);
Connection c=DAOConnection.getConnection();
Statement s=c.createStatement();
s.executeUpdate("insert into student values("+rollNumber+",'"+name+"','"+address+"',"+cityCode+",'"+gender+"',"+indian+",'"+dateOfBirth+"')");
MessageBean mb=new MessageBean();
mb.setMessage("Student added with rollNumber: "+rollNumber);
rq.setAttribute("messageBean",mb);
rq.setAttribute("scenario","added");
RequestDispatcher rd=rq.getRequestDispatcher("/student.jsp");
rd.forward(rq,rs);
s.close();
c.close();
}catch(Exception e)
{
e.printStackTrace();
}
}
}