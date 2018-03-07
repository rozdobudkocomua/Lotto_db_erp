package ua.com.rozdobudko.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "lt_age")
public class Age {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "age")
    private Set<Item> item;

    public Age() {
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
        return "Age{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", item=" + item +
                '}';
    }
}
