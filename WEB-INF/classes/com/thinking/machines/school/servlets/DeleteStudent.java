package com.thinking.machines.school.servlets;
import com.thinking.machines.school.dao.*;
import com.thinking.machines.school.beans.*;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
public class DeleteStudent extends HttpServlet
{
public void doPost(HttpServletRequest rq,HttpServletResponse rs)
{
try{
StudentBean sb=(StudentBean)rq.getAttribute("studentBean");
int rollNumber=sb.getRollNumber();
Connection c=DAOConnection.getConnection();
Statement ss=c.createStatement();
ss.executeUpdate("delete from student where roll_number="+rollNumber);
MessageBean messageBean;
messageBean=new MessageBean();
messageBean.setMessage(sb.getName());
rq.setAttribute("messageBean",messageBean);
rq.setAttribute("scenario","deleted");
RequestDispatcher rd;
rd=rq.getRequestDispatcher("/student.jsp");
rd.forward(rq,rs);
ss.close();
c.close();
}catch(Exception e)
{
e.printStackTrace();
}
}
}