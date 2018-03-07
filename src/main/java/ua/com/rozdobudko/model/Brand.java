package ua.com.rozdobudko.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "lt_brand")
public class Brand {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "brand")
    private Set<Item> item;

    @OneToMany(mappedBy = "brand")
    private Set<Model> model;

    @OneToMany(mappedBy = "brand")
    private Set<Color> color;

    @OneToMany(mappedBy = "brand")
    private Set<Technology> technology;

    @OneToMany(mappedBy = "brand")
    private Set<Collection> collection;









    public Brand() {
    }


}
