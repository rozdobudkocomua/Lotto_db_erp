package ua.com.rozdobudko.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "lt_package")
public class Package {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;


    @OneToMany(mappedBy = "aPackage")
    private Set<Item> item;

    public Package() {
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
        return "Package{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", item=" + item +
                '}';
    }
}
