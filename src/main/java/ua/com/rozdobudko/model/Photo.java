package ua.com.rozdobudko.model;

import javax.persistence.*;

@Entity
@Table(name = "lt_item_photo")
public class Photo {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "photo")
    private String photo;

    @Column(name = "sort")
    private Integer sort;

    @ManyToOne
    @JoinColumn(name = "item_id")
    private Item item;

    public Photo() {
    }

    public String getId() {
        return id;
    }

    public String getPhoto() {
        return photo;
    }

    public Integer getSort() {
        return sort;
    }

    public Item getItem() {
        return item;
    }

    @Override
    public String toString() {
        return "Photo{" +
                "id=" + id +
                ", photo='" + photo + '\'' +
                ", sort=" + sort +
                ", item=" + item +
                '}';
    }
}
