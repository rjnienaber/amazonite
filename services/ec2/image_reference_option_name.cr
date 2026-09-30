private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ImageReferenceOptionName
    StateName
    VersionDepth

    def self.to_json(e : ImageReferenceOptionName, json : JSON::Builder) : Nil
      value = case e
              when AEC::ImageReferenceOptionName::StateName    then "state-name"
              when AEC::ImageReferenceOptionName::VersionDepth then "version-depth"
              else
                raise Exception.new("unknown enum value for 'ImageReferenceOptionName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ImageReferenceOptionName
      value = pull.read_string
      case value
      when "state-name"    then AEC::ImageReferenceOptionName::StateName
      when "version-depth" then AEC::ImageReferenceOptionName::VersionDepth
      else
        raise Exception.new("unknown enum value for 'ImageReferenceOptionName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ImageReferenceOptionName::StateName    then "state-name"
      when AEC::ImageReferenceOptionName::VersionDepth then "version-depth"
      else
        raise Exception.new("unknown enum value for 'ImageReferenceOptionName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ImageReferenceOptionName?
      case key
      when "state-name"    then AEC::ImageReferenceOptionName::StateName
      when "version-depth" then AEC::ImageReferenceOptionName::VersionDepth
      else
        nil
      end
    end
  end
end
