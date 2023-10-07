create table users
(
    id       int primary key auto_increment,
    username varchar(20) not null,
    password varchar(20) not null
);

create table profile
(
    id      int primary key auto_increment,
    name    varchar(20)  not null,
    surname varchar(20)  not null,
    photo   varchar(255) null,
    phone   varchar(10)  not null,
    user_id int          null unique,
    foreign key (user_id) references users (id)
);

select *
from users
         join profile p on users.id = p.user_id;
select users.id, username, password, name, surname, photo, phone
from users
         join profile p on users.id = p.user_id;

create table users_cars
(
    user_id int    not null,
    car_id  bigint not null,
    primary key (user_id, car_id),
    foreign key (user_id) references users (id),
    foreign key (car_id) references cars (id)
);

select u.*, model
from cars
         join cyanogen00101.users_cars uc on cars.id = uc.car_id
         join cyanogen00101.users u on u.id = uc.user_id
where model = 'bmw';

select u.*, model
from cars
         join cyanogen00101.users_cars uc on cars.id = uc.car_id
         join cyanogen00101.users u on u.id = uc.user_id
where username = 'dj4';