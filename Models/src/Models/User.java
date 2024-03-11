
package Models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private String id;
    private String account;
    private String password;
    private int rollId;
    private String name;
    private String phone;
    private String address;
    private String email;
    private String image;
    private String date;
    private String status;
}
