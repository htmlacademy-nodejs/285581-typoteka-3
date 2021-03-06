INSERT INTO user_roles (role)
  VALUES
  ('Автор'),
  ('Читатель'),
  ('Гость');


INSERT INTO users (firstname, lastname, email, password, role_id)
  VALUES
  ('Иванов', 'Иван', 'dfgdsf@dsfg.ru', 'dfgdfsg', 1),
  ('Петров', 'Петр', 'fdgsdfg@dfgscvbb.com', 'gsr4546', 2),
  ('Сидоров', 'Сидор', 'fgsdfg.sdf@fgsd.com', 'I8e#dfgsdr', 3);


INSERT INTO categories (category)
  VALUES
  ('Железо'),
  ('Дорога'),
  ('Публицистика'),
  ('Кино'),
  ('Деревья');


INSERT INTO articles (regdate, title, description, user_id)
  VALUES
  (
    '4-24-2020, 1:28:54 PM',
    'Как начать программировать',
    'Первая большая ёлка была установлена только в 1938 году. Сто крутых бутербродов на завтрак, которые действительно великолепны. Задача организации, в особенности же новая модель организационной деятельности напрямую зависит от нас.',
    1
  );


INSERT INTO articles (regdate, title, description, user_id)
  VALUES
  (
    '5-16-2020, 1:28:54 PM',
    'Рок — это протест',
    'Помните, небольшое количество ежедневных упражнений лучше, чем один раз, но много.',
    2
  );


INSERT INTO articles (regdate, title, description, user_id)
  VALUES
  (
    '6-6-2020, 1:28:54 PM',
    '5 самых сексуальных ароматов, которые видно из окна машины',
    'Альбом стал настоящим открытием года. Мощные гитарные рифы и скоростные соло-партии не дадут заскучать.',
    1
  );


INSERT INTO articles (regdate, title, description, user_id)
  VALUES
  (
    '3-24-2020, 1:28:54 PM',
    'Что такое золотое сечение',
    'Освоить вёрстку несложно. Возьмите книгу новую книгу и закрепите все упражнения на практике.',
    3
  );


INSERT INTO articles (regdate, title, description, user_id)
  VALUES
  (
    '5-3-2020, 3:45:10 PM',
    'Сто крутых бутербродов на завтрак, которые действительно великолепны',
    'Как начать действовать? Для начала просто соберитесь. Ёлки — это не просто красивое дерево. Это прочная древесина. Он написал больше 30 хитов. Игры и программирование разные вещи. Не стоит идти в программисты, если вам нравится только игры. Альбом стал настоящим открытием года. Мощные гитарные рифы и скоростные соло-партии не дадут заскучать.',
    1
  );


INSERT INTO articles (regdate, title, description, user_id)
  VALUES
  (
    '4-24-2020, 1:28:54 PM',
    'Как достигнуть успеха не вставая с кресла',
    'Вы можете достичь всего. Стоит только немного постараться и запастись книгами.',
    2
  );


INSERT INTO articles (regdate, title, description, user_id)
  VALUES
  (
    '5-8-2020, 3:45:10 PM',
    'Борьба с прокрастинацией',
    'Простые ежедневные упражнения помогут достичь успеха. Задача организации, в особенности же новая модель организационной деятельности напрямую зависит от нас.',
    1
  );


INSERT INTO articles_to_categories (article_id, category_id)
  VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 2),
  (2, 3),
  (2, 4),
  (2, 5),
  (3, 1),
  (3, 2),
  (3, 3),
  (4, 1),
  (4, 2),
  (4, 3),
  (4, 4),
  (4, 5),
  (5, 1),
  (5, 2),
  (5, 3),
  (5, 4);


INSERT INTO images (article_id, image)
  VALUES
  (1, 'image1'),
  (2, 'image2'),
  (3, 'image3'),
  (4, 'image4'),
  (5, 'image5');


INSERT INTO comments (article_id, user_id, comment)
  VALUES
  (1, 2, 'comment text1'),
  (2, 2, 'comment text2'),
  (3, 2, 'comment text3'),
  (4, 2, 'comment text4'),
  (5, 2, 'comment text5');
