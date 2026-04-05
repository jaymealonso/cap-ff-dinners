using {
    managed,
    cuid,
    sap
} from '@sap/cds/common';

namespace jan.ff.dinner;

entity Genders : sap.common.CodeList {
    key code : String           @title: '{i18n>GenderCode}' enum {
            Male = 'M';
            Female = 'F';
            Other = 'O';
        };
        name : localized String @title: '{i18n>Gender}';
}

entity Countries : sap.common.CodeList {
    key code : String           @title: '{i18n>CountryCode}';
        name : localized String @title: '{i18n>CountryName}';
}

@cds.odata.valuelist
entity Questions {
    key index : Integer          @title       : '{i18n>QuestionIndex}'
                                 @assert.range: [
            1,
            15
        ];
        text  : localized String @title: '{i18n>Question}';
}

entity Users_Questions_Answers {
    key user     : Association to Users;
    key question : Association to Questions;
        answer   : Integer  @title: '{i18n>Answer}'  @assert.range: [
            1,
            10
        ];
}

entity Users : cuid, managed {
    name              : String                   @assert.notNull  @title: '{i18n>UserName}';
    birth             : Date                     @title: '{i18n>Birth}';
    email             : String                   @title: '{i18n>Email}';
    gender            : Association to Genders   @title: '{i18n>Gender}';
    country           : Association to Countries @title: '{i18n>Country}';
    picture           : String                   @title: '{i18n>Picture}';
    questions_answers : Composition of many Users_Questions_Answers
                            on questions_answers.user = $self;
    events            : Association to many Users_Events
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
