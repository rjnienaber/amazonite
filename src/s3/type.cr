private alias AS = Amazonite::S3

module Amazonite::S3
  enum Type
    CanonicalUser
    AmazonCustomerByEmail
    Group

    def self.to_json(e : Type, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::Type
      value = pull.read_string
      case value
      when "CanonicalUser"         then AS::Type::CanonicalUser
      when "AmazonCustomerByEmail" then AS::Type::AmazonCustomerByEmail
      when "Group"                 then AS::Type::Group
      else
        raise Exception.new("unknown enum value for 'Type' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::Type?
      case key
      when "CanonicalUser"         then AS::Type::CanonicalUser
      when "AmazonCustomerByEmail" then AS::Type::AmazonCustomerByEmail
      when "Group"                 then AS::Type::Group
      else
        nil
      end
    end
  end
end
