private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RouteServerPersistRoutesState
    Enabling
    Enabled
    Resetting
    Disabling
    Disabled
    Modifying

    def self.to_json(e : RouteServerPersistRoutesState, json : JSON::Builder) : Nil
      value = case e
              when AEC::RouteServerPersistRoutesState::Enabling  then "enabling"
              when AEC::RouteServerPersistRoutesState::Enabled   then "enabled"
              when AEC::RouteServerPersistRoutesState::Resetting then "resetting"
              when AEC::RouteServerPersistRoutesState::Disabling then "disabling"
              when AEC::RouteServerPersistRoutesState::Disabled  then "disabled"
              when AEC::RouteServerPersistRoutesState::Modifying then "modifying"
              else
                raise Exception.new("unknown enum value for 'RouteServerPersistRoutesState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RouteServerPersistRoutesState
      value = pull.read_string
      case value
      when "enabling"  then AEC::RouteServerPersistRoutesState::Enabling
      when "enabled"   then AEC::RouteServerPersistRoutesState::Enabled
      when "resetting" then AEC::RouteServerPersistRoutesState::Resetting
      when "disabling" then AEC::RouteServerPersistRoutesState::Disabling
      when "disabled"  then AEC::RouteServerPersistRoutesState::Disabled
      when "modifying" then AEC::RouteServerPersistRoutesState::Modifying
      else
        raise Exception.new("unknown enum value for 'RouteServerPersistRoutesState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::RouteServerPersistRoutesState::Enabling  then "enabling"
      when AEC::RouteServerPersistRoutesState::Enabled   then "enabled"
      when AEC::RouteServerPersistRoutesState::Resetting then "resetting"
      when AEC::RouteServerPersistRoutesState::Disabling then "disabling"
      when AEC::RouteServerPersistRoutesState::Disabled  then "disabled"
      when AEC::RouteServerPersistRoutesState::Modifying then "modifying"
      else
        raise Exception.new("unknown enum value for 'RouteServerPersistRoutesState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::RouteServerPersistRoutesState?
      case key
      when "enabling"  then AEC::RouteServerPersistRoutesState::Enabling
      when "enabled"   then AEC::RouteServerPersistRoutesState::Enabled
      when "resetting" then AEC::RouteServerPersistRoutesState::Resetting
      when "disabling" then AEC::RouteServerPersistRoutesState::Disabling
      when "disabled"  then AEC::RouteServerPersistRoutesState::Disabled
      when "modifying" then AEC::RouteServerPersistRoutesState::Modifying
      else
        nil
      end
    end
  end
end
