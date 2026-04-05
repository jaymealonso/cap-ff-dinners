const cds = require('@sap/cds')
const { INSERT } = require('@sap/cds/lib/ql/cds-ql')


class CatalogService extends cds.ApplicationService {
    init() {

        const { Users, Users_Questions_Answers } = this.entities;

        this.on("CREATE", Users.drafts, async (req, next) => {
            const questions = await SELECT.from`Questions`
            const aQuestions = questions.map(m => {
                return {
                    "DraftAdministrativeData_DraftUUID": req.data.DraftAdministrativeData_DraftUUID,
                    "user_ID": req.data.ID,
                    "question_index": m.index,
                    "answer": 1
                }
            })

            await INSERT
                .into(Users_Questions_Answers.drafts)
                .entries(aQuestions)

            return next()
        })

        this.on('createEventGroups', async res => {

            let { date, time } = res.data
            let users = await SELECT.from`Users`

            const grouped = users.reduce((acc, user, index) => {
                const groupIndex = Math.floor(index / 6);
                if (!acc[groupIndex]) {
                    acc[groupIndex] = []; // Cria um novo grupo a cada 6 elementos
                }
                acc[groupIndex].push({ "users_ID": user.ID });
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

            await INSERT
                .into(`jan.ff.dinner.Events`)
                .entries(aEvents)

        })

        // Delegate requests to the underlying generic service
        return super.init()
    }

}

module.exports = CatalogService