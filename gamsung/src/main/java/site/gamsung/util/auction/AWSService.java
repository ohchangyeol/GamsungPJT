package site.gamsung.util.auction;

import java.io.File;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class AWSService {
    
	private static final String BUCKET_NAME = "gamsung";
    private static final String ACCESS_KEY = "AKIAVCSX266KKD77T3OH";
    private static final String SECRET_KEY = "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";
    
    private AmazonS3 amazonS3;
 
    public AWSService() {
        AWSCredentials awsCredentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);
        amazonS3 = new AmazonS3Client(awsCredentials);
    }
 
    public void uploadFile(File file) {
        if (amazonS3 != null) {
            try {
                PutObjectRequest putObjectRequest =
                        new PutObjectRequest(BUCKET_NAME + "/", file.getName(), file);
                putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead); // file permission
                amazonS3.putObject(putObjectRequest); // upload file
 
            } catch (AmazonServiceException ase) {
                ase.printStackTrace();
            } finally {
                amazonS3 = null;
            }
        }
    }
}