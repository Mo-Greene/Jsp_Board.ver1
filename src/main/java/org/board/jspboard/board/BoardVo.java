package org.board.jspboard.board;

import lombok.*;

/**
 * PackageName : org.board.jspboard.board
 * Author : Mo-Greene
 * Date : 2023/02/04
 * Description :
 */
@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class BoardVo {

    private Long bno;
    private String category;
    private boolean files;
    private String title;
    private String writer;
    private String content;
    private int view;
    private String regDate;
    private String modDate;
    private String password;

}
