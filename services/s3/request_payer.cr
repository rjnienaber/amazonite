private alias AS = Amazonite::S3

module Amazonite::S3
  # Confirms that the requester knows that they will be charged for the request. Bucket owners need
  # not specify this parameter in their requests. If either the source or destination S3 bucket has
  # Requester Pays enabled, the requester will pay for the corresponding charges. For information
  # about downloading objects from Requester Pays buckets, see [Downloading Objects in Requester
  # Pays
  # Buckets](https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html) in
  # the *Amazon S3 User Guide*.
  #
  # This functionality is not supported for directory buckets.
  enum RequestPayer
    Requester

    def self.to_json(e : RequestPayer, json : JSON::Builder) : Nil
      value = case e
              when AS::RequestPayer::Requester then "requester"
              else
                raise Exception.new("unknown enum value for 'RequestPayer' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::RequestPayer
      value = pull.read_string
      case value
      when "requester" then AS::RequestPayer::Requester
      else
        raise Exception.new("unknown enum value for 'RequestPayer' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::RequestPayer::Requester then "requester"
      else
        raise Exception.new("unknown enum value for 'RequestPayer' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::RequestPayer?
      case key
      when "requester" then AS::RequestPayer::Requester
      else
        nil
      end
    end
  end
end
