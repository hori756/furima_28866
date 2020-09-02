window.addEventListener('load', function(){

  const money = document.getElementById("item-price")
  const fee = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  console.log(money)
  console.log(fee)
  console.log(profit)
  money.addEventListener('input', function(){
    fee.innerHTML = parseInt(money.value / 10)
    profit.innerHTML = money.value - parseInt(money.value / 10)
  })
})