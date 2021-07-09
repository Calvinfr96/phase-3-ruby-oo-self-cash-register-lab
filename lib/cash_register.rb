class CashRegister
    attr_accessor :total, :last_transaction
    attr_reader :discount, :items

    def initialize(discount = 0)
        @total = 0
        @last_transaction = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quatity = 1)
        self.last_transaction = price.to_f * quatity.to_f
        self.total += price.to_f * quatity.to_f
        quatity.times do
            @items << title
        end
    end

    def void_last_transaction
        self.total -= @last_transaction

    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            self.total -= @total.to_f*@discount.to_f/100
            "After the discount, the total comes to $#{@total.round(0)}."
        end
    end
end
