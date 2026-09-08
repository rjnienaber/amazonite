private alias AS = Amazonite::S3

module Amazonite::S3
  enum ObjectAttributes
    ETag
    Checksum
    ObjectParts
    StorageClass
    ObjectSize

    def self.to_json(e : ObjectAttributes, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ObjectAttributes
      value = pull.read_string
      case value
      when "ETag"         then AS::ObjectAttributes::ETag
      when "Checksum"     then AS::ObjectAttributes::Checksum
      when "ObjectParts"  then AS::ObjectAttributes::ObjectParts
      when "StorageClass" then AS::ObjectAttributes::StorageClass
      when "ObjectSize"   then AS::ObjectAttributes::ObjectSize
      else
        raise Exception.new("unknown enum value for 'ObjectAttributes' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::ObjectAttributes?
      case key
      when "ETag"         then AS::ObjectAttributes::ETag
      when "Checksum"     then AS::ObjectAttributes::Checksum
      when "ObjectParts"  then AS::ObjectAttributes::ObjectParts
      when "StorageClass" then AS::ObjectAttributes::StorageClass
      when "ObjectSize"   then AS::ObjectAttributes::ObjectSize
      else
        nil
      end
    end
  end
end
