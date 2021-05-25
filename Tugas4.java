
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
public class TugasKeamananInformasi {
    public static String encryptPassword(String password, byte[] salt) {

        String hashpwd = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(salt);
            byte[] bytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            hashpwd = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        System.out.println(" Password " + password  );
        System.out.println(" salt " + salt  );
        return hashpwd;
    }

    private static byte[] getSalt() throws NoSuchAlgorithmException {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16];
        random.nextBytes(salt);
        return salt;
    }
    public static void main(String[] args) throws NoSuchAlgorithmException {
        byte[] salt = getSalt();
        String password = encryptPassword("Password", salt);
        System.out.println(" Hash  -> " + password);
    }
}
