package org.board.jspboard.board;

import lombok.*;

import java.time.LocalDateTime;

/**
 * PackageName : org.board.jspboard.board
 * Author : Mo-Greene
 * Date : 2023/02/04
 * Description :
 */
@Builder
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
    private int view;
    private String regDate;
    private String modDate;

}
