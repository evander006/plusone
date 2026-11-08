-- +goose Up

DELETE FROM event_participants;
DELETE FROM events;

ALTER TABLE events
DROP COLUMN category_id;

CREATE TABLE event_categories (
    event_id UUID NOT NULL,
    category_id UUID NOT NULL,

    PRIMARY KEY (event_id, category_id),

    FOREIGN KEY (event_id)
        REFERENCES events(id)
        ON DELETE CASCADE,

    FOREIGN KEY (category_id)
        REFERENCES categories(id)
        ON DELETE CASCADE
);

CREATE INDEX idx_event_categories_category_id
    ON event_categories(category_id);

-- +goose Down

DROP TABLE event_categories;

ALTER TABLE events
ADD COLUMN category_id UUID;