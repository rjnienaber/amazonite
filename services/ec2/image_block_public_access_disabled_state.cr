private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ImageBlockPublicAccessDisabledState
    Unblocked

    def self.to_json(e : ImageBlockPublicAccessDisabledState, json : JSON::Builder) : Nil
      value = case e
              when AEC::ImageBlockPublicAccessDisabledState::Unblocked then "unblocked"
              else
                raise Exception.new("unknown enum value for 'ImageBlockPublicAccessDisabledState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ImageBlockPublicAccessDisabledState
      value = pull.read_string
      case value
      when "unblocked" then AEC::ImageBlockPublicAccessDisabledState::Unblocked
      else
        raise Exception.new("unknown enum value for 'ImageBlockPublicAccessDisabledState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ImageBlockPublicAccessDisabledState::Unblocked then "unblocked"
      else
        raise Exception.new("unknown enum value for 'ImageBlockPublicAccessDisabledState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ImageBlockPublicAccessDisabledState?
      case key
      when "unblocked" then AEC::ImageBlockPublicAccessDisabledState::Unblocked
      else
        nil
      end
    end
  end
end
