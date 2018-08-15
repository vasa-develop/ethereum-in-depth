const Calculator = artifacts.require('Calculator')

contract('Calculator', () => {
  beforeEach(async function () {
    this.calculator = await Calculator.new();
  })

  it('starts at zero', async function () {
    const result = await this.calculator.result()
    assert(result.eq(0))
  })

  it('can add unsigned integers', async function () {
    await this.calculator.add(5)
    const result = await this.calculator.result()

    assert(result.eq(5))
  })

  it('can multiply by unsigned integers', async function () {
    await this.calculator.add(5)
    await this.calculator.mul(2)
    const result = await this.calculator.result()

    assert(result.eq(10))
  })

  it('can calculate mixed expressions', async function () {
    await this.calculator.add(5)
    await this.calculator.mul(2)
    await this.calculator.add(32)
    const result = await this.calculator.result()

    assert(result.eq(42))
  })
})
