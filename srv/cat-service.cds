using {jan.ff.dinner as my} from '../db/schema';

service CatalogService @(odata: '/browse') {
    entity Users  as
        projection on my.Users {
            *
        };

    entity Events as
        projection on my.Events {
            *
        };
}


extend service CatalogService with {
    action createEventGroups();
}
