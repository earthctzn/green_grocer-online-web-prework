def consolidate_cart(cart)
  cart.each_with_object({}) do |item, hash|
    item.each do |name, attributes|
     if hash[name]
       attributes[:count] += 1 
     else 
       attributes[:count] = 1
       hash[name] = attributes
     end
    end
  end
end


def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
