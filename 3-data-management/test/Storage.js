const Storage = artifacts.require('Storage')

contract('Storage', () => {
  beforeEach(async function () {
    this.storage = await Storage.new()
    this.storageAddress = this.storage.address
  })

  it('stores the number at position 0', async function () {
    const number = await web3.eth.getStorageAt(this.storageAddress, 0);
    assert(new web3.BigNumber(number).eq(await this.storage.number()))
  })

  it('stores the account at position 1', async function () {
    const account = await web3.eth.getStorageAt(this.storageAddress, 1);
    assert.equal(account, this.storageAddress)
  })

  it('stores the array length as expected', async function () {
    const length = await web3.eth.getStorageAt(this.storageAddress, 2);
    assert.equal(length, 0x02)
  })

  it('stores the mapping as expected', async function () {
    const unused = await web3.eth.getStorageAt(this.storageAddress, 3);
    assert.equal(unused, 0)

    let ind = '0000000000000000000000000000000000000000000000000000000000000003'
    let key = '0000000000000000000000000000000000000000000000000000000000000001'
    let position = web3.sha3(key + ind, { encoding: "hex" })
    let item = await web3.eth.getStorageAt(this.storageAddress, position)
    assert.equal(item, 9)

    key = '0000000000000000000000000000000000000000000000000000000000000002'
    position = web3.sha3(key + ind, { encoding: "hex" })
    item = await web3.eth.getStorageAt(this.storageAddress, position)
    assert.equal(item, 10)
  })
})
