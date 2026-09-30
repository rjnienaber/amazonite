private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DefaultInstanceMetadataTagsState
    Disabled
    Enabled
    NoPreference

    def self.to_json(e : DefaultInstanceMetadataTagsState, json : JSON::Builder) : Nil
      value = case e
              when AEC::DefaultInstanceMetadataTagsState::Disabled     then "disabled"
              when AEC::DefaultInstanceMetadataTagsState::Enabled      then "enabled"
              when AEC::DefaultInstanceMetadataTagsState::NoPreference then "no-preference"
              else
                raise Exception.new("unknown enum value for 'DefaultInstanceMetadataTagsState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DefaultInstanceMetadataTagsState
      value = pull.read_string
      case value
      when "disabled"      then AEC::DefaultInstanceMetadataTagsState::Disabled
      when "enabled"       then AEC::DefaultInstanceMetadataTagsState::Enabled
      when "no-preference" then AEC::DefaultInstanceMetadataTagsState::NoPreference
      else
        raise Exception.new("unknown enum value for 'DefaultInstanceMetadataTagsState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::DefaultInstanceMetadataTagsState::Disabled     then "disabled"
      when AEC::DefaultInstanceMetadataTagsState::Enabled      then "enabled"
      when AEC::DefaultInstanceMetadataTagsState::NoPreference then "no-preference"
      else
        raise Exception.new("unknown enum value for 'DefaultInstanceMetadataTagsState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::DefaultInstanceMetadataTagsState?
      case key
      when "disabled"      then AEC::DefaultInstanceMetadataTagsState::Disabled
      when "enabled"       then AEC::DefaultInstanceMetadataTagsState::Enabled
      when "no-preference" then AEC::DefaultInstanceMetadataTagsState::NoPreference
      else
        nil
      end
    end
  end
end
