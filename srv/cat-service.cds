using {jan.ff.dinner as my} from '../db/schema';

service CatalogService @(odata: '/admin') {

    @requires: 'admin'
    entity Users  as projection on my.Users;

    @requires: 'admin'
    entity Events as projection on my.Events;

    @requires: 'admin'
    action createEventGroups(date: Date);
}
