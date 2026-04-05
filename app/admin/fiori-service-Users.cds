using {jan.ff.dinner.Users as Users, } from '../../db/schema';


// annotation for listview
annotate Users with @(
    odata.draft.enabled,

    UI: {
        HeaderInfo     : {
            $Type         : 'UI.HeaderInfoType',
            TypeName      : '{i18n>User}',
            TypeNamePlural: '{i18n>Users}',
        },

        SelectionFields: [
            ID,
            name,
            email,
            gender,
        ],
        LineItem       : [
            {Value: name},
            {Value: gender.name},
            {Value: country.name},
            {Value: birth},
            {Value: email},
        ],
    }
);

// annotation for objectpage
annotate Users with @(
    UI          : {
        Facets                        : [
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Info',
                Target: '@UI.FieldGroup#GeneralInformation',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : '{i18n>Questions}',
                Target: 'questions_answers/@UI.LineItem',
            },
        ],

        FieldGroup #GeneralInformation: {
            $Type: 'UI.FieldGroupType',
            Data : [
                {
                    $Type                  : 'UI.DataField',
                    Value                  : name,
                    ![@Common.FieldControl]: #Mandatory
                },
                {
                    $Type                  : 'UI.DataField',
                    Value                  : gender_code,
                    ![@Common.FieldControl]: #Mandatory
                },
                {
                    $Type                  : 'UI.DataField',
                    Value                  : birth,
                    ![@Common.FieldControl]: #Mandatory
                },
                {
                    $Type                  : 'UI.DataField',
                    Value                  : email,
                    ![@Common.FieldControl]: #Mandatory
                },
                {
                    $Type: 'UI.DataField',
                    Value: picture
                },
                {
                    $Type                  : 'UI.DataField',
                    Value                  : country_code,
                    ![@Common.FieldControl]: #Mandatory
                },
            ]
        },


    },
    Capabilities: {NavigationRestrictions: {
        $Type               : 'Capabilities.NavigationRestrictionsType',
        RestrictedProperties: [{
            NavigationProperty: questions_answers,
            InsertRestrictions: {Insertable: false},
            DeleteRestrictions: {Deletable: false},
        }],
    }, },
);
