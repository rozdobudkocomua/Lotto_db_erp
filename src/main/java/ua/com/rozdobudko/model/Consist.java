package ua.com.rozdobudko.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "lt_consist")
public class Consist {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;

    @Column(name = "name_e")
    private String name_e;

    @Column(name = "name_u")
    private String name_u;

    @OneToMany(mappedBy = "consist")
    private Set<Item> item;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Set<CategoryOfItem> categoryOfItem;

    public Consist() {
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getName_e() {
        return name_e;
    }

    public String getName_u() {
        return name_u;
    }

    public Set<Item> getItem() {
        return item;
    }

    public Set<CategoryOfItem> getCategoryOfItem() {
        return categoryOfItem;
    }

    @Override
    public String toString() {
        return "Consist{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", name_e='" + name_e + '\'' +
                ", name_u='" + name_u + '\'' +
                ", item=" + item +
                ", categoryOfItem=" + categoryOfItem +
                '}';
    }
}
