const Calldata = artifacts.require('Calldata')

contract('Calldata', () => {
  it('adds two given integers', async function () {
    const calldata = await Calldata.new()
    const result = await calldata.add(1, 6)

    assert(result.eq(7))
  })
})
