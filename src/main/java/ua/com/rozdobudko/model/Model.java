package ua.com.rozdobudko.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "lt_model")
public class Model {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;

    @ManyToOne
    @JoinColumn(name = "brand_id")
    private Brand brand;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private CategoryOfItem categoryOfItem;

    @OneToMany(mappedBy = "model")
    private Set<Item> item;

    public Model() {
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

    public CategoryOfItem getCategoryOfItem() {
        return categoryOfItem;
    }

    public Set<Item> getItem() {
        return item;
    }

    @Override
    public String toString() {
        return "Model{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", brand=" + brand +
                ", categoryOfItem=" + categoryOfItem +
                ", item=" + item +
                '}';
    }
}
