private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DatafeedSubscriptionState
    Active
    Inactive

    def self.to_json(e : DatafeedSubscriptionState, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DatafeedSubscriptionState
      value = pull.read_string
      case value
      when "Active"   then AEC::DatafeedSubscriptionState::Active
      when "Inactive" then AEC::DatafeedSubscriptionState::Inactive
      else
        raise Exception.new("unknown enum value for 'DatafeedSubscriptionState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AEC::DatafeedSubscriptionState?
      case key
      when "Active"   then AEC::DatafeedSubscriptionState::Active
      when "Inactive" then AEC::DatafeedSubscriptionState::Inactive
      else
        nil
      end
    end
  end
end
