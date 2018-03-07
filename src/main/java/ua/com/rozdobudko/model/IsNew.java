package ua.com.rozdobudko.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "lt_isNew")
public class IsNew {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "isNew")
    private Set<Item> item;

    public IsNew() {
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
        return "IsNew{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", item=" + item +
                '}';
    }
}
