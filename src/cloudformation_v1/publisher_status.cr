private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum PublisherStatus
    Verified
    Unverified

    def self.to_json(e : PublisherStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::PublisherStatus::Verified   then "VERIFIED"
              when ACF::PublisherStatus::Unverified then "UNVERIFIED"
              else
                raise Exception.new("unknown enum value for 'PublisherStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::PublisherStatus
      value = pull.read_string
      case value
      when "VERIFIED"   then ACF::PublisherStatus::Verified
      when "UNVERIFIED" then ACF::PublisherStatus::Unverified
      else
        raise Exception.new("unknown enum value for 'PublisherStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::PublisherStatus::Verified   then "VERIFIED"
      when ACF::PublisherStatus::Unverified then "UNVERIFIED"
      else
        raise Exception.new("unknown enum value for 'PublisherStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::PublisherStatus?
      case key
      when "VERIFIED"   then ACF::PublisherStatus::Verified
      when "UNVERIFIED" then ACF::PublisherStatus::Unverified
      else
        nil
      end
    end
  end
end
