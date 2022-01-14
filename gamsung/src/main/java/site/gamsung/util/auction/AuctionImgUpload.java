package site.gamsung.util.auction;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class AuctionImgUpload {
	
	public List<String> imgUpload(List<MultipartFile> fileList, String path) {
			
		List<String> fileNames = new ArrayList<String>();
		UUID uuid = null;
		File file = null;
		String subPath = "uploadfiles/auctionImg/product/";
		
		for (MultipartFile multipartFile : fileList) {
			
            uuid = UUID.randomUUID();
            String fileName = uuid.toString()+"_"+multipartFile.getOriginalFilename();
            
            
            file = new File(path+subPath,fileName);
            
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
