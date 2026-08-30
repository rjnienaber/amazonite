module Amazonite::SsmV1
  # Whether or not the command was successfully canceled. There is no guarantee that a request can
  # be canceled.
  class CancelCommandResult
    include JSON::Serializable

    def initialize
    end

    def validate! : Nil
    end

    def_equals_and_hash()
  end
end
