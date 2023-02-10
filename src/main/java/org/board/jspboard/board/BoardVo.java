package org.board.jspboard.board;

import lombok.*;

/**
 * PackageName : org.board.jspboard.board
 * Author : Mo-Greene
 * Date : 2023/02/04
 * Description :
 */

@ToString
@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
public class BoardVo {

    private Long bno;
    private boolean files;
    private String title;
    private String writer;
    private String content;
    private int view;
    private String regDate;
    private String modDate;
    private String password;
    private String category;
    private Long cno; //fk 카테고리

}
