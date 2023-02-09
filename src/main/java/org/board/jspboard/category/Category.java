package org.board.jspboard.category;

import lombok.Getter;

@Getter
public enum Category {
    JAVA("JAVA"),
    C("C");

    private final String title;

    Category(String title) {
        this.title = title;
    }
}
