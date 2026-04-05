using {
    jan.ff.dinner.Users_Events            as Users_Events,
    jan.ff.dinner.Countries               as Countries,
    jan.ff.dinner.Genders                 as Genders,
    jan.ff.dinner.Users_Questions_Answers as Users_Questions_Answers
} from '../../db/schema';


// Listview
annotate Genders with @(UI: {

    LineItem      : [
        {Value: code},
        {Value: name},
    ],
    Identification: [{Value: code}],

}) {


}


annotate Countries with @(UI: {LineItem: [
    {Value: code},
    {Value: name},
], });

annotate Users_Questions_Answers @(UI: {LineItem: [
    {Value: question.index},
    {
        Value                  : question.text,
        ![@Common.FieldControl]: #ReadOnly
    },
    {
        Value                  : answer,
        ![@Common.FieldControl]: #Mandatory
    }
], });

annotate Users_Events with @(UI: {LineItem: [
    {Value: users_ID},
    {
        Value                  : users.name,
        ![@Common.FieldControl]: #ReadOnly
    },
    {
        Value                  : users.country.name,
        ![@Common.FieldControl]: #ReadOnly
    },
    {
        Value                  : users.birth,
        ![@Common.FieldControl]: #ReadOnly
    },

], });
