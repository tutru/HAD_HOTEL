package com.had.hotelmanagement.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.had.hotelmanagement.entity.Customer;
import com.had.hotelmanagement.entity.VCardBean;

import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;

@Repository
@Transactional
public class VCard {
	//=======QRCode===================
    public static String createVCard(VCardBean vCard) {
//    	
//    	VCard qrService = new VCard();
//    	  VCardBean vCard1 = new VCardBean();
//    	  Customer customer = new Customer();
//    	  vCard1.setName(customer.getName())
//    	          .setGovernmentid(customer.getGovernmentid())
//    	          .setAddress(customer.getAddress())
//    	          .setPhone(customer.getPhone())
//    	          .setEmail(customer.getEmail());
//    	  
//    	  		qrService.createVCard(vCard1);
    	
        final int SIZE = 500;
        final String EXTENSION = ".png";
        File file = null;
        FileOutputStream out = null;
        ByteArrayOutputStream bout = null;
        try {
        Date date = new Date();
        bout = QRCode.from(vCard.toString())
                .withSize(SIZE, SIZE)
                .to(ImageType.PNG)
                .stream();
        file = new File("C:\\Users\\HOME\\Desktop\\QRCode\\"
                + File.separator + "QR" + "_" + date.getTime() + EXTENSION);
        if (!file.exists()) {
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            file.createNewFile();
        }
        out = new FileOutputStream(file);
        bout.writeTo(out);
        out.flush();
        out.close();
        return file.getPath();
        }catch (IOException e) {
			return null;
		}
    }
    
    public void card(Customer customer){
  VCard qrService = new VCard();
  VCardBean vCard = new VCardBean();
  vCard.setName(customer.getName())
          .setGovernmentid(customer.getGovernmentid())
          .setAddress(customer.getAddress())
          .setPhone(customer.getPhone())
          .setEmail(customer.getEmail());
  
  		qrService.createVCard(vCard);

}
}
