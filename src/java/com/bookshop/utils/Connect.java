package com.bookshop.utils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
 
public class Connect{
 
	/**
         * URL de connection
         */
	private String url = "jdbc:sqlserver://localhost:1433;databaseName=BookShop";
	/**
         * Nom du user
         */
	private String user = "sa";
	/**
         * Mot de passe du user
         */
	private String passwd = "sa";
	/**
         * Objet Connection
         */
	private static Connection connect;
 
	/**
         * Constructeur privé
         */
	private Connect(){
		try {
                    try {
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
                    }
			connect = DriverManager.getConnection(url, user, passwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
 
	/**
         * Méthode qui va nous retourner notre instance
         * et la créer si elle n'existe pas...
         * @return
         */
	public static Connection getInstance(){
		if(connect == null){
			new Connect();
		}
		return connect;	
	}	
}
