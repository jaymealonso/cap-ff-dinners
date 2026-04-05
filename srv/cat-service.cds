using {jan.ff.dinner as my} from '../db/schema';

service CatalogService @(odata: '/admin') {

    @requires: 'admin'
    entity Users     as projection on my.Users;

    @requires: 'admin'
    entity Events    as projection on my.Events;

    // @requires: 'admin'
    // entity Users_Questions_Answers as
    // projection on my.Users_Questions_Answers {
    // *,
    // question.text @readonly
    // };

    @requires: 'admin'
    entity Questions as projection on my.Questions;

    @requires: 'admin'
    action createEventGroups(date: Date not null, time: Time not null);

}
