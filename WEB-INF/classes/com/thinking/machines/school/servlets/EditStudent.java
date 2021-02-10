package com.thinking.machines.school.servlets;
import com.thinking.machines.school.beans.*;
import com.thinking.machines.school.dao.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class EditStudent extends HttpServlet
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
s.executeUpdate("update student set name='"+name+"',address='"+address+"',city_code="+cityCode+",gender='"+gender+"',indian="+indian+",date_of_birth='"+dateOfBirth+"' where roll_number="+rollNumber);
s.close();
c.close();
MessageBean mb=new MessageBean();
mb.setMessage("Student edited with rollNumber: "+rollNumber);
rq.setAttribute("messageBean",mb);
rq.setAttribute("scenario","edited");
RequestDispatcher rd=rq.getRequestDispatcher("/student.jsp");
rd.forward(rq,rs);
}catch(Exception e)
{
e.printStackTrace();
}
}

}