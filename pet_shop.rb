def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash (pet_shop, cash)
  total_cash = pet_shop[:admin][:total_cash] += cash
  # p total_cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, amount)
  return pet_shop[:admin][:pets_sold] += amount
end

def stock_count(pet_shop)
  return pet_shop[:pets].size
end

def pets_by_breed(pet_shop, breed)
  returned_pets = []
   for pet in pet_shop[:pets]
     if pet[:breed] == breed
       returned_pets << pet
     end
   end
   return returned_pets
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
   pet = find_pet_by_name(pet_shop, name)
   pet_shop[:pets].delete(pet)
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, cash)
  customer[:cash] -= cash
end

def customer_pet_count(customer)
  return customer[:pets].size
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  end
  return false
end

def sell_pet_to_customer(pet_shop, pet, customer)
  add_pet_to_customer(customer, pet)
  remove_pet_by_name(pet_shop, name)
  increase_pets_sold(pet_shop, 1)
  price = pet[:price]
  remove_customer_cash(customer, price)
  add_or_remove_cash(pet_shop, price)
end
