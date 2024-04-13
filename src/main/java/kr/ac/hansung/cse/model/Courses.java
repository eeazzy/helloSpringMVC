package kr.ac.hansung.cse.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotNull;
@Getter
@Setter
@ToString
@NoArgsConstructor
public class Courses {

    @NotNull(message="Year cannot be null")
    private Integer year;

    @NotNull(message="Semester cannot be null")
    private Integer semester;
    private String courseCode;
    private String courseName;
    private String courseType;
    private String instructorName;
    private Integer credit;
}

