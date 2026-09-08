private alias AS = Amazonite::S3

module Amazonite::S3
  enum ChecksumType
    Composite
    FullObject

    def self.to_json(e : ChecksumType, json : JSON::Builder) : Nil
      value = case e
              when AS::ChecksumType::Composite  then "COMPOSITE"
              when AS::ChecksumType::FullObject then "FULL_OBJECT"
              else
                raise Exception.new("unknown enum value for 'ChecksumType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ChecksumType
      value = pull.read_string
      case value
      when "COMPOSITE"   then AS::ChecksumType::Composite
      when "FULL_OBJECT" then AS::ChecksumType::FullObject
      else
        raise Exception.new("unknown enum value for 'ChecksumType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ChecksumType::Composite  then "COMPOSITE"
      when AS::ChecksumType::FullObject then "FULL_OBJECT"
      else
        raise Exception.new("unknown enum value for 'ChecksumType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ChecksumType?
      case key
      when "COMPOSITE"   then AS::ChecksumType::Composite
      when "FULL_OBJECT" then AS::ChecksumType::FullObject
      else
        nil
      end
    end
  end
end
