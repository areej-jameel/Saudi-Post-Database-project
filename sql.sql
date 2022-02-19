create database postal;
create table person(
  id int primary key auto_increment,
  firstName varchar(200) not null,
  lastName varchar(200) not null,
  age int not null,
  gender varchar(20) not null,
  phone varchar(40) not null,
  nationalAddress varchar(300) not null
  
);

create table customer(
    personID int not null,
    primary key(personID),
    foreign key(personID) references person(id)
);

create table PostalMessage(
   
   id int primary key auto_increment,
   title varchar(300) not null,
   description varchar(2000) not null,
   content varchar(2000) not null,
   dateSending date not null,
   customerID int not null,
   foreign key(customerID) references customer(personID)
);

create table receiver(

  personID int not null,
  postalID int not null,
  foreign key(postalID) references PostalMessage(id),
  primary key(personID),
  foreign key(personID) references person(id)
);

create table supervisor(
   personID int not null,
   primary key(personID),
   foreign key(personID) references person(id),
   workingTime varchar(300) not null,
   salary int not null
    
);

create table writer(
   personID int not null,
   primary key(personID),
   foreign key(personID) references person(id),
   workingTime varchar(300) not null,
   salary int not null
);

create table report(
   id int primary key auto_increment,
   title varchar(200) not null,
   content varchar(3000) not null,
   date date not null,
   writerID int not null,
   foreign key(writerID) references writer(personID)

);

create table order_customer(
   id int primary key auto_increment,
   title varchar(200) not null,
   content varchar(3000) not null,
   date date not null,
   customerID int not null,
   foreign key(customerID) references customer(personID)
);

create table complaint(

  oredrID int not null,
  status varchar(300) not null,
  foreign key(oredrID) references order_customer(id)
) ;

create table suggestion(
   oredrID int not null,
  foreign key(oredrID) references order_customer(id)  
);

create table status_postal(
   id int primary key auto_increment,
   content varchar(3000) not null,
   date date not null
);


create table status_customer_postal(
  postalID int not null,
  statusID int not null,
  supervisorID int not null,
  primary key(postalID,statusID,supervisorID),
  foreign key(postalID) references PostalMessage(id),
  foreign key(statusID) references status_postal(id),
  foreign key(supervisorID) references supervisor(personID)
  )

  create table Remittance(

  id int primary key auto_increment,
  value int not null,
  reason varchar(2000) not null,
  date date not null,
  customerID int not null,
  foreign key(customerID) references customer(personID)
) ;

create table RemittanceReceiverInfo(

   receiverphone varchar(300) primary key,
   receiveremail varchar(400) not null,
   reveivername varchar(400) not null,
   receiverlocation varchar(1000) not null
   
);

create table RemittanceReceiver(
   remittanceID int not null,
   receiverphone varchar(300) not null,
   primary key(remittanceID, receiverphone),
   foreign key(remittanceID) references Remittance(id),
   foreign key(receiverphone) references RemittanceReceiverInfo(receiverphone)
);

INSERT INTO `person` (`id`, `firstName`, `lastName`, `age`, `gender`, `phone`, `nationalAddress`)
 VALUES (NULL, 'Areej', 'alsalmi', '23', 'female', '+966545134737', '67523187');
INSERT INTO `person` (`id`, `firstName`, `lastName`, `age`, `gender`, `phone`, `nationalAddress`)
 VALUES (NULL, 'Reem', 'AL-roqi', '23', 'female', '+966509725723', '873649283');
INSERT INTO `person` (`id`, `firstName`, `lastName`, `age`, `gender`, `phone`, `nationalAddress`)
 VALUES (NULL, 'reem', 'alsalmi', '23', 'female', '+966987126478', '218734912348');
INSERT INTO `person` (`id`, `firstName`, `lastName`, `age`, `gender`, `phone`, `nationalAddress`)
 VALUES (NULL, 'reham', 'shoroq', '23', 'female', '+9668723475867', '23476872498');
INSERT INTO `writer` (`personID`, `workingTime`, `salary`)
 VALUES ('3', 'night', '300');
INSERT INTO `postalmessage` (`id`, `title`, `description`, `content`, `dateSending`, `customerID`)
 VALUES (NULL, 'first message', 'this is first message postal for me', 'content of this postal message', '2020-07-17', '1');
INSERT INTO `postalmessage` (`id`, `title`, `description`, `content`, `dateSending`, `customerID`)
 VALUES (NULL, 'second postal message', 'this is second postal message for me', 'content of this postal message', '2020-07-15', '1');

INSERT INTO `receiver` (`personID`, `postalID`)
 VALUES ('2','1');

INSERT INTO `remittance` (`id`, `value`, `reason`, `date`, `customerID`)
 VALUES (NULL, '300', 'for business', '2020-07-17', '1');
INSERT INTO `remittance` (`id`, `value`, `reason`, `date`, `customerID`)
 VALUES (NULL, '400', 'for working', '2020-07-16', '1');

INSERT INTO `remittancereceiverinfo` (`receiverphone`, `receiveremail`, `reveivername`, `receiverlocation`)
 VALUES ('+9667834698276', 'first@hotmail.com', 'first receiver', 'makka');

INSERT INTO `remittancereceiver` (`remittanceID`, `receiverphone`) 
 VALUES ('1', '+9667834698276');

INSERT INTO `report` (`id`, `title`, `content`, `date`, `writerID`)
 VALUES (NULL, 'first report', 'this is first report in the system', '2020-07-16', '3');
INSERT INTO `writer` (`personID`, `workingTime`, `salary`)
 VALUES ('4', 'morning', '200');
 INSERT INTO `status_postal` (`id`, `content`, `date`)
  VALUES (NULL, 'it\'s good', '2020-07-16'), (NULL, 'it\'s received now', '2020-07-22');
INSERT INTO `status_customer_postal` (`postalID`, `statusID`, `supervisorID`)
 VALUES ('1', '1', '4'), ('1', '2', '4');

select p.*  from customer c, person p where c.personID = p.id;

select * from writer where personID in (select writerID from report);

select count(id) as numbr_of_reports from report;

select count(*) from postalmessage ;

select p.* from receiver r, person p where r.personID = p.id and postalID = 1;

delete from report where id = 1;

update  person set phone = '+9665243523' where firstName = 'reem';
