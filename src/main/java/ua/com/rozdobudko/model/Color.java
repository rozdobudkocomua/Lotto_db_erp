package ua.com.rozdobudko.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "lt_color")
public class Color {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;

    @ManyToOne
    @JoinColumn(name = "brand_id")
    private Brand brand;

    @OneToMany(mappedBy = "color")
    private Set<Item> item;

    public Color() {
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Brand getBrand() {
        return brand;
    }

    public Set<Item> getItem() {
        return item;
    }

    @Override
    public String toString() {
        return "Color{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", brand=" + brand +
                ", item=" + item +
                '}';
    }
}
