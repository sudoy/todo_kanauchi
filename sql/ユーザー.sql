CREATE TABLE userdata(
id int auto_increment PRIMARY KEY,
email varchar(50) not null,
password varchar(50) not null,
name varchar(50) not null
);

insert into userdata(email, password, name)values('ichiro@tsd.com', 'ichiro', '�C�`���[');
insert into userdata(email, password, name)values('daru@tsd.com', 'daru', '�_���r�b�V���L');
insert into userdata(email, password, name)values('tanaka@tsd.com', 'tanaka', '�c������');
