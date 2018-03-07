package ua.com.rozdobudko.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "lt_exclusive")
public class Exclusive {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "exclusive")
    private Set<Item> item;

    @ManyToOne
    @JoinColumn(name = "brand_id", nullable = false)
    private Brand brand;

    public Exclusive() {
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

    public Brand getBrand() {
        return brand;
    }

    @Override
    public String toString() {
        return "Exclusive{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", item=" + item +
                ", brand=" + brand +
                '}';
    }
}
