package kr.ac.hansung.cse.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Enrollment {

    @NotNull(message="Year cannot be null")
    private Integer year;

    @NotNull(message="Semester cannot be null")
    private Integer semester;

    @Size(min=1, max=100, message="Course name must be between 1 and 100 chars")
    private String courseName;

    @Size(min=1, max=20, message="Course type must be between 1 and 20 chars")
    private String courseType;

    @Size(min=1, max=50, message="Instructor name must be between 1 and 50 chars")
    private String instructorName;

    @NotNull(message="Credit cannot be null")
    private Integer credit;
}

