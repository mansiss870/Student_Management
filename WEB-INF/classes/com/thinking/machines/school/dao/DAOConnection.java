package com.thinking.machines.school.dao;
import com.thinking.machines.school.dao.*;
import java.sql.*;
public class DAOConnection 
{
public DAOConnection()
{}
public static Connection getConnection() throws DAOException
{
Connection c=null;
try{
Class.forName("org.apache.derby.jdbc.ClientDriver");
c=DriverManager.getConnection("jdbc:derby://localhost:1527/schooldb");
return c;
}catch(Exception e)
{
throw new DAOException(e.getMessage());
}
}
}