package ua.com.rozdobudko.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "lt_description")
public class Description {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;

    @Column(name = "descr_r1")
    private String descr_r1;

    @Column(name = "descr_r2")
    private String descr_r2;

    @OneToMany(mappedBy = "description")
    private Set<Item> item;

    public Description() {
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescr_r1() {
        return descr_r1;
    }

    public String getDescr_r2() {
        return descr_r2;
    }

    public Set<Item> getItem() {
        return item;
    }

    @Override
    public String toString() {
        return "Description{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", descr_r1='" + descr_r1 + '\'' +
                ", descr_r2='" + descr_r2 + '\'' +
                ", item=" + item +
                '}';
    }
}
