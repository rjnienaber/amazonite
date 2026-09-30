private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceMetadataTagsState
    Disabled
    Enabled

    def self.to_json(e : InstanceMetadataTagsState, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceMetadataTagsState::Disabled then "disabled"
              when AEC::InstanceMetadataTagsState::Enabled  then "enabled"
              else
                raise Exception.new("unknown enum value for 'InstanceMetadataTagsState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceMetadataTagsState
      value = pull.read_string
      case value
      when "disabled" then AEC::InstanceMetadataTagsState::Disabled
      when "enabled"  then AEC::InstanceMetadataTagsState::Enabled
      else
        raise Exception.new("unknown enum value for 'InstanceMetadataTagsState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceMetadataTagsState::Disabled then "disabled"
      when AEC::InstanceMetadataTagsState::Enabled  then "enabled"
      else
        raise Exception.new("unknown enum value for 'InstanceMetadataTagsState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceMetadataTagsState?
      case key
      when "disabled" then AEC::InstanceMetadataTagsState::Disabled
      when "enabled"  then AEC::InstanceMetadataTagsState::Enabled
      else
        nil
      end
    end
  end
end
