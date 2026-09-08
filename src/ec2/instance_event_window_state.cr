private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceEventWindowState
    Creating
    Deleting
    Active
    Deleted

    def self.to_json(e : InstanceEventWindowState, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceEventWindowState::Creating then "creating"
              when AEC::InstanceEventWindowState::Deleting then "deleting"
              when AEC::InstanceEventWindowState::Active   then "active"
              when AEC::InstanceEventWindowState::Deleted  then "deleted"
              else
                raise Exception.new("unknown enum value for 'InstanceEventWindowState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceEventWindowState
      value = pull.read_string
      case value
      when "creating" then AEC::InstanceEventWindowState::Creating
      when "deleting" then AEC::InstanceEventWindowState::Deleting
      when "active"   then AEC::InstanceEventWindowState::Active
      when "deleted"  then AEC::InstanceEventWindowState::Deleted
      else
        raise Exception.new("unknown enum value for 'InstanceEventWindowState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceEventWindowState::Creating then "creating"
      when AEC::InstanceEventWindowState::Deleting then "deleting"
      when AEC::InstanceEventWindowState::Active   then "active"
      when AEC::InstanceEventWindowState::Deleted  then "deleted"
      else
        raise Exception.new("unknown enum value for 'InstanceEventWindowState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceEventWindowState?
      case key
      when "creating" then AEC::InstanceEventWindowState::Creating
      when "deleting" then AEC::InstanceEventWindowState::Deleting
      when "active"   then AEC::InstanceEventWindowState::Active
      when "deleted"  then AEC::InstanceEventWindowState::Deleted
      else
        nil
      end
    end
  end
end
