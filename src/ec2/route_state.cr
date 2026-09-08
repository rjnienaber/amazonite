private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RouteState
    Active
    Blackhole
    Filtered

    def self.to_json(e : RouteState, json : JSON::Builder) : Nil
      value = case e
              when AEC::RouteState::Active    then "active"
              when AEC::RouteState::Blackhole then "blackhole"
              when AEC::RouteState::Filtered  then "filtered"
              else
                raise Exception.new("unknown enum value for 'RouteState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RouteState
      value = pull.read_string
      case value
      when "active"    then AEC::RouteState::Active
      when "blackhole" then AEC::RouteState::Blackhole
      when "filtered"  then AEC::RouteState::Filtered
      else
        raise Exception.new("unknown enum value for 'RouteState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::RouteState::Active    then "active"
      when AEC::RouteState::Blackhole then "blackhole"
      when AEC::RouteState::Filtered  then "filtered"
      else
        raise Exception.new("unknown enum value for 'RouteState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::RouteState?
      case key
      when "active"    then AEC::RouteState::Active
      when "blackhole" then AEC::RouteState::Blackhole
      when "filtered"  then AEC::RouteState::Filtered
      else
        nil
      end
    end
  end
end
