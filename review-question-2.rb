class Car

  attr_reader :make, :model

    @@cars = []

  def initialize(make:, model:)
    @make  = make
    @model = model
    @@cars << self
  end

  def drive
    puts "VROOOOOOOOOOOOM!"
  end

  def self.all
    @@cars
  end

end

car = Car.new(make: "volvo", model: "lightening")
car.make
#=> "volvo"
car.model
#=> "ligthening"

car.drive
# => "VROOOOOOOOOOOOM!"

Car.all
#=> [car1, car2, car3]

#BONUS:

#Car.new(make: "volvo", model: "lightening")

car.make
#=> "volvo"
car.model
#=> "ligthening"
