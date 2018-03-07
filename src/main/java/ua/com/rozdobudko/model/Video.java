package ua.com.rozdobudko.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "lt_video")
public class Video {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;

    @Column(name = "video_1")
    private String video_1;

    @Column(name = "video_2")
    private String video_2;

    @OneToMany(mappedBy = "video")
    private Set<Item> item;

    public Video() {
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getVideo_1() {
        return video_1;
    }

    public String getVideo_2() {
        return video_2;
    }

    public Set<Item> getItem() {
        return item;
    }

    @Override
    public String toString() {
        return "Video{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", video_1='" + video_1 + '\'' +
                ", video_2='" + video_2 + '\'' +
                ", item=" + item +
                '}';
    }
}
