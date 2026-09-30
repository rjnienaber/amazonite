private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpnState
    Pending
    Available
    Deleting
    Deleted

    def self.to_json(e : VpnState, json : JSON::Builder) : Nil
      value = case e
              when AEC::VpnState::Pending   then "pending"
              when AEC::VpnState::Available then "available"
              when AEC::VpnState::Deleting  then "deleting"
              when AEC::VpnState::Deleted   then "deleted"
              else
                raise Exception.new("unknown enum value for 'VpnState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpnState
      value = pull.read_string
      case value
      when "pending"   then AEC::VpnState::Pending
      when "available" then AEC::VpnState::Available
      when "deleting"  then AEC::VpnState::Deleting
      when "deleted"   then AEC::VpnState::Deleted
      else
        raise Exception.new("unknown enum value for 'VpnState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VpnState::Pending   then "pending"
      when AEC::VpnState::Available then "available"
      when AEC::VpnState::Deleting  then "deleting"
      when AEC::VpnState::Deleted   then "deleted"
      else
        raise Exception.new("unknown enum value for 'VpnState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VpnState?
      case key
      when "pending"   then AEC::VpnState::Pending
      when "available" then AEC::VpnState::Available
      when "deleting"  then AEC::VpnState::Deleting
      when "deleted"   then AEC::VpnState::Deleted
      else
        nil
      end
    end
  end
end
