class ShippingDay < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' }, { id: 1, name: '1~2日で配送' }, { id: 2, name: '2~3日で配送' },
    { id: 3, name: '3~7日で配送' }
  ]
end
