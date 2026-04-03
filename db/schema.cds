using {
    managed,
    cuid,
    sap
} from '@sap/cds/common';

namespace jan.ff.dinner;

type Gender : String enum {
    Male;
    Female;
    Other;
}

entity Countries : sap.common.Countries {
    emoji : String;
}

entity Users : cuid, managed {
    name    : String;
    birth   : Date;
    email   : String;
    gender  : Gender;
    country : Association to Countries;
    picture : String;
    events  : Association to many Users_Events
                  on events.Users_ID = $self;
};

entity Users_Events {
    key Users_ID  : Association to Users;
    key Events_ID : Association to Events;
}

entity Events : cuid, managed {
    title      : localized String;
    is_dinnner : Boolean;
    date       : DateTime;
    location   : String;
    users      : Association to many Users_Events
                     on users.Events_ID = $self;
}
