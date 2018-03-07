package ua.com.rozdobudko.model;

import javax.persistence.*;

@Entity
@Table(name = "lt_brand_technology")
public class Technology {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "photo_logo")
    private String photo_logo;

    @ManyToOne
    @JoinColumn(name = "category_id_1")
    private CategoryOfItem categoryOfItem_1;

    @ManyToOne
    @JoinColumn(name = "category_id_2")
    private CategoryOfItem getCategoryOfItem_2;

    @ManyToOne
    @JoinColumn(name = "brand_id", nullable = false)
    private Brand brand;



}
