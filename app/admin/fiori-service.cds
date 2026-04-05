using {
    AdminService.Users,
    AdminService.Events,
    AdminService.UserGroups,
    AdminService.Countries,
} from '../../srv/adminService';

annotate Countries with @(

UI: {LineItem: [
    {Value: code},
    {Value: name},
], });

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
annotate Users with @(UI: {
    Facets                        : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Info',
        Target: '@UI.FieldGroup#GeneralInformation',
    }],

    FieldGroup #GeneralInformation: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Value: gender_code,
            },
            {
                $Type: 'UI.DataField',
                Value: birth
            },
            {
                $Type: 'UI.DataField',
                Value: email
            },
            {
                $Type: 'UI.DataField',
                Value: picture
            },
            {
                $Type: 'UI.DataField',
                Value: country_code
            },
            {
                $Type: 'UI.DataField',
                Value: country.emoji
            }
        ]
    },
});

// Listview
annotate Events with @(
    odata.draft.enabled,

    UI: {
        HeaderInfo     : {
            $Type         : 'UI.HeaderInfoType',
            TypeName      : '{i18n>Event}',
            TypeNamePlural: '{i18n>Events}',
        },

        SelectionFields: [
            title,
            date,
            is_dinner
        ],

        LineItem       : [
            {
                $Type : 'UI.DataFieldForAction',
                Label : 'Create Groups',
                Action: 'CatalogService.EntityContainer/createEventGroups',
            },
            {Value: title},
            {Value: date},
            {Value: is_dinnner},
            {Value: location},
        ],
    }
);


annotate UserGroups with @(UI: {LineItem: [
    {Value: users_ID},
    {Value: users.name},
    {Value: users.country},
    {Value: users.birth},

], });

// annotation for objectpage
annotate Events with @(UI: {
    Facets                        : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Info}',
            Target: '@UI.FieldGroup#GeneralInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Members}',
            Target: 'users/@UI.LineItem',

        },
    ],

    FieldGroup #GeneralInformation: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Value: date,
            },
            {
                $Type: 'UI.DataField',
                Value: is_dinnner
            },
            {
                $Type: 'UI.DataField',
                Value: location
            },
        ]
    },
});
