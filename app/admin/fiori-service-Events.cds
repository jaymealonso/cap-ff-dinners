using {jan.ff.dinner.Events as Events, } from '../../db/schema';


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
