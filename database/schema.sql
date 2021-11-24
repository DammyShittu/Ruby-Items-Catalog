CREATE TABLE Book(
  id                INT GENERATED ALWAYS AS IDENTITY,
  label_id          INT,
  publish_date      DATE,
  archived          BOOLEAN,
  publisher         VARCHAR(100),
  cover_state       VARCHAR(100),
  PRIMARY KEY (id),
  FOREIGN KEY (label_id) REFERENCES Label(id)
);

CREATE TABLE label(
  id                INT GENERATED ALWAYS AS IDENTITY,
  title             VARCHAR(100),
  color             VARCHAR(100),
  PRIMARY KEY (id)
);