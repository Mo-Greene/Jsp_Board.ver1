package org.board.jspboard.reply;

import lombok.*;

import java.time.LocalDateTime;

/**
 * PackageName : org.board.jspboard.reply
 * Author : Mo-Greene
 * Date : 2023/02/07
 * Description :
 */
@Builder
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReplyVo {

    private Long rno;
    private String replyContent;
    private LocalDateTime regDate;
    private Long bno;   //fk key
}
