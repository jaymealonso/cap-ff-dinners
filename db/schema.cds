using {
    managed,
    cuid,
    sap
} from '@sap/cds/common';

namespace jan.ff.dinner;

entity Genders : sap.common.CodeList {
    key code : String enum {
            Male = 'M';
            Female = 'F';
            Other = 'O';
        };
        name : localized String;
}

entity Countries : sap.common.CodeList {
    key code : String           @title: '{i18n>CountryCode}';
        name : localized String @title: '{i18n>CountryName}';
}

entity Users : cuid, managed {
    name    : String                   @title: '{i18n>UserName}';
    birth   : Date                     @title: '{i18n>Birth}';
    email   : String                   @title: '{i18n>Email}';
    gender  : Association to Genders   @title: '{i18n>Gender}';
    country : Association to Countries @title: '{i18n>Country}';
    picture : String                   @title: '{i18n>Picture}';
    events  : Association to many Users_Events
                  on events.users = $self;
};

entity Users_Events {
    key users  : Association to Users;
    key events : Association to Events;
}

entity Events : cuid, managed {
    title      : localized String @title: '{i18n>EventTitle}';
    is_dinnner : Boolean          @title: '{i18n>IsDinner}';
    date       : DateTime         @title: '{i18n>EventDate}';
    location   : String           @title: '{i18n>Location}';
    users      : Composition of many Users_Events
                     on users.events = $self;
}
