package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Feedback;

public class FeedbackDAO {
    // get danh sách Phản hồi   
    public ArrayList<Feedback> getListFeedback() throws SQLException { 
        Connection connection = DBConnect.getConnecttion();        
        String sql = "SELECT * FROM feedback";       
        PreparedStatement ps = connection.prepareCall(sql);        
        ResultSet rs = ps.executeQuery();       
        ArrayList<Feedback> list = new ArrayList<>();        
        while (rs.next()) 
        {             
            Feedback feedback = new Feedback();    
            feedback.setFeedbackID(rs.getLong("feedback_id")); 
            feedback.setFeedbackName(rs.getString("feedback_name")); 
            feedback.setFeedbackEmail(rs.getString("feedback_email")); 
            feedback.setFeedbackText(rs.getString("feedback_text")); 
            feedback.setFeedbackUpdate(rs.getTimestamp("feedback_update")); 
            feedback.setFeedbackFinish(rs.getBoolean("feedback_finish")); 
            list.add(feedback);         
        }         
        return list;    
    }
    //Get góp ý theo ID
    public Feedback getFeedback(long feedbackID) throws SQLException 
    {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM feedback WHERE `feedback_id` = '" + feedbackID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Feedback feedback = new Feedback();
        while (rs.next()) 
        {
            feedback.setFeedbackID(rs.getLong("feedback_id")); 
            feedback.setFeedbackName(rs.getString("feedback_name")); 
            feedback.setFeedbackEmail(rs.getString("feedback_email")); 
            feedback.setFeedbackText(rs.getString("feedback_text")); 
            feedback.setFeedbackUpdate(rs.getTimestamp("feedback_update")); 
            feedback.setFeedbackFinish(rs.getBoolean("feedback_finish")); 
        }
        return feedback;
    }
    public boolean insert(Feedback c) throws SQLException {
    try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "INSERT INTO feedback(feedback_id,feedback_name,feedback_email,feedback_text) VALUE(?,?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, c.getFeedbackID());
            ps.setString(2, c.getFeedbackName());
            ps.setString(3, c.getFeedbackEmail());
            ps.setString(4, c.getFeedbackText());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
        return false;
        }
    }
    public boolean delete(long feedback_id) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "DELETE FROM feedback WHERE feedback_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, feedback_id);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
        return false;
        }
    }
    public boolean finish(long c) throws SQLException {
    try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "UPDATE feedback SET feedback_finish = 1 WHERE feedback_id=?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, c);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException e) {
        return false;
        }
    }
        public static void main(String[] args) throws SQLException 
    {       
        FeedbackDAO dao = new FeedbackDAO(); 
        System.out.println(dao.getListFeedback());
        
    } 
}
