
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;


public static class Helper
{
	public const string FILE_NAME = "Database.mdf"; // data bsae name
	public const string USERS_TABLE_NAME = "userstable"; // the name of the users table in DB
	public const string ADMIN_TABLE_NAME = "admintable";
	/*
	 * creates a connection to a specific data base
	 * fileName - the name of the specific data base to connect to
	 * return - the created connection
	 */
	public static SqlConnection ConnectToDb(string fileName)
    {
		string path = HttpContext.Current.Server.MapPath("App_Data/") + fileName;

		// Data Source = the db mechanism that will be used
		// AttachDbFilename = the full path of the data base
		string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + path + ";Integrated Security=True;Connect Timeout=30";
        
		// creates the connection to the db
		SqlConnection conn = new SqlConnection(connString);
        return conn;
	}

	/*
	 * execute a specific sql query in a specific data base
	 * fileName - the name of the specific data base to connect to
	 * sql - the specific sql query to execute
	 * return - a DataTable containing the data returned by the data base
	 * 
	 */
	public static DataTable ExecuteDataTable(string fileName, string sql)
	{
		// creates the connection and opens it
		SqlConnection conn = ConnectToDb(fileName);
		conn.Open();

		// execute the query and fills the DataTable with the data returned from the db
		DataTable dt = new DataTable();

		SqlDataAdapter tableAdapter = new SqlDataAdapter(sql, conn);

		tableAdapter.Fill(dt);


		return dt;
	}



	/*
	 * execute a specific sql query in a specific data base and check if it return result
	 * fileName - the name of the specific data base to connect to
	 * sql - the specific sql query to execute
	 * return - true, if the sql query returns result
	 * false, otherwise
	 */
	public static bool IsExist(string fileName, string sql)
	{

		SqlConnection conn = ConnectToDb(fileName);
		conn.Open();
		SqlCommand com = new SqlCommand(sql, conn);
		SqlDataReader data = com.ExecuteReader();

		bool found = Convert.ToBoolean(data.Read());
		conn.Close();
		return found;

	}



	public static void DoQuery(string fileName, string sql)
	{
		SqlConnection conn = ConnectToDb(fileName);
		conn.Open();
		SqlCommand com = new SqlCommand(sql, conn);
		com.ExecuteNonQuery();
		conn.Close();
	}



}



