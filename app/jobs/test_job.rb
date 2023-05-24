class TestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    sleep 3

    puts 'carregando'
  end
end
