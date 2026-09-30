private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RouteServerBfdState
    Up
    Down

    def self.to_json(e : RouteServerBfdState, json : JSON::Builder) : Nil
      value = case e
              when AEC::RouteServerBfdState::Up   then "up"
              when AEC::RouteServerBfdState::Down then "down"
              else
                raise Exception.new("unknown enum value for 'RouteServerBfdState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RouteServerBfdState
      value = pull.read_string
      case value
      when "up"   then AEC::RouteServerBfdState::Up
      when "down" then AEC::RouteServerBfdState::Down
      else
        raise Exception.new("unknown enum value for 'RouteServerBfdState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::RouteServerBfdState::Up   then "up"
      when AEC::RouteServerBfdState::Down then "down"
      else
        raise Exception.new("unknown enum value for 'RouteServerBfdState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::RouteServerBfdState?
      case key
      when "up"   then AEC::RouteServerBfdState::Up
      when "down" then AEC::RouteServerBfdState::Down
      else
        nil
      end
    end
  end
end
