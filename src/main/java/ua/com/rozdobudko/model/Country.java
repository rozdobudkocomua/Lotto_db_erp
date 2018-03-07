package ua.com.rozdobudko.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "lt_country")
public class Country {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name_e")
    private String name;

    @OneToMany(mappedBy = "country")
    private Set<Item> item;

    public Country() {
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
        return "Country{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", item=" + item +
                '}';
    }
}
