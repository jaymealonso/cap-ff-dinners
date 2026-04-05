using {jan.ff.dinner.Questions as Questions} from '../../db/schema';

// Listview
annotate Questions with @(
    odata.draft.enabled,

    UI: {
        HeaderInfo     : {
            $Type         : 'UI.HeaderInfoType',
            TypeName      : '{i18n>Question}',
            TypeNamePlural: '{i18n>Questions}',
        },

        SelectionFields: [
            index,
            text,
        ],
        LineItem       : [
            {Value: index},
            {Value: text},
        ],
    }
);


//object page
annotate Questions with @(UI: {
    Facets                        : [{
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>Info}',
        Target: '@UI.FieldGroup#GeneralInformation',
    }],
    FieldGroup #GeneralInformation: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: index,
            },
            {
                $Type: 'UI.DataField',
                Value: text,
            },
        ]
    },
})
