private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum CapacityProviderState
    Pending
    Active
    Failed
    Deleting

    def self.to_json(e : CapacityProviderState, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::CapacityProviderState
      value = pull.read_string
      case value
      when "Pending"  then AL::CapacityProviderState::Pending
      when "Active"   then AL::CapacityProviderState::Active
      when "Failed"   then AL::CapacityProviderState::Failed
      when "Deleting" then AL::CapacityProviderState::Deleting
      else
        raise Exception.new("unknown enum value for 'CapacityProviderState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::CapacityProviderState?
      case key
      when "Pending"  then AL::CapacityProviderState::Pending
      when "Active"   then AL::CapacityProviderState::Active
      when "Failed"   then AL::CapacityProviderState::Failed
      when "Deleting" then AL::CapacityProviderState::Deleting
      else
        nil
      end
    end
  end
end
