package ua.com.rozdobudko.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "lt_line")
public class Line {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;

    @ManyToOne
    @JoinColumn(name = "brand_id", nullable = false)
    private Brand brand;

    @OneToMany(mappedBy = "line")
    private Set<Item> item;

    public Line() {
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
        return "Line{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", brand=" + brand +
                ", item=" + item +
                '}';
    }
}
