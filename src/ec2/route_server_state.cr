private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RouteServerState
    Pending
    Available
    Modifying
    Deleting
    Deleted

    def self.to_json(e : RouteServerState, json : JSON::Builder) : Nil
      value = case e
              when AEC::RouteServerState::Pending   then "pending"
              when AEC::RouteServerState::Available then "available"
              when AEC::RouteServerState::Modifying then "modifying"
              when AEC::RouteServerState::Deleting  then "deleting"
              when AEC::RouteServerState::Deleted   then "deleted"
              else
                raise Exception.new("unknown enum value for 'RouteServerState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RouteServerState
      value = pull.read_string
      case value
      when "pending"   then AEC::RouteServerState::Pending
      when "available" then AEC::RouteServerState::Available
      when "modifying" then AEC::RouteServerState::Modifying
      when "deleting"  then AEC::RouteServerState::Deleting
      when "deleted"   then AEC::RouteServerState::Deleted
      else
        raise Exception.new("unknown enum value for 'RouteServerState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::RouteServerState::Pending   then "pending"
      when AEC::RouteServerState::Available then "available"
      when AEC::RouteServerState::Modifying then "modifying"
      when AEC::RouteServerState::Deleting  then "deleting"
      when AEC::RouteServerState::Deleted   then "deleted"
      else
        raise Exception.new("unknown enum value for 'RouteServerState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::RouteServerState?
      case key
      when "pending"   then AEC::RouteServerState::Pending
      when "available" then AEC::RouteServerState::Available
      when "modifying" then AEC::RouteServerState::Modifying
      when "deleting"  then AEC::RouteServerState::Deleting
      when "deleted"   then AEC::RouteServerState::Deleted
      else
        nil
      end
    end
  end
end
