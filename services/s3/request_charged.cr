private alias AS = Amazonite::S3

module Amazonite::S3
  # If present, indicates that the requester was successfully charged for the request. For more
  # information, see [Using Requester Pays buckets for storage transfers and
  # usage](https://docs.aws.amazon.com/AmazonS3/latest/userguide/RequesterPaysBuckets.html) in the
  # *Amazon Simple Storage Service user guide*.
  #
  # This functionality is not supported for directory buckets.
  enum RequestCharged
    Requester

    def self.to_json(e : RequestCharged, json : JSON::Builder) : Nil
      value = case e
              when AS::RequestCharged::Requester then "requester"
              else
                raise Exception.new("unknown enum value for 'RequestCharged' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::RequestCharged
      value = pull.read_string
      case value
      when "requester" then AS::RequestCharged::Requester
      else
        raise Exception.new("unknown enum value for 'RequestCharged' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::RequestCharged::Requester then "requester"
      else
        raise Exception.new("unknown enum value for 'RequestCharged' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::RequestCharged?
      case key
      when "requester" then AS::RequestCharged::Requester
      else
        nil
      end
    end
  end
end
