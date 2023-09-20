/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD COLUMN species VARCHAR(255);


CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255),
  age INT
);


CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);


ALTER TABLE animals
  DROP COLUMN species,
  ADD COLUMN species_id INT,
  ADD COLUMN owner_id INT,
  ADD FOREIGN KEY (species_id) REFERENCES species(id),
  ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

  /*day4*/

  CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  age INTEGER NOT NULL,
  date_of_graduation DATE NOT NULL
);

CREATE TABLE specializations (
  vet_id INTEGER NOT NULL,
  species_id INTEGER NOT NULL,
  PRIMARY KEY (vet_id, species_id),
  FOREIGN KEY (vet_id) REFERENCES vets (id),
  FOREIGN KEY (species_id) REFERENCES species (id)
);

CREATE TABLE visits (
  animal_id INTEGER NOT NULL,
  vet_id INTEGER NOT NULL,
  visit_date DATE NOT NULL,
  FOREIGN KEY (animal_id) REFERENCES animals (id),
  FOREIGN KEY (vet_id) REFERENCES vets (id)
);

