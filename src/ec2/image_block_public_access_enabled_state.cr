private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ImageBlockPublicAccessEnabledState
    BlockNewSharing

    def self.to_json(e : ImageBlockPublicAccessEnabledState, json : JSON::Builder) : Nil
      value = case e
              when AEC::ImageBlockPublicAccessEnabledState::BlockNewSharing then "block-new-sharing"
              else
                raise Exception.new("unknown enum value for 'ImageBlockPublicAccessEnabledState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ImageBlockPublicAccessEnabledState
      value = pull.read_string
      case value
      when "block-new-sharing" then AEC::ImageBlockPublicAccessEnabledState::BlockNewSharing
      else
        raise Exception.new("unknown enum value for 'ImageBlockPublicAccessEnabledState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ImageBlockPublicAccessEnabledState::BlockNewSharing then "block-new-sharing"
      else
        raise Exception.new("unknown enum value for 'ImageBlockPublicAccessEnabledState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ImageBlockPublicAccessEnabledState?
      case key
      when "block-new-sharing" then AEC::ImageBlockPublicAccessEnabledState::BlockNewSharing
      else
        nil
      end
    end
  end
end
