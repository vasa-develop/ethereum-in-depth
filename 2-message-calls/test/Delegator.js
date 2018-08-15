const Delegator = artifacts.require('Delegator')

contract('Delegator', accounts => {
  it('does not send all gas', async function () {
    const delegator = await Delegator.new();

    const { logs } = await delegator.sendTransaction({ from: accounts[0], value: 1000, gasPrice: 0, gas: 640000 });

    assert(logs.length === 2);

    assert(logs[0].event === 'DelegatorLog');
    assert(logs[0].args.gas.eq(618952));

    assert(logs[1].event === 'DelegatorLog');
    assert(logs[1].args.gas.eq(9630));
  });
});
