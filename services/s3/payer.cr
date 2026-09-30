private alias AS = Amazonite::S3

module Amazonite::S3
  enum Payer
    Requester
    BucketOwner

    def self.to_json(e : Payer, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::Payer
      value = pull.read_string
      case value
      when "Requester"   then AS::Payer::Requester
      when "BucketOwner" then AS::Payer::BucketOwner
      else
        raise Exception.new("unknown enum value for 'Payer' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::Payer?
      case key
      when "Requester"   then AS::Payer::Requester
      when "BucketOwner" then AS::Payer::BucketOwner
      else
        nil
      end
    end
  end
end
