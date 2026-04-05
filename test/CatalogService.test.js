const cds = require('@sap/cds')

const { GET, POST, expect, axios } = cds.test (__dirname+'/..')
axios.defaults.auth = { username: 'alice', password: '' }

describe('OData APIs', () => {

  it('serves CatalogService.Users', async () => {
    const { data } = await GET `/admin/CatalogService.Users ${{ params: { $select: 'ID,name' } }}`
    expect(data.value).to.containSubset([
      {"ID":"16652436-617b-45a0-ae5b-b5d4a9890e27","name":"name-16652436"},
    ])
  })

  it('executes createEventGroups', async () => {
    const { data } = await POST `/admin/createEventGroups ${
      {"date":"2007-09-10","time":"22:59:53"}
    }`
    // TODO finish this test
    // expect(data.value).to...
  })
})
