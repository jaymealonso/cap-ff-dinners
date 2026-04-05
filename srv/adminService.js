const cds = require('@sap/cds')

class AdminService extends cds.ApplicationService {
    init() {

        this.on('createEventGroups', async res => {

            let { date, time } = res.data
            let users = await SELECT.from`Users`

            const grouped = users.reduce((acc, user, index) => {
                const groupIndex = Math.floor(index / 6);
                if (!acc[groupIndex]) {
                    acc[groupIndex] = []; // Cria um novo grupo a cada 6 elementos
                }
                acc[groupIndex].push({ "users_userID": user.userID });
                return acc;
            }, []);

            const aEvents = grouped.map(grp => {
                return {
                    "title": `Event create day ${date}, time ${time}`,
                    "is_dinner": true,
                    "date": date,
                    "users": grp
                }
            })

            const { result } = await INSERT
                .into(`jan.ff.dinner.Events`)
                .entries(aEvents)

        })

        // Delegate requests to the underlying generic service
        return super.init()
    }

}

module.exports = AdminService