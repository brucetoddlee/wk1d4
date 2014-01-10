require 'pry'

class Person
	attr_accessor :name, :stomach, :allergies

	def initialize(name, stomach=[], allergies=[])
		@name = name
		@stomach = stomach
		@allergies = allergies
	end

	def eat(food)
		begin
			if (food & @allergies) != []
  				raise AllergyError.new
  			else
      			@stomach += food
      			puts "#{@name} enjoyed that."
  			end
  		rescue AllergyError => my_error
  			@stomach.pop
  			puts "#{@name} is allergic to #{(food & @allergies)}!"
  			# binding.pry
		end
	end
end

class AllergyError < RuntimeError
end

pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

p1 = Person.new("Chris", [], ["gluten"])
p2 = Person.new("Beth", [], ["scallops"])

p1.eat(pizza)
p1.eat(pan_seared_scallops)
p1.eat(water)

p2.eat(pizza)
p2.eat(pan_seared_scallops)
p2.eat(water)


