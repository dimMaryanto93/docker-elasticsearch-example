create table folders (
    id varchar(64) not null primary key,
    name varchar(100) not null,
    is_directory boolean not null default false,
    created_date TIMESTAMP not null default now(),
    created_by VARCHAR(100),
    parent_id varchar(64)
) engine = InnoDB;

alter table folders
add CONSTRAINT fk_folder_id_parent FOREIGN key (parent_id) 
REFERENCES folders(id) on update CASCADE on delete RESTRICT;

insert into folders (id, name, is_directory, created_date, created_by, parent_id) 
values 
    ('001', 'Root', true, now(), 'admin', null),
    ('011', 'Itime', true, now(), 'admin', '001'),
    ('012', 'DIS', true, now(), 'admin', '001');
    