package readshare.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

public class UnZipEpub {

//	public void unzipfile() throws IOException{
//		ZipFile zipFile=new ZipFile("D://Ebook/Java.epub");
//		System.out.println("zipFile="+zipFile);
//		
//	}
	
	
	public static void main(String[] args) throws IOException {
		ZipFile zipFile=new ZipFile("D://Ebook/Java.epub");
		System.out.println("zipFile"+zipFile);
		
        String path = "D://unzip/";

        Enumeration files = zipFile.entries();

        while (files.hasMoreElements()) {
            ZipEntry entry = (ZipEntry) files.nextElement();
            if (entry.isDirectory()) {
                File file = new File(path + entry.getName());
                file.mkdir();
                System.out.println("Create dir " + entry.getName());
            } else {
                File f = new File(path + entry.getName());
                FileOutputStream fos = new FileOutputStream(f);
                InputStream is = zipFile.getInputStream(entry);
                byte[] buffer = new byte[1024];
                int bytesRead = 0;
                while ((bytesRead = is.read(buffer)) != -1) {
                    fos.write(buffer, 0, bytesRead);
                }
                fos.close();
                System.out.println("Create File " + entry.getName());
            }
        }
	}

}
