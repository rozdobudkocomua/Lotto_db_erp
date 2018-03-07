package ua.com.rozdobudko.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "lt_carpet")
public class Carpet {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;
}
