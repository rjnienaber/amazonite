private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RouteServerPropagationState
    Pending
    Available
    Deleting

    def self.to_json(e : RouteServerPropagationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::RouteServerPropagationState::Pending   then "pending"
              when AEC::RouteServerPropagationState::Available then "available"
              when AEC::RouteServerPropagationState::Deleting  then "deleting"
              else
                raise Exception.new("unknown enum value for 'RouteServerPropagationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RouteServerPropagationState
      value = pull.read_string
      case value
      when "pending"   then AEC::RouteServerPropagationState::Pending
      when "available" then AEC::RouteServerPropagationState::Available
      when "deleting"  then AEC::RouteServerPropagationState::Deleting
      else
        raise Exception.new("unknown enum value for 'RouteServerPropagationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::RouteServerPropagationState::Pending   then "pending"
      when AEC::RouteServerPropagationState::Available then "available"
      when AEC::RouteServerPropagationState::Deleting  then "deleting"
      else
        raise Exception.new("unknown enum value for 'RouteServerPropagationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::RouteServerPropagationState?
      case key
      when "pending"   then AEC::RouteServerPropagationState::Pending
      when "available" then AEC::RouteServerPropagationState::Available
      when "deleting"  then AEC::RouteServerPropagationState::Deleting
      else
        nil
      end
    end
  end
end
