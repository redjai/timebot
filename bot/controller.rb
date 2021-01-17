require 'pokebot/lambda/event'

EVENTS = [Pokebot::Lambda::Event::MESSAGE_RECEIVED] 

def handle(event:, context:)
  puts event

  Pokebot::Lambda::Event.each_sqs_record_pokebot_event(aws_event: event, accept: EVENTS) do |pokebot_event|
    require 'pokebot/service/controller'
    Pokebot::Service::Controller.call(pokebot_event)
  end 
end
