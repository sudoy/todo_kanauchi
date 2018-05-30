CREATE TABLE todo(
id int AUTO_INCREMENT not null PRIMARY KEY ,
title varchar(100) not null,
note varchar(255) not null,
star varchar(10) not null,
deadline date
);

insert into todo values(1, 'java', 'java silver練習', '★★★', '2015/06/15');
insert into todo values(2, 'html', 'モックアップ作成', '★', null);
insert into todo values(3, 'database', '副問い合わせ練習', '★★', '2018/05/15');
insert into todo values(4, 'jsp/サーブレット', '連携を練習', '★★★', '2015/06/15');
