package ua.com.rozdobudko.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "lt_item")
public class Item {

    @Id
    @Column(name="id")
    private String id;

    @ManyToOne
    @JoinColumn(name = "type_id", nullable = false)
    private TypeOfItem typeOfItem;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private CategoryOfItem categoryOfItem;

    @Column(name = "code")
    private String code;

    @ManyToOne
    @JoinColumn(name = "brand_id", nullable = false)
    private Brand brand;

    @ManyToOne
    @JoinColumn(name = "collection_id")
    private Collection collection;

    @ManyToOne
    @JoinColumn(name = "line_id")
    private Line line;

    @ManyToOne
    @JoinColumn(name = "model_id")
    private Model model;

    @ManyToOne
    @JoinColumn(name = "exclusive_id")
    private Exclusive exclusive;

    @ManyToOne
    @JoinColumn(name = "country_id", nullable = false)
    private Country country;


    @ManyToOne
    @JoinColumn(name = "color_id")
    private Color color;

    @ManyToOne
    @JoinColumn(name = "age_id")
    private Age age;

    @ManyToOne
    @JoinColumn(name = "rBalance_id")
    private RBalance rBalance;

    @ManyToOne
    @JoinColumn(name = "rWeight_id")
    private RWeight rWeigth;

    @ManyToOne
    @JoinColumn(name = "rHeadSize_id")
    private RHeadSize rHeadSize;

    @ManyToOne
    @JoinColumn(name = "rLength_id")
    private RLength rLength;

    @ManyToOne
    @JoinColumn(name = "rStatus_id")
    private RStatus rStatus;

    @ManyToOne
    @JoinColumn(name = "rStringFormula_id")
    private RStringFormula rStringFormula;

    @ManyToOne
    @JoinColumn(name = "stitching_id")
    private Stitching stitching;

    @ManyToOne
    @JoinColumn(name = "isNew")
    private IsNew isNew;

    @ManyToOne
    @JoinColumn(name = "package_id")
    private Package aPackage;

    @ManyToOne
    @JoinColumn(name = "quantity_id")
    private Quantity quantity;

    @ManyToOne
    @JoinColumn(name = "sex_id")
    private Sex sex;

    @ManyToOne
    @JoinColumn(name = "rFlexibility_id")
    private RFlexibility rFlexibility;

    @ManyToOne
    @JoinColumn(name = "descr_id")
    private Description description;

    @OneToMany(mappedBy = "item")
    private Set<Photo> photo;

    @ManyToOne
    @JoinColumn(name = "video_id")
    private Video video;

    @ManyToOne
    @JoinColumn(name = "consist_type_id")
    private ConsistType consistType;

    @ManyToOne
    @JoinColumn(name = "consist_id")
    private Consist consist;

    @ManyToOne
    @JoinColumn(name = "forWhat_id")
    private ForWhat forWhat;


}
