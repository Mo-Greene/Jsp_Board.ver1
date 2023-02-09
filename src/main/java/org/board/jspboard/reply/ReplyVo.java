package org.board.jspboard.reply;

import lombok.*;

/**
 * PackageName : org.board.jspboard.reply
 * Author : Mo-Greene
 * Date : 2023/02/07
 * Description :
 */
@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReplyVo {

    private Long rno;
    private String replyContent;
    private String regDate;
    private Long bno;   //fk key
}
