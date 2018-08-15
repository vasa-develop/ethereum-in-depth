const Wallet = artifacts.require('Wallet')
const Greeter = artifacts.require('Greeter')
const SolidityEvent = require('web3/lib/web3/event.js')

contract('Wallet', ([_, someone]) => {
  const ETH_2 = new web3.BigNumber('2e18')

  beforeEach(async function () {
    this.wallet = await Wallet.new()
  })

  it('can receive payouts', async function () {
    await this.wallet.sendTransaction({ from: someone, value: ETH_2 })

    const balance = web3.eth.getBalance(this.wallet.address)
    assert(balance.eq(ETH_2))
  })

  it('thanks to the payout sender', async function () {
    const tx = await this.wallet.sendTransaction({ from: someone, value: ETH_2 })
    const logs = tx.receipt.logs

    assert.equal(logs.length, 1)
    assert.equal(logs[0].topics[0], web3.sha3('Thanks(address,uint256)'))

    const event = new SolidityEvent(null, Object.values(Greeter.events)[0], '0x0')
    const parsedLog = event.decode(logs[0])

    assert.equal(parsedLog.args.sender, someone)
    assert(parsedLog.args.value.eq(ETH_2))
  })
})
