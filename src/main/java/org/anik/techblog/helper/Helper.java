package org.anik.techblog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {
    public static boolean deleteFile(String path){
        boolean isDelete = false;
        try{
            File file = new File(path);
            isDelete = file.delete();

        }catch (Exception e){
            e.printStackTrace();
        }

        return isDelete;
    }

    public static boolean saveFile(InputStream inputStream, String path){
        boolean isSave = false;

        try{
            byte[] b = new byte[inputStream.available()];
            inputStream.read(b);
            FileOutputStream fileOutputStream = new FileOutputStream(path);
            fileOutputStream.write(b);

            fileOutputStream.flush();
            fileOutputStream.close();
            isSave = true;
        }catch (Exception e){
            e.printStackTrace();
        }

        return isSave;
    }
}
