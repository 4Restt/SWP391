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
public class ProductSale {
    private int id;
    private String startdate;
    private String enddate;
    private String name;
    private int proinforId;
    private float price;
    private float percent;
    private String image;
    private float pricesale;
}