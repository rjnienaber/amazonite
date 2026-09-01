module Amazonite::Lambda
  # Details about a context that has started.
  class ContextStartedDetails
    include JSON::Serializable

    def initialize
    end

    def validate! : Nil
    end

    def_equals_and_hash()
  end
end
