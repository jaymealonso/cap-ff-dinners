using {
    managed,
    cuid,
    sap.common.CodeList,
    User,
    sap.common.Countries
} from '@sap/cds/common';

namespace jan.ff.dinner;

entity Genders : CodeList {
    key code : String enum {
            Male = 'M';
            Female = 'F';
            Other = 'O';
        };
        name : localized String;
}

entity Users : managed {
    key userID  : User;
        name    : String                   @title: '{i18n>UserName}';
        birth   : Date                     @title: '{i18n>Birth}';
        email   : String                   @title: '{i18n>Email}';
        gender  : Association to Genders   @title: '{i18n>Gender}';
        country : Association to Countries @title: '{i18n>Country}';
        picture : String                   @title: '{i18n>Picture}';
        groups  : Association to many UserGroups
                      on groups.user = $self;
}

entity Events : cuid, managed {
    title     : localized String @title: '{i18n>EventTitle}';
    is_dinner : Boolean          @title: '{i18n>IsDinner}';
    date      : DateTime         @title: '{i18n>EventDate}';
    location  : String           @title: '{i18n>Location}';
    groups    : Composition of many EventGroups
                    on groups.event = $self;
}

entity EventGroups : cuid, managed {
    event : Association to Events;
    users : Composition of many UserGroups
                on users.group = $self;
}

entity UserGroups {
    key user  : Association to Users;
    key group : Association to EventGroups;
}
