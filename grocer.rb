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
  coupons.each do |coupon|
    name = coupon[:item]
    
      if cart[name] && cart[name][:count] >= coupon[:num]
        if cart["#{name} W/COUPON"] 
          cart["#{name} W/COUPON"][:count] += 1 
        elsif
           cart["#{name} W/COUPON"] = {:count => 1, :price => coupon[:cost]}
        cart["#{name} W/COUPON"][:clearance] = cart[name][:clearance]
           else
             cart[name][:count] > coupon[:num]
        end
        cart[name][:count] -= coupon[:num]
      end  
    end
  cart
end

def apply_clearance(cart)
  cart.each do |name, itm|
    if itm[:clearance] == true 
      new_price = itm[:price] * 0.80
      itm[:price] = new_price.round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  clean_cart = consolidate_cart(cart)
  cheap_cart = apply_coupons(clean_cart, coupons)
  cheapest_cart = apply_clearance(cheap_cart)
  total = 0 
  cheapest_cart.each do |x, g|
    total += g[:price] * g[:count]
  end
  
  total = total * 0.90 if total > 100
  total
end
