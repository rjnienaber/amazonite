private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum State
    Pending
    Active
    Inactive
    Failed
    Deactivating
    Deactivated
    ActiveNonInvocable
    Deleting

    def self.to_json(e : State, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::State
      value = pull.read_string
      case value
      when "Pending"            then AL::State::Pending
      when "Active"             then AL::State::Active
      when "Inactive"           then AL::State::Inactive
      when "Failed"             then AL::State::Failed
      when "Deactivating"       then AL::State::Deactivating
      when "Deactivated"        then AL::State::Deactivated
      when "ActiveNonInvocable" then AL::State::ActiveNonInvocable
      when "Deleting"           then AL::State::Deleting
      else
        raise Exception.new("unknown enum value for 'State' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::State?
      case key
      when "Pending"            then AL::State::Pending
      when "Active"             then AL::State::Active
      when "Inactive"           then AL::State::Inactive
      when "Failed"             then AL::State::Failed
      when "Deactivating"       then AL::State::Deactivating
      when "Deactivated"        then AL::State::Deactivated
      when "ActiveNonInvocable" then AL::State::ActiveNonInvocable
      when "Deleting"           then AL::State::Deleting
      else
        nil
      end
    end
  end
end
