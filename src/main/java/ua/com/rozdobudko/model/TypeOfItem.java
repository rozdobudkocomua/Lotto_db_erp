package ua.com.rozdobudko.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "lt_typeItem")
public class TypeOfItem {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;

    @ManyToOne
    @JoinColumn(name = "category_id", nullable = false)
    private CategoryOfItem categoryOfItem;

    @OneToMany(mappedBy = "typeOfItem")
    private Set<Item> item;

    public TypeOfItem() {
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public CategoryOfItem getCategoryOfItem() {
        return categoryOfItem;
    }

    public Set<Item> getItem() {
        return item;
    }

    @Override
    public String toString() {
        return "TypeOfItem{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", categoryOfItem=" + categoryOfItem +
                '}';
    }
}
