using {
    jan.ff.dinner as dinner,
    sap.common as sap
} from '../db/schema';

service AdminService @(requires: 'authenticated-user') {

    entity Users @(restrict: [
        { grant: ['READ','WRITE'], to: 'Admin' },
        { grant: 'READ', where: (userID = $user) }
    ]) as projection on dinner.Users;

    entity Events @(restrict: [
        { grant: ['READ','WRITE'], to: 'Admin' },
        { grant: 'READ', where: (usersEvents.users.userID = $user) }
    ]) as projection on dinner.Events;

    @readonly
    entity Users_Events @(restrict: [
        { grant: ['READ','WRITE'], to: 'Admin' },
        { grant: 'READ', where: (users.userID = $user) }
    ]) as projection on dinner.Users_Events;

    @readonly
    entity Countries as projection on sap.Countries;
    
    @readonly
    entity Genders as projection on dinner.Genders;

    @requires: 'Admin'
    action createEventGroups(date: Date not null, time: Time not null);

}
