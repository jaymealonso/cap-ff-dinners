using {
    jan.ff.dinner.Users     as Users,
    jan.ff.dinner.Events    as Events,
    jan.ff.dinner.Countries as Countries
} from '../db/schema';


annotate Countries with @(

UI: {LineItem: [
    {Value: code},
    {Value: name},
    {Value: emoji},
], }) {
    emoji @title: '{i18n>Emoji}'
};


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
            gender
        ],
        LineItem       : [
            {Value: name},
            {Value: gender},
            {Value: country.emoji},
            {Value: birth},
            {Value: email},
        ],


    }
) {
    name    @title: '{i18n>UserName}';
    gender  @title: '{i18n>Genre}';
    birth   @title: '{i18n>Birth}';
    email   @title: '{i18n>Email}';
    picture @title: '{i18n>Picture}';
};

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
                Value: gender,
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
            id_dinner
        ],

        LineItem       : [
            {Value: title},
            {Value: date},
            {Value: is_dinnner},
            {Value: location},
        ],
    }
);

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
            ID    : 'users',

        }
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
