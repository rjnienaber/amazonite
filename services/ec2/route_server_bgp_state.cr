private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RouteServerBgpState
    Up
    Down

    def self.to_json(e : RouteServerBgpState, json : JSON::Builder) : Nil
      value = case e
              when AEC::RouteServerBgpState::Up   then "up"
              when AEC::RouteServerBgpState::Down then "down"
              else
                raise Exception.new("unknown enum value for 'RouteServerBgpState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RouteServerBgpState
      value = pull.read_string
      case value
      when "up"   then AEC::RouteServerBgpState::Up
      when "down" then AEC::RouteServerBgpState::Down
      else
        raise Exception.new("unknown enum value for 'RouteServerBgpState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::RouteServerBgpState::Up   then "up"
      when AEC::RouteServerBgpState::Down then "down"
      else
        raise Exception.new("unknown enum value for 'RouteServerBgpState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::RouteServerBgpState?
      case key
      when "up"   then AEC::RouteServerBgpState::Up
      when "down" then AEC::RouteServerBgpState::Down
      else
        nil
      end
    end
  end
end
