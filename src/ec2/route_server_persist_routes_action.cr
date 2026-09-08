private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RouteServerPersistRoutesAction
    Enable
    Disable
    Reset

    def self.to_json(e : RouteServerPersistRoutesAction, json : JSON::Builder) : Nil
      value = case e
              when AEC::RouteServerPersistRoutesAction::Enable  then "enable"
              when AEC::RouteServerPersistRoutesAction::Disable then "disable"
              when AEC::RouteServerPersistRoutesAction::Reset   then "reset"
              else
                raise Exception.new("unknown enum value for 'RouteServerPersistRoutesAction' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RouteServerPersistRoutesAction
      value = pull.read_string
      case value
      when "enable"  then AEC::RouteServerPersistRoutesAction::Enable
      when "disable" then AEC::RouteServerPersistRoutesAction::Disable
      when "reset"   then AEC::RouteServerPersistRoutesAction::Reset
      else
        raise Exception.new("unknown enum value for 'RouteServerPersistRoutesAction' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::RouteServerPersistRoutesAction::Enable  then "enable"
      when AEC::RouteServerPersistRoutesAction::Disable then "disable"
      when AEC::RouteServerPersistRoutesAction::Reset   then "reset"
      else
        raise Exception.new("unknown enum value for 'RouteServerPersistRoutesAction' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::RouteServerPersistRoutesAction?
      case key
      when "enable"  then AEC::RouteServerPersistRoutesAction::Enable
      when "disable" then AEC::RouteServerPersistRoutesAction::Disable
      when "reset"   then AEC::RouteServerPersistRoutesAction::Reset
      else
        nil
      end
    end
  end
end
