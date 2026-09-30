private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceMetadataOptionsState
    Pending
    Applied

    def self.to_json(e : InstanceMetadataOptionsState, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceMetadataOptionsState::Pending then "pending"
              when AEC::InstanceMetadataOptionsState::Applied then "applied"
              else
                raise Exception.new("unknown enum value for 'InstanceMetadataOptionsState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceMetadataOptionsState
      value = pull.read_string
      case value
      when "pending" then AEC::InstanceMetadataOptionsState::Pending
      when "applied" then AEC::InstanceMetadataOptionsState::Applied
      else
        raise Exception.new("unknown enum value for 'InstanceMetadataOptionsState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceMetadataOptionsState::Pending then "pending"
      when AEC::InstanceMetadataOptionsState::Applied then "applied"
      else
        raise Exception.new("unknown enum value for 'InstanceMetadataOptionsState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceMetadataOptionsState?
      case key
      when "pending" then AEC::InstanceMetadataOptionsState::Pending
      when "applied" then AEC::InstanceMetadataOptionsState::Applied
      else
        nil
      end
    end
  end
end
