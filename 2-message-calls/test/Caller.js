const Caller = artifacts.require('Caller')

contract('Caller', accounts => {
  it('does not send all gas', async function () {
    const caller = await Caller.new();

    const { logs } = await caller.sendTransaction({ from: accounts[0], value: 1000, gasPrice: 0, gas: 640000 });

    assert(logs.length === 2);

    assert(logs[0].event === 'CallerLog');
    assert(logs[0].args.gas.eq(618955));

    assert(logs[1].event === 'CallerLog');
    assert(logs[1].args.gas.eq(9479));
  });
});
