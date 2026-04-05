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
        { grant: ['READ','WRITE'], to: 'Admin' }
    ]) as projection on dinner.Events;

    entity EventGroups @(restrict: [
        { grant: ['READ','WRITE'], to: 'Admin' },
        { grant: 'READ', where: (users.user.userID = $user) }
    ]) as projection on dinner.EventGroups;

    @readonly
    entity UserGroups @(restrict: [
        { grant: ['READ','WRITE'], to: 'Admin' },
        { grant: 'READ', where: (user.userID = $user) }
    ]) as projection on dinner.UserGroups;

    @readonly
    entity Countries as projection on sap.Countries;
    
    @readonly
    entity Genders as projection on dinner.Genders;

    @requires: 'Admin'
    action createEventGroups(date: Date not null, time: Time not null);

}
