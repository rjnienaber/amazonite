private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CopyTagsFromSource
    Volume

    def self.to_json(e : CopyTagsFromSource, json : JSON::Builder) : Nil
      value = case e
              when AEC::CopyTagsFromSource::Volume then "volume"
              else
                raise Exception.new("unknown enum value for 'CopyTagsFromSource' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CopyTagsFromSource
      value = pull.read_string
      case value
      when "volume" then AEC::CopyTagsFromSource::Volume
      else
        raise Exception.new("unknown enum value for 'CopyTagsFromSource' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CopyTagsFromSource::Volume then "volume"
      else
        raise Exception.new("unknown enum value for 'CopyTagsFromSource' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CopyTagsFromSource?
      case key
      when "volume" then AEC::CopyTagsFromSource::Volume
      else
        nil
      end
    end
  end
end
