<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.cognizant.user.bean.*" %>
    <%@ page import="com.cognizant.userDao.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
UserDao ud=new UserDao();
List<User> list=new ArrayList<User>();ArrayList<Integer> list2=new ArrayList<Integer>();ArrayList<Integer> list1=new ArrayList<Integer>();
list=ud.getUser();
for(User u:list)
{
	if(session.getAttribute("key1").equals(u.getUsername()))
	{
Enumeration<String> e=request.getParameterNames();
while(e.hasMoreElements())
{   
	String v=e.nextElement();
	if(v.equalsIgnoreCase("select")){
	String [] str=request.getParameterValues(v);
	
for(int i=0; i<str.length; i++)
{
list1.add(Integer.parseInt(str[i]));	
}
}
	if(v.equalsIgnoreCase("quantity")){
		String [] str=request.getParameterValues(v);
		
	for(int i=0; i<str.length; i++)
	{
	list2.add(Integer.parseInt(str[i]));	
	}
	}
}
u.setPid(list1);
u.setRequired(list2);
}
	}

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/INFINITY","root","root");
	for(int i=0;i<list1.size();i++)
	{PreparedStatement ps=con.prepareStatement("insert into "+ session.getAttribute("key1")+ "(prod_id,req) values("+list1.get(i)+","+list2.get(i)+")" );
     if(ps.executeUpdate()<0)
       System.out.println("ERROR");
	}
}

catch(Exception e)
{
	System.out.println(e);
}
%>
<table>
<%
try{
Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/INFINITY","root","root");
	for(int i=0;i<list1.size();i++)
	{PreparedStatement ps=con.prepareStatement("select product.name,product.prod_id,product.instock,"+session.getAttribute("key1") +".from   );
     if(ps.executeUpdate()<0)
       System.out.println("ERROR");
	}
}

catch(Exception e)
{
	System.out.println(e);
}
%>
</table>


</body>
</html>