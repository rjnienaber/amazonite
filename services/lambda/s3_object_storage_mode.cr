private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  # The method Lambda uses to store a function's deployment package — either by copying the package
  # into Lambda-managed storage (`COPY`) or by referencing it directly from the source Amazon S3
  # bucket (`REFERENCE`).
  enum S3ObjectStorageMode
    Copy
    Reference

    def self.to_json(e : S3ObjectStorageMode, json : JSON::Builder) : Nil
      value = case e
              when AL::S3ObjectStorageMode::Copy      then "COPY"
              when AL::S3ObjectStorageMode::Reference then "REFERENCE"
              else
                raise Exception.new("unknown enum value for 'S3ObjectStorageMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::S3ObjectStorageMode
      value = pull.read_string
      case value
      when "COPY"      then AL::S3ObjectStorageMode::Copy
      when "REFERENCE" then AL::S3ObjectStorageMode::Reference
      else
        raise Exception.new("unknown enum value for 'S3ObjectStorageMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::S3ObjectStorageMode::Copy      then "COPY"
      when AL::S3ObjectStorageMode::Reference then "REFERENCE"
      else
        raise Exception.new("unknown enum value for 'S3ObjectStorageMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::S3ObjectStorageMode?
      case key
      when "COPY"      then AL::S3ObjectStorageMode::Copy
      when "REFERENCE" then AL::S3ObjectStorageMode::Reference
      else
        nil
      end
    end
  end
end
