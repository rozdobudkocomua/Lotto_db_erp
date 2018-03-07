package ua.com.rozdobudko.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "lt_rWeight")
public class RWeight {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "rWeight")
    private Set<Item> item;

    public RWeight() {
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
        return "RWeight{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", item=" + item +
                '}';
    }
}
