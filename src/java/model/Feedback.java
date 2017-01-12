package model;

import java.sql.Timestamp;

public class Feedback {
    private long feedbackID;
    private String feedbackName;
    private String feedbackEmail;
    private Timestamp feedbackUpdate;
    private String feedbackText;
    private Boolean feedbackFinish;   

    public Feedback() {
    }

    public Feedback(long feedbackID, String feedbackName, String feedbackEmail, Timestamp feedbackUpdate, String feedbackText, Boolean feedbackFinish) {
        this.feedbackID = feedbackID;
        this.feedbackName = feedbackName;
        this.feedbackEmail = feedbackEmail;
        this.feedbackUpdate = feedbackUpdate;
        this.feedbackText = feedbackText;
        this.feedbackFinish = feedbackFinish;
    }    

    public long getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(long feedbackID) {
        this.feedbackID = feedbackID;
    }

    public String getFeedbackName() {
        return feedbackName;
    }

    public void setFeedbackName(String feedbackName) {
        this.feedbackName = feedbackName;
    }

    public String getFeedbackEmail() {
        return feedbackEmail;
    }

    public void setFeedbackEmail(String feedbackEmail) {
        this.feedbackEmail = feedbackEmail;
    }

    public String getFeedbackText() {
        return feedbackText;
    }

    public void setFeedbackText(String feedbackText) {
        this.feedbackText = feedbackText;
    }

    public Boolean getFeedbackFinish() {
        return feedbackFinish;
    }

    public void setFeedbackFinish(Boolean feedbackFinish) {
        this.feedbackFinish = feedbackFinish;
    }

    public Timestamp getFeedbackUpdate() {
        return feedbackUpdate;
    }

    public void setFeedbackUpdate(Timestamp feedbackUpdate) {
        this.feedbackUpdate = feedbackUpdate;
    }
    
}
