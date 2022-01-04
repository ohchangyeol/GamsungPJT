package site.gamsung.util.auction;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class AuctionImgUpload {
	
	private static final String TMP_PATH = "C:\\Users\\muse1\\git\\GamsungPJT\\gamsung\\src\\main\\webapp\\uploadfiles\\auctionimg\\product";
	
	public List<String> imgUpload(List<MultipartFile> fileList) {
			
		List<String> fileNames = new ArrayList<String>();
		UUID uuid = null;
		File file = null;
		
		for (MultipartFile multipartFile : fileList) {
			
            uuid = UUID.randomUUID();
            String fileName = uuid.toString()+"_"+multipartFile.getOriginalFilename();
            
            file = new File(TMP_PATH,fileName);
            
            try {
				FileCopyUtils.copy(multipartFile.getBytes(), file);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				fileNames.add(fileName);
			}
		}
		
		return fileNames;
	}
}
