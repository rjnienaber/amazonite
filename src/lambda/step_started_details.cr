module Amazonite::Lambda
  # Details about a step that has started.
  class StepStartedDetails
    include JSON::Serializable

    def initialize
    end

    def validate! : Nil
    end

    def_equals_and_hash()
  end
end
