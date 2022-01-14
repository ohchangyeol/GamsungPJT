package site.gamsung.service.domain;

import java.sql.Date;

public class RatingReview {

   private Camp camp;
   private AuctionInfo auctionInfo;
   private User user;
   private int ratingReviewNo;
   private int ratingReviewStatus;
   private String ratingReviewTitle;
   private String ratingReviewContent;
   private Date reviewRegDate;
   private String comment;
   private Date commentRegDate;
   private double statusRating;
   private double priceRating;
   private double kindnessRating;
   private double avgRating;
   private String img1;
   private String img2;
   private String img3;
   private String reviewDeleteFlag;
   private String commentDeleteFlag;
   
   public RatingReview() {
      
   }
   
   // Constructors to connect with the community! 
   public RatingReview(Camp camp, User user, int ratingReviewStatus, String ratingReviewTitle,
         String ratingReviewContent, double statusRating, String img1, String img2, String img3) {
      super();
      this.camp = camp;
      this.user = user;
      this.ratingReviewStatus = ratingReviewStatus;
      this.ratingReviewTitle = ratingReviewTitle;
      this.ratingReviewContent = ratingReviewContent;
      this.statusRating = statusRating;
      this.img1 = img1;
      this.img2 = img2;
      this.img3 = img3;
   }


   public Camp getCamp() {
      return camp;
   }

   public void setCamp(Camp camp) {
      this.camp = camp;
   }

   public AuctionInfo getAuctionInfo() {
      return auctionInfo;
   }

   public void setAuctionInfo(AuctionInfo auctionInfo) {
      this.auctionInfo = auctionInfo;
   }

   public User getUser() {
      return user;
   }

   public void setUser(User user) {
      this.user = user;
   }

   public int getRatingReviewNo() {
      return ratingReviewNo;
   }

   public void setRatingReviewNo(int ratingReviewNo) {
      this.ratingReviewNo = ratingReviewNo;
   }

   public int getRatingReviewStatus() {
      return ratingReviewStatus;
   }

   public void setRatingReviewStatus(int ratingReviewStatus) {
      this.ratingReviewStatus = ratingReviewStatus;
   }

   public String getRatingReviewTitle() {
      return ratingReviewTitle;
   }

   public void setRatingReviewTitle(String ratingReviewTitle) {
      this.ratingReviewTitle = ratingReviewTitle;
   }

   public String getRatingReviewContent() {
      return ratingReviewContent;
   }

   public void setRatingReviewContent(String ratingReviewContent) {
      this.ratingReviewContent = ratingReviewContent;
   }

   public Date getReviewRegDate() {
      return reviewRegDate;
   }

   public void setReviewRegDate(Date reviewRegDate) {
      this.reviewRegDate = reviewRegDate;
   }

   public String getComment() {
      return comment;
   }

   public void setComment(String comment) {
      this.comment = comment;
   }

   public Date getCommentRegDate() {
      return commentRegDate;
   }

   public void setCommentRegDate(Date commentRegDate) {
      this.commentRegDate = commentRegDate;
   }

   public double getStatusRating() {
      return statusRating;
   }

   public void setStatusRating(double statusRating) {
      this.statusRating = statusRating;
   }

   public double getPriceRating() {
      return priceRating;
   }

   public void setPriceRating(double priceRating) {
      this.priceRating = priceRating;
   }

   public double getKindnessRating() {
      return kindnessRating;
   }

   public void setKindnessRating(double kindnessRating) {
      this.kindnessRating = kindnessRating;
   }

   public double getAvgRating() {
      return avgRating;
   }

   public void setAvgRating(double avgRating) {
      this.avgRating = avgRating;
   }

   public String getImg1() {
      return img1;
   }

   public void setImg1(String img1) {
      this.img1 = img1;
   }

   public String getImg2() {
      return img2;
   }

   public void setImg2(String img2) {
      this.img2 = img2;
   }

   public String getImg3() {
      return img3;
   }

   public void setImg3(String img3) {
      this.img3 = img3;
   }

   public String getReviewDeleteFlag() {
      return reviewDeleteFlag;
   }

   public void setReviewDeleteFlag(String reviewDeleteFlag) {
      this.reviewDeleteFlag = reviewDeleteFlag;
   }

   public String getCommentDeleteFlag() {
      return commentDeleteFlag;
   }

   public void setCommentDeleteFlag(String commentDeleteFlag) {
      this.commentDeleteFlag = commentDeleteFlag;
   }

   @Override
   public String toString() {
      return "RatingReview [camp=" + camp + ", auctionInfo=" + auctionInfo + ", user=" + user
            + ", ratingReviewNo=" + ratingReviewNo + ", ratingReviewStatus=" + ratingReviewStatus
            + ", ratingReviewTitle=" + ratingReviewTitle + ", ratingReviewContent=" + ratingReviewContent
            + ", reviewRegDate=" + reviewRegDate + ", comment=" + comment + ", commentRegDate=" + commentRegDate
            + ", statusRating=" + statusRating + ", priceRating=" + priceRating + ", kindnessRating="
            + kindnessRating + ", avgRating=" + avgRating + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3
            + ", reviewDeleteFlag=" + reviewDeleteFlag + ", commentDeleteFlag=" + commentDeleteFlag + "]";
   }
   
}