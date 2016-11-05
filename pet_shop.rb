def pet_shop_name(pet_shop_hash)
  return pet_shop_hash[:name]
end

def total_cash(pet_shop_hash)
  return pet_shop_hash[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop_hash, amount)
  pet_shop_hash[:admin][:total_cash] += amount
end

def pets_sold(pet_shop_hash)
  pet_shop_hash[:pets_sold] ||= 0
  return pet_shop_hash[:pets_sold]
end

def increase_pets_sold(pet_shop_hash, number_sold)
  pets_sold(pet_shop_hash)
  pet_shop_hash[:pets_sold] += number_sold
end

def stock_count(pet_shop_hash)
  stock = pet_shop_hash[:pets].length - pets_sold(pet_shop_hash)
  return stock
end

def pets_by_breed(pet_shop_hash, breed_to_check)

  stock_of_breed = []

  pet_shop_hash[:pets].each do |pet|
    if pet[:breed] == breed_to_check
      stock_of_breed << pet
    end
  end

  return stock_of_breed
end

def find_pet_by_name(pet_shop_hash, pet_name)

  pet_shop_hash[:pets].each do |pet|
    if pet[:name] == pet_name
      return pet
    end
  end

  return nil
end

def remove_pet_by_name(pet_shop_hash, pet_name)

  pet_shop_hash[:pets].each do |pet|
    if pet[:name] == pet_name
      pet_shop_hash[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop_hash, new_pet)
  pet_shop_hash[:pets] << new_pet
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, new_pet)
  return customer[:cash] >= new_pet[:price] ? true : false
end

def sell_pet_to_customer(pet_shop_hash, pet, customer)
  if pet != nil && customer[:cash] >= pet[:price]
    remove_pet_by_name(pet_shop_hash, pet[:name])
    add_pet_to_customer(customer, pet)
    increase_pets_sold(pet_shop_hash, 1)
    add_or_remove_cash(pet_shop_hash, pet[:price])
  end
end


