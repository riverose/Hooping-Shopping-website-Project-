package com.hoo.ping.domain;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

//@Data
//public class ReviewVO {
//   
//   private int reviewId;
//   private int reviewStar;
//   private String reviewQuality;
//   private String reviewTitle;
//   private String reviewText;
//   private Date reviewDate;
//   private int reviewHeight;
//   private int reviewWeight;
//   private String reviewImg;
//   private int reviewThumbs;
//   private int orderId;
//   private int productId;
//   private char reviewBestYN;
//   private String memberId;
//   
//}

@Data
public class ReviewVO {
   
   private int reviewId;
   private int reviewStar;
   private String reviewQuality;
   private String reviewTitle;
   private String reviewText;
   private Date reviewDate;
   private int reviewHeight;
   private int reviewWeight;
   private String reviewImg;
   private int reviewThumbs;
   private int payId;
   private int productId;
   private char reviewBestYN;
   private int memberId;
   private String memberName;

	 //------------------------1018---------------------------
	 private String reviewColor;
   private String reviewSize;

	 //--------------------------------------------------------

   // -- 진영 --
	 private String paySize;
   private String payColor;
   private String productName;
   private int memberRating;

   public int getReviewId() {
      return reviewId;
   }
   public void setReviewId(int reviewId) {
      this.reviewId = reviewId;
   }
   public int getReviewStar() {
      return reviewStar;
   }
   public void setReviewStar(int reviewStar) {
      this.reviewStar = reviewStar;
   }
   public String getReviewQuality() {
      return reviewQuality;
   }
   public void setReviewQuality(String reviewQuality) {
      this.reviewQuality = reviewQuality;
   }
   public String getReviewTitle() {
      return reviewTitle;
   }
   public void setReviewTitle(String reviewTitle) {
      this.reviewTitle = reviewTitle;
   }
   public String getReviewText() {
      return reviewText;
   }
   public void setReviewText(String reviewText) {
      this.reviewText = reviewText;
   }
   public Date getReviewDate() {
      return reviewDate;
   }
   public void setReviewDate(Date reviewDate) {
      this.reviewDate = reviewDate;
   }
   public int getReviewHeight() {
      return reviewHeight;
   }
   public void setReviewHeight(int reviewHeight) {
      this.reviewHeight = reviewHeight;
   }
   public int getReviewWeight() {
      return reviewWeight;
   }
   public void setReviewWeight(int reviewWeight) {
      this.reviewWeight = reviewWeight;
   }
   public String getReviewImg() {
      return reviewImg;
   }
   public void setReviewImg(String reviewImg) {
      this.reviewImg = reviewImg;
   }
   public int getReviewThumbs() {
      return reviewThumbs;
   }
   public void setReviewThumbs(int reviewThumbs) {
      this.reviewThumbs = reviewThumbs;
   }

   public int getProductId() {
      return productId;
   }
   public void setProductId(int productId) {
      this.productId = productId;
   }
   public char getReviewBestYN() {
      return reviewBestYN;
   }
   public void setReviewBestYN(char reviewBestYN) {
      this.reviewBestYN = reviewBestYN;
   }
   public int getMemberId() {
      return memberId;
   }
   public void setMemberId(int memberId) {
      this.memberId = memberId;
   }
   
   MultipartFile file;
      public MultipartFile getFile() {
         return file;
      }
      
      public void setFile(MultipartFile file) {
         this.file = file;
         System.out.println("inner  "+ file);
         System.out.println(file.isEmpty());
         
         // 업로드 파일 접근
         if(!(file.isEmpty())){
            
            System.out.println("if inner  "+ file);
            this.reviewImg = file.getOriginalFilename();
            
            System.out.println("origin : " + reviewImg);
            // 가짜이름도 하나 생성
            
            
            // 해당 경로로 변경
            File f = new File("C:\\Users\\human\\Desktop\\hooping\\src\\main\\webapp\\resources\\img\\reviewImg\\" + reviewImg);
            try {
               file.transferTo(f);
               
            } catch (IllegalStateException e) {            
               e.printStackTrace();
            } catch (IOException e) {
               
               e.printStackTrace();
            }
         }
      
      }
        
}