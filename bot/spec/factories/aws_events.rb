require_relative 'slack_events/favourites_interaction_aws_event'
require_relative 'slack_events/more_results_interaction_event'
require_relative 'slack_events/recipe_search_api_event'

FactoryBot.define do
  
  factory :aws_records_event, class: Hash do
    transient do
      bot_request { build(:bot_request) }
    end
    body { { "Records" => [
                            { 
                              "body" => {
                                'Message' => bot_request.to_json
                              }.to_json
                            }
                           ] } }
    initialize_with {  body  }
  end

  factory :slack_api_request_aws_event, class: Hash do
    user { 'U-SLACK-TEST-USER123' }
    channel { 'C-SLACK-TEST-CHANNEL456' }
    text { "<#{user}> slack api text"  }
    initialize_with{ slack_aws_event(attributes) }
  end
  
  factory :slack_favourites_interaction_event, class: Hash do
    initialize_with{ slack_favourites_interaction_event }
  end

  factory :slack_more_results_interaction_event, class: Hash do
    initialize_with{ slack_more_results_interaction_event }
  end

  factory :slack_recipe_search_event, class: Hash do
    initialize_with{ recipe_search_api_event }
  end

  factory :slack_challenge_event, class: Hash do
    challenge { 'slack-challenge-1234' }
    user { 'U-SLACK-TEST-USER123' }
    channel { 'C-SLACK-TEST-CHANNEL456' }
    initialize_with{ slack_challenge_event(attributes) }
  end
end

def slack_challenge_event(**args)
  {
    'body' => {
      'challenge' => args[:challenge],
       event: {
         user: args[:user],
         channel: args[:channel],
         text: args[:text]
       }
    }.to_json
  }
end
 
def slack_aws_event(**args)
  {
    'body' => {
       event: {
         user: args[:user],
         channel: args[:channel],
         text: args[:text]
       }
    }.to_json
  }
end
