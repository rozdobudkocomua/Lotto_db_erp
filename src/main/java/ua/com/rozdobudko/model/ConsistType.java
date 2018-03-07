package ua.com.rozdobudko.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "lt_consist_type")
public class ConsistType {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "consistType")
    private Set<Item> item;

    public ConsistType() {
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
        return "ConsistType{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", item=" + item +
                '}';
    }
}
