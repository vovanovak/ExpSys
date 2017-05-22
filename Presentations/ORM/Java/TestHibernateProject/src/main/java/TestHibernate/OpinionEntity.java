package TestHibernate;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;


@Entity
@Table(name = "Opinion", uniqueConstraints = {
        @UniqueConstraint(columnNames = "ID")})
public class OpinionEntity implements Serializable {
    private static final long serialVersionUID = -1798070786993154676L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", unique = true, nullable = false)
    private Integer opinionId;

    @Column(name = "EXPERT", unique = false, nullable = false)
    private Integer expertId;

    @Column(name = "DISCUSSION", unique = false, nullable = false)
    private Integer discussionId;

    @Column(name = "OPINIONTEXT", unique = false, nullable = false, length = 100)
    private String opinionText;

    public Integer getOpinionIdId() {
        return opinionId;
    }

    public void setOpinionId(Integer opinionId) {
        this.opinionId = opinionId;
    }

    public Integer getExpertId() {
        return expertId;
    }

    public void setExpertId(Integer expertId) {
        this.expertId = expertId;
    }

    public Integer getDiscussionIdId() {
        return discussionId;
    }

    public void setDiscussionId(Integer discussionId) {
        this.discussionId = discussionId;
    }

    public String getOpinionText() {
        return opinionText;
    }

    public void setOpinionText(String opinionText) {
        this.opinionText = opinionText;
    }



}
