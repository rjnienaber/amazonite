private alias AEB = Amazonite::EventBridge

module Amazonite::EventBridge
  enum ReplicationState
    Enabled
    Disabled

    def self.to_json(e : ReplicationState, json : JSON::Builder) : Nil
      value = case e
              when AEB::ReplicationState::Enabled  then "ENABLED"
              when AEB::ReplicationState::Disabled then "DISABLED"
              else
                raise Exception.new("unknown enum value for 'ReplicationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEB::ReplicationState
      value = pull.read_string
      case value
      when "ENABLED"  then AEB::ReplicationState::Enabled
      when "DISABLED" then AEB::ReplicationState::Disabled
      else
        raise Exception.new("unknown enum value for 'ReplicationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEB::ReplicationState::Enabled  then "ENABLED"
      when AEB::ReplicationState::Disabled then "DISABLED"
      else
        raise Exception.new("unknown enum value for 'ReplicationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEB::ReplicationState?
      case key
      when "ENABLED"  then AEB::ReplicationState::Enabled
      when "DISABLED" then AEB::ReplicationState::Disabled
      else
        nil
      end
    end
  end
end
