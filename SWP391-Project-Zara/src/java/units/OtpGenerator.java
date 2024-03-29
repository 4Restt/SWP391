/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package units;

import java.security.SecureRandom;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author FPT SHOP
 */
public class OtpGenerator {
     private static final String DIGITS = "0123456789";

    //Generate OTP
    public static String generateOTP() {
        SecureRandom random = new SecureRandom();

        // Define regex patterns for each required character type
        String digitPattern = "(?=.*[" + DIGITS + "])";

        // Combine the patterns into a single regex pattern
        String passwordPattern = digitPattern + ".{3,}";

        Pattern pattern = Pattern.compile(passwordPattern);
        while (true) {
            StringBuilder password = new StringBuilder();
            int passwordLength = 6;
            // Generate a random password
            for (int i = 0; i < passwordLength; i++) {
                String characterSet = DIGITS;
                int randomIndex = random.nextInt(characterSet.length());
                char randomChar = characterSet.charAt(randomIndex);
                password.append(randomChar);
            }
            // Check if the generated password meets the regex pattern
            Matcher matcher = pattern.matcher(password.toString());
            if (matcher.matches()) {
                return password.toString();
            }
        }
    }
}
