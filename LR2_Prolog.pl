% Директиви для дозволу роздільних визначень
:- discontiguous is_a/2.
:- discontiguous part_of/2.

% Родо-видові зв'язки
is_a(cat, mammal).
is_a(dog, mammal).
is_a(elephant, mammal).
is_a(lion, mammal).
is_a(tiger, mammal).
is_a(poodle, dog).
is_a(bulldog, dog).
is_a(bird, animal).
is_a(eagle, bird).
is_a(sparrow, bird).
is_a(fish, animal).
is_a(shark, fish).
is_a(tuna, fish).
is_a(reptile, animal).
is_a(snake, reptile).
is_a(crocodile, reptile).
is_a(insect, animal).
is_a(ant, insect).
is_a(beetle, insect).
is_a(plant, living_organism).
is_a(animal, living_organism).
is_a(rose, plant).
is_a(oak, plant).
is_a(pine, plant).

% Частини
part_of(cat, domestic_animals).
part_of(dog, domestic_animals).
part_of(mammal, animal_kingdom).
part_of(bird, animal_kingdom).
part_of(fish, animal_kingdom).
part_of(reptile, animal_kingdom).
part_of(insect, animal_kingdom).
part_of(domestic_animals, animals).

% Транзитивність родо-видових зв'язків
is_a(X, Z) :- is_a(X, Y), is_a(Y, Z).

% Якщо X є частиною Y, а Y є частиною Z, то X є частиною Z
part_of(X, Z) :- part_of(X, Y), part_of(Y, Z).

% Визначаємо, що якщо X є частиною Y, а Y є видом Z, то X є видом Z
is_a(X, Z) :- part_of(X, Y), is_a(Y, Z).

% Нескінченне виведення
is_a(X, living_organism) :- is_a(X, animal).
is_a(X, living_organism) :- is_a(X, plant).

% Заборона наслідування
is_a(X, dog) :- not(is_a(X, reptile)).
is_a(X, mammal) :- not(is_a(X, fish)).
