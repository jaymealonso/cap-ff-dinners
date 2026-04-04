const cds = require('@sap/cds')


class CatalogService extends cds.ApplicationService {
    init() {
        this.on('createEventGroups', res => { })

        // Delegate requests to the underlying generic service
        return super.init()
    }

}

module.exports = CatalogService

