class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
        @last_transaction = nil
    end
    def add_item(title, price, quantity = 1)
        self.total += price * quantity
    self.last_transaction = { title: title, price: price, quantity: quantity }
    quantity.times { self.items << title }
    end

    def apply_discount
        if discount > 0
          self.total -= (self.total * (discount.to_f / 100)).to_i
          "After the discount, the total comes to $#{self.total}."
        else
          "There is no discount to apply."
        end
      end
    
      def void_last_transaction
        return unless self.last_transaction
    
        price = self.last_transaction[:price]
        quantity = self.last_transaction[:quantity]
        self.total -= price * quantity
    
        quantity.times { self.items.pop }
    
        self.last_transaction = nil
      end




end

