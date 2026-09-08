private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum LaunchTemplateInstanceMetadataTagsState
    Disabled
    Enabled

    def self.to_json(e : LaunchTemplateInstanceMetadataTagsState, json : JSON::Builder) : Nil
      value = case e
              when AEC::LaunchTemplateInstanceMetadataTagsState::Disabled then "disabled"
              when AEC::LaunchTemplateInstanceMetadataTagsState::Enabled  then "enabled"
              else
                raise Exception.new("unknown enum value for 'LaunchTemplateInstanceMetadataTagsState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::LaunchTemplateInstanceMetadataTagsState
      value = pull.read_string
      case value
      when "disabled" then AEC::LaunchTemplateInstanceMetadataTagsState::Disabled
      when "enabled"  then AEC::LaunchTemplateInstanceMetadataTagsState::Enabled
      else
        raise Exception.new("unknown enum value for 'LaunchTemplateInstanceMetadataTagsState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::LaunchTemplateInstanceMetadataTagsState::Disabled then "disabled"
      when AEC::LaunchTemplateInstanceMetadataTagsState::Enabled  then "enabled"
      else
        raise Exception.new("unknown enum value for 'LaunchTemplateInstanceMetadataTagsState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::LaunchTemplateInstanceMetadataTagsState?
      case key
      when "disabled" then AEC::LaunchTemplateInstanceMetadataTagsState::Disabled
      when "enabled"  then AEC::LaunchTemplateInstanceMetadataTagsState::Enabled
      else
        nil
      end
    end
  end
end
