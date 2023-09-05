class MyFirstJob
  include Sidekiq::Job

  def perform(name,age)
    # Do something
    puts "My name is #{name} age is #{age}"
  end
end
