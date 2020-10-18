package com.bookshop.dao;

import com.bookshop.beans.Address;
import com.bookshop.beans.Customer;
import com.bookshop.utils.Connect;
import com.bookshop.utils.HashProcess;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CustomerDAO {

    HashProcess hashprocess = new HashProcess();
    Connection connect = Connect.getInstance();
    Long addressId = null;
    Long customerId = null;
    Long statusType = null;

    private static final String SELECT_ALL = "SELECT * from Customer;";
    private static final String SELECT_ALL_COUNTRY = "SELECT AddressCountry from Address ORDER BY AddressCountry ASC;";
    private static final String SELECT_BY_MAIL = "SELECT * from Customer where CustomerMail = ? and CustomerPassword = ? ;";

    public List<Customer> getAll() throws SQLException {

        List<Customer> customers = new ArrayList();
        Statement stmt = connect.createStatement();
        ResultSet rs = stmt.executeQuery(SELECT_ALL);

        try {
            while (rs.next()) {
                Customer custo = new Customer(
                        rs.getLong("CustomerId"),
                        rs.getString("CustomerMail"),
                        rs.getString("CustomerPassword"));
                customers.add(custo);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return customers;
        }
    }

    public Customer getByMail(String mail, String password) throws SQLException {
        Customer customer = null;
        PreparedStatement stmt = connect.prepareStatement(SELECT_BY_MAIL);
        stmt.setString(1, mail);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();

        try {
            while (rs.next()) {
                customer = new Customer(
                        rs.getLong("CustomerId"),
                        rs.getString("CustomerMail"),
                        rs.getString("CustomerPassword"),
                        rs.getDate("CustomerBirthdate"),
                        rs.getDate("CustomerDateSignin"),
                        rs.getString("CustomerSalt"),
                        rs.getString("CustomerPassEncrypt")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return customer;
        }
    }

    public Customer geAlltCustomerByMail(String mail) throws SQLException {
        String query = "select * from Customer custo\n"
                + "left join HasInvoiceAdr inv on (inv.CustomerId = custo.CustomerId)\n"
                + "left join HasDelivAdr del on (inv.CustomerId = del.AddressId and inv.AddressId = del.CustomerId)\n"
                + "left join Address addr on (addr.AddressId = inv.AddressId)\n"
                + "left join SocialTitle soc on (soc.SocialTitleId = custo.SocialTitleId)\n"
                + "left join SetCustomer setc on (setc.CustomerId = custo.CustomerId)\n"
                + "left join StatusType stat on (stat.StatusTypeId = setc.StatusTypeId) "
                + "where CustomerMail = ? ;";
        PreparedStatement stmt = connect.prepareStatement(query);
        stmt.setString(1, mail);
        ResultSet rs = stmt.executeQuery();

        Customer customer = null;
        while (rs.next()) {
            customer = new Customer(
                    rs.getLong("CustomerId"),
                    rs.getLong("SocialTitleId"),
                    rs.getString("AddressLastname"),
                    rs.getString("AddressFirstname"),
                    rs.getString("CustomerMail"),
                    rs.getString("AddressPhone"),
                    rs.getDate("CustomerBirthdate"),
                    rs.getString("CustomerPassword"),
                    rs.getDate("CustomerDateSignin"),
                    rs.getString("SocialTitleLabel"),
                    rs.getString("AddressLabel"),
                    rs.getString("AddressCompany"),
                    rs.getString("AddressStreet"),
                    rs.getString("AddressStreet2"),
                    rs.getString("AddressZip"),
                    rs.getString("AddressCity"),
                    rs.getString("AddressCountry")
            );

        }
        return customer;
    }

    public List<String> getAllCountry() throws SQLException {
        List<String> listCountry = new ArrayList<>();
        Statement stmt = connect.createStatement();
        ResultSet rs = stmt.executeQuery(SELECT_ALL_COUNTRY);

        String lastCountry = null;

        try {
            while (rs.next()) {
                if (lastCountry == null) {
                    listCountry.add(rs.getString("AddressCountry"));
                    lastCountry = rs.getString("AddressCountry");
                }
                if (!lastCountry.equals(rs.getString("AddressCountry"))) {
                    listCountry.add(rs.getString("AddressCountry"));
                    lastCountry = rs.getString("AddressCountry");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return listCountry;
        }

    }

    public void createNewCustomer(String mail, String password) throws SQLException, NoSuchAlgorithmException, UnsupportedEncodingException, InvalidKeySpecException {
        int exist = 0;
        try {
            String query = "SELECT * FROM Customer;";
            Statement stmt = connect.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                if (mail.equals(rs.getString("CustomerMail"))) {
                    exist++;
                }
            }

            if (exist == 0) {
                String generatedSecuredPasswordHash = hashprocess.generateStrongPasswordHash(password);

                query = "INSERT INTO Customer (SocialTitleId, CustomerMail, CustomerPassword, CustomerBirthdate, CustomerDateSignin, CustomerSalt, CustomerPassEncrypt) VALUES (?, ?, ?, ?, ?, ?, ?);";
                PreparedStatement pstmt = connect.prepareStatement(query);

                pstmt.setLong(1, 2);
                pstmt.setString(2, mail);
                pstmt.setString(3, password);
                pstmt.setDate(4, null);
                pstmt.setDate(5, getCurrentDate());
                pstmt.setString(6, Base64.getEncoder().encodeToString(hashprocess.getSalt()));
                pstmt.setString(7, generatedSecuredPasswordHash);

                pstmt.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Creation of the customer's address
        try {
            String query = "INSERT INTO Address (AddressLabel, "
                    + "AddressCompany, "
                    + "AddressLastname, "
                    + "AddressFirstname, "
                    + "AddressStreet, "
                    + "AddressStreet2, "
                    + "AddressZip, "
                    + "AddressCity, "
                    + "AddressCountry, "
                    + "AddressPhone) "
                    + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement stmt = connect.prepareStatement(query);

            stmt.setString(1, null);
            stmt.setString(2, null);
            stmt.setString(3, "unknown");
            stmt.setString(4, "unknown");
            stmt.setString(5, "unknown");
            stmt.setString(6, "unknown");
            stmt.setString(7, "00000");
            stmt.setString(8, "unknown");
            stmt.setString(9, "unknown");
            stmt.setString(10, "0000000000");

            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Find AddressID
        try {
            String query = "SELECT top 1 AddressId FROM Address order by AddressId DESC;";
            Statement stmt = connect.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            rs.next();
            addressId = rs.getLong("AddressId");
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Find CustomerID
        try {
            String query = "SELECT CustomerId FROM Customer WHERE CustomerMail = '" + mail + "';";
            Statement stmt = connect.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            rs.next();
            customerId = rs.getLong("CustomerId");
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        }

        // assocation between Address and Customer
        try {
            String query = "INSERT INTO HasInvoiceAdr (CustomerId, AddressId) values (?, ?);";
            PreparedStatement stmt = connect.prepareStatement(query);

            stmt.setLong(1, customerId);
            stmt.setLong(2, addressId);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Association between status and Customer
        try {
            String query = "INSERT INTO SetCustomer VALUES (?, ?);";
            PreparedStatement stmt = connect.prepareStatement(query);

            stmt.setLong(1, 4);
            stmt.setLong(2, customerId);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public Long getIdbyMail(String mail) {
        Long id = null;
        try {
            String query = "SELECT CustomerId\n"
                    + "FROM CUSTOMER\n"
                    + "WHERE CustomerMail = ?;";
            PreparedStatement pstmt = connect.prepareStatement(query);
            pstmt.setString(1, mail);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                id = rs.getLong("CustomerId");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public void updateAccountInformations(Long idSocial, Date birthdate, String mail, String lastname, String firstname, String phone) throws SQLException {
        // Find AddressID
        try {
            String query = "SELECT Address.AddressId\n"
                    + "FROM dbo.HasInvoiceAdr\n"
                    + "INNER JOIN dbo.Address\n"
                    + "  ON HasInvoiceAdr.AddressId = Address.AddressId\n"
                    + "INNER JOIN dbo.Customer\n"
                    + "  ON HasInvoiceAdr.CustomerId = Customer.CustomerId\n"
                    + "WHERE Customer.CustomerMail = '" + mail + "';";
            Statement stmt = connect.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            rs.next();
            addressId = rs.getLong("AddressId");
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Update of the customer's attribute
        try {
            String query = "UPDATE Customer SET SocialTitleId = ?, CustomerBirthdate = ? WHERE CustomerMail = ?;";
            PreparedStatement stmt = connect.prepareStatement(query);

            stmt.setLong(1, idSocial);
            stmt.setObject(2, birthdate);
            stmt.setString(3, mail);

            stmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Update of the customer's address
        try {
            String query = "UPDATE Address SET AddressLastname = ?, "
                    + "AddressFirstname = ?, "
                    + "AddressPhone = ? "
                    + "WHERE AddressId = ?;";
            PreparedStatement stmt = connect.prepareStatement(query);

            stmt.setString(1, lastname);
            stmt.setString(2, firstname);
            stmt.setString(3, phone);
            stmt.setLong(4, addressId);

            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void updateAddressBook(String mail, String label, String company, String lastname, String firstname, String street, String street2, String zip, String city, String country) throws SQLException {
        // Find AddressID
        try {
            String query = "SELECT Address.AddressId\n"
                    + "FROM dbo.HasInvoiceAdr\n"
                    + "INNER JOIN dbo.Address\n"
                    + "  ON HasInvoiceAdr.AddressId = Address.AddressId\n"
                    + "INNER JOIN dbo.Customer\n"
                    + "  ON HasInvoiceAdr.CustomerId = Customer.CustomerId\n"
                    + "WHERE Customer.CustomerMail = '" + mail + "';";
            Statement stmt = connect.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            rs.next();
            addressId = rs.getLong("AddressId");
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Update of the customer's address
        try {
            String query = "UPDATE Address SET AddressLabel = ?, "
                    + "AddressCompany = ?, "
                    + "AddressLastname = ?, "
                    + "AddressFirstname = ?, "
                    + "AddressStreet = ?, "
                    + "AddressStreet2 = ?, "
                    + "AddressZip = ?, "
                    + "AddressCity = ?, "
                    + "AddressCountry = ?, "
                    + "WHERE AddressId = ?;";
            PreparedStatement stmt = connect.prepareStatement(query);

            stmt.setString(1, label);
            stmt.setString(2, company);
            stmt.setString(3, lastname);
            stmt.setString(4, firstname);
            stmt.setString(5, street);
            stmt.setString(6, street2);
            stmt.setString(7, zip);
            stmt.setString(8, city);
            stmt.setString(9, country);
            stmt.setLong(10, addressId);

            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private static java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }

    public String getSalt(String mail) throws SQLException {
        String query = "SELECT * from Customer where CustomerMail = ?;";
        PreparedStatement stmt = connect.prepareStatement(query);
        stmt.setString(1, mail);
        ResultSet rs = stmt.executeQuery();
        String salt = null;

        try {
            while (rs.next()) {
                salt = rs.getString("CustomerSalt");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return salt;
        }
    }

    public String getPassword(String mail) throws SQLException {
        String query = "SELECT * from Customer where CustomerMail = ?;";
        PreparedStatement stmt = connect.prepareStatement(query);
        stmt.setString(1, mail);
        ResultSet rs = stmt.executeQuery();

        String pass = null;
        try {
            while (rs.next()) {
                pass = rs.getString("CustomerPassEncrypt");
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return pass;
        }
    }

    public boolean getMail(String mail) throws SQLException {
        boolean exist = false;
        String query = "SELECT * from Customer where CustomerMail = ?;";
        PreparedStatement stmt = connect.prepareStatement(query);
        stmt.setString(1, mail);
        ResultSet rs = stmt.executeQuery();

        try {
            while (rs.next()) {
                exist = true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return exist;
        }

    }

    ///////// ADDRESSES /////////
    public List<Address> getDeliveryAddress(Long customerId) throws SQLException {
        List delAddresses = new ArrayList();
        String query = "select * from address addr\n"
                + "left join HasDelivAdr del on (del.AddressId = addr.AddressId)\n"
                + "left join customer custo on (custo.CustomerId = del.CustomerId)\n"
                + "where custo.CustomerId = " + customerId + " ;";

        Statement stmt = connect.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        try {
            while (rs.next()) {
                Address a = new Address(rs.getLong("AddressId"),
                        rs.getString("AddressLabel"),
                        rs.getString("AddressCompany"),
                        rs.getString("AddressFirstname"),
                        rs.getString("AddressLastname"),
                        rs.getString("AddressStreet"),
                        rs.getString("AddressStreet2"),
                        rs.getString("AddressZip"),
                        rs.getString("AddressCity"),
                        rs.getString("AddressCountry"),
                        rs.getString("AddressPhone"));
                delAddresses.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return delAddresses;
        }

    }

    public List<Address> getInvoiceAddress(Long customerId) throws SQLException {
        List invAddresses = new ArrayList();
        String query = "select * from address addr\n"
                + "left join HasInvoiceAdr inv on (inv.AddressId = addr.AddressId)\n"
                + "left join customer custo on (custo.CustomerId = inv.CustomerId)\n"
                + "where custo.CustomerId = " + customerId + " ;";

        Statement stmt = connect.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        try {
            while (rs.next()) {
                Address a = new Address(rs.getLong("AddressId"),
                        rs.getString("AddressLabel"),
                        rs.getString("AddressCompany"),
                        rs.getString("AddressFirstname"),
                        rs.getString("AddressLastname"),
                        rs.getString("AddressStreet"),
                        rs.getString("AddressStreet2"),
                        rs.getString("AddressZip"),
                        rs.getString("AddressCity"),
                        rs.getString("AddressCountry"),
                        rs.getString("AddressPhone"));
                invAddresses.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return invAddresses;
        }

    }

    public List<Customer> getAllOrders(Long customerId) throws SQLException {
        List<Customer> listOrder = new ArrayList<>();
        String query = "select ord.OrderdataNum,\n"
                + "ord.OrderdataInvoice,\n"
                + "ord.OrderdataDate,\n"
                + "ord.OrderdataTotalAmount,\n"
                + "ord.OrderdataCustomerIp,\n"
                + "b.BookTitle,\n"
                + "cmd.CmdLineQty,\n"
                + "b.BookPrice,\n"
                + "CONCAT (a.AddressStreet, ' ', a.AddressZip, ' ', a.AddressCity, ' ', a.AddressCountry)\n"
                + "from OrderData ord\n"
                + "left join CommandLine cmd on (cmd.OrderdataNum = ord.OrderdataNum)\n"
                + "left join Book b on (b.BookIsbn = cmd.BookIsbn)\n"
                + "left join Address a on (a.AddressId = ord.AddAddressid)\n"
                + "where ord.CustomerId = " + customerId + " \n"
                + "order by ord.OrderdataDate DESC;";

        Statement stmt = connect.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        try {
            while (rs.next()) {
                Customer orderCusto = new Customer(rs.getLong("OrderdataNum"),
                        rs.getDate("OrderdataDate"),
                        rs.getString("OrderdataInvoice"),
                        rs.getString("BookTitle"),
                        rs.getInt("CmdLineQty"),
                        rs.getBigDecimal("BookPrice"),
                        rs.getBigDecimal("OrderdataTotalAmount"));

                listOrder.add(orderCusto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return listOrder;
        }

    }

    public Customer getLastOrder(Long customerId) throws SQLException {
        Customer orderCusto = new Customer();
        String query = "select top 1 ord.OrderdataNum,\n"
                + "ord.OrderdataInvoice,\n"
                + "ord.OrderdataDate,\n"
                + "ord.OrderdataTotalAmount,\n"
                + "b.BookTitle,\n"
                + "cmd.CmdLineQty,\n"
                + "b.BookPrice,\n"
                + "CONCAT (a.AddressStreet, ' ', a.AddressZip, ' ', a.AddressCity, ' ', a.AddressCountry)\n"
                + "from OrderData ord\n"
                + "left join CommandLine cmd on (cmd.OrderdataNum = ord.OrderdataNum)\n"
                + "left join Book b on (b.BookIsbn = cmd.BookIsbn)\n"
                + "left join Address a on (a.AddressId = ord.AddAddressid)\n"
                + "where ord.CustomerId = " + customerId + " \n"
                + "order by ord.OrderdataDate DESC;";

        Statement stmt = connect.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        try {
            while (rs.next()) {
                orderCusto = new Customer(rs.getLong("OrderdataNum"),
                        rs.getDate("OrderdataDate"),
                        rs.getString("OrderdataInvoice"),
                        rs.getString("BookTitle"),
                        rs.getInt("CmdLineQty"),
                        rs.getBigDecimal("BookPrice"),
                        rs.getBigDecimal("OrderdataTotalAmount"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return orderCusto;
        }

    }

    public List<Customer> getAllComments(Long customerId) throws SQLException {
        List<Customer> listComments = new ArrayList<>();
        String query = "select ord.OrderdataNum,\n"
                + "ord.OrderdataDate,\n"
                + "b.BookTitle,\n"
                + "co.CommentText,\n"
                + "co.CommentScore\n"
                + "from OrderData ord\n"
                + "left join CommandLine cmd on (cmd.OrderdataNum = ord.OrderdataNum)\n"
                + "left join Book b on (b.BookIsbn = cmd.BookIsbn)\n"
                + "left join Comment co on (co.BookIsbn = b.BookIsbn)\n"
                + "left join Customer custo on (custo.CustomerId = co.CustomerId)\n"
                + "where ord.CustomerId = " + customerId + " \n"
                + "order by ord.OrderdataDate DESC;;";

        Statement stmt = connect.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        try {
            while (rs.next()) {
                Customer commentCusto = new Customer(rs.getLong("OrderdataNum"),
                        rs.getDate("OrderdataDate"),
                        rs.getString("BookTitle"),
                        rs.getString("CommentText"),
                        rs.getInt("CommentScore"));
                listComments.add(commentCusto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return listComments;
        }

    }

    public Customer getLastComment(Long customerId) throws SQLException {
        Customer commentCusto = new Customer();
        String query = "select top 1 ord.OrderdataNum,\n"
                + "ord.OrderdataDate,\n"
                + "b.BookTitle,\n"
                + "co.CommentText,\n"
                + "co.CommentScore\n"
                + "from OrderData ord\n"
                + "left join CommandLine cmd on (cmd.OrderdataNum = ord.OrderdataNum)\n"
                + "left join Book b on (b.BookIsbn = cmd.BookIsbn)\n"
                + "left join Comment co on (co.BookIsbn = b.BookIsbn)\n"
                + "left join Customer custo on (custo.CustomerId = co.CustomerId)\n"
                + "where ord.CustomerId = " + customerId + " \n"
                + "order by ord.OrderdataDate DESC;";

        Statement stmt = connect.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        try {
            while (rs.next()) {
                commentCusto = new Customer(rs.getLong("OrderdataNum"),
                        rs.getDate("OrderdataDate"),
                        rs.getString("BookTitle"),
                        rs.getString("CommentText"),
                        rs.getInt("CommentScore"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return commentCusto;
        }

    }

}
