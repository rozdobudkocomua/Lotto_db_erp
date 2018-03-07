package ua.com.rozdobudko.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "lt_categoryItem")
public class CategoryOfItem {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "categoryOfItem")
    private Set<TypeOfItem> typeOfItem;

    @OneToMany(mappedBy = "categoryOfItem")
    private Set<Item> item;

    @OneToMany(mappedBy = "categoryOfItem")
    private Set<Model> model;

    @OneToMany(mappedBy = "categoryOfItem_1")
    private Set<Technology> technology_1;

    @OneToMany(mappedBy = "categoryOfItem_2")
    private Set<Technology> technology_2;

    @OneToMany(mappedBy = "categoryOfItem")
    private Set<Consist> consist;





    public CategoryOfItem() {
    }


}
