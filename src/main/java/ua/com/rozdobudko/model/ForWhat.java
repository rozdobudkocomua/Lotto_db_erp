package ua.com.rozdobudko.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "lt_forWhat")
public class ForWhat {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "forWhat")
    private Set<Item> item;

    public ForWhat() {
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Set<Item> getItem() {
        return item;
    }

    @Override
    public String toString() {
        return "ForWhat{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", item=" + item +
                '}';
    }
}
