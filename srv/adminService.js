const cds = require('@sap/cds');

class AdminService extends cds.ApplicationService {
    init() {

        const { Users, Events, EventGroups, UsersEvents } = cds.entities;

        this.on('createEventGroups', async res => {
            const { date, time } = res.data;
            
            const users = await SELECT.from(Users).columns('userID');

            const groupedUsers = users.reduce((acc, user, index) => {
                const groupIndex = Math.floor(index / 6);
                if (!acc[groupIndex]) {
                    acc[groupIndex] = []; // Cria um novo grupo a cada 6 elementos
                }
                acc[groupIndex].push({
                    user_userID: user.userID
                });
                return acc;
            }, []);

            const eventGroups = groupedUsers.map( users => ({ users }) );

            const [ events ] = await INSERT.into(Events).entries({
                title: `Event create day ${date}, time ${time}`,
                is_dinner: true,
                date,
                groups: eventGroups
            });

            return
        })

        // Delegate requests to the underlying generic service
        return super.init()
    }

}

module.exports = AdminService