private alias AS = Amazonite::S3

module Amazonite::S3
  enum S3TablesBucketType
    Aws
    Customer

    def self.to_json(e : S3TablesBucketType, json : JSON::Builder) : Nil
      value = case e
              when AS::S3TablesBucketType::Aws      then "aws"
              when AS::S3TablesBucketType::Customer then "customer"
              else
                raise Exception.new("unknown enum value for 'S3TablesBucketType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::S3TablesBucketType
      value = pull.read_string
      case value
      when "aws"      then AS::S3TablesBucketType::Aws
      when "customer" then AS::S3TablesBucketType::Customer
      else
        raise Exception.new("unknown enum value for 'S3TablesBucketType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::S3TablesBucketType::Aws      then "aws"
      when AS::S3TablesBucketType::Customer then "customer"
      else
        raise Exception.new("unknown enum value for 'S3TablesBucketType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::S3TablesBucketType?
      case key
      when "aws"      then AS::S3TablesBucketType::Aws
      when "customer" then AS::S3TablesBucketType::Customer
      else
        nil
      end
    end
  end
end
