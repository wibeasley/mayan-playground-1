print("------replicating coins & a thieving raven------")
print(10 * 365) #=3650: Ten coins are replicated for 365 days (1 year)
print(20 + 3650) #=3670: The count of original coins, plus the replicated ones
print(3 * 52) #=156: Three coins stolen each week, for 52 weeks (1 year)

print(3670 - 156) #3514: The count of original & replicated coins, minus the raven's loot.
print((20 + (10 * 365)) - (3 * 52)) #The same as above, but nested calculations

print("-------------------------fred & john variables-------------------------")
fred=100
print(fred)
print("fred")

fred=200
print(fred)
john=fred
print("john")

number_of_coins=200
print(number_of_coins)
print("number_of_coins: " + str(number_of_coins))

print("------coins again, but with variables------")
# The original amount
found_coins = 20
magic_coins_per_day = 10 #Count of coins replicated in each batch
stolen_coins_per_week = 3
remaining_coins = found_coins + (magic_coins_per_day * 365) - (stolen_coins_per_week * 52) 
print(remaining_coins)

#The amount with a scarecrow
stolen_coins_per_week = 2
remaining_coins = found_coins + (magic_coins_per_day * 365) - (stolen_coins_per_week * 52) 
print(remaining_coins)

#The amount with a scarecrow and banging the invention
magic_coins_per_day = 10 + 3 #New count of coins replicated in each batch
remaining_coins = found_coins + (magic_coins_per_day * 365) - (stolen_coins_per_week * 52) 
print(remaining_coins)
number_of_coins
