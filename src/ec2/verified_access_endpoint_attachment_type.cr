private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VerifiedAccessEndpointAttachmentType
    Vpc

    def self.to_json(e : VerifiedAccessEndpointAttachmentType, json : JSON::Builder) : Nil
      value = case e
              when AEC::VerifiedAccessEndpointAttachmentType::Vpc then "vpc"
              else
                raise Exception.new("unknown enum value for 'VerifiedAccessEndpointAttachmentType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VerifiedAccessEndpointAttachmentType
      value = pull.read_string
      case value
      when "vpc" then AEC::VerifiedAccessEndpointAttachmentType::Vpc
      else
        raise Exception.new("unknown enum value for 'VerifiedAccessEndpointAttachmentType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VerifiedAccessEndpointAttachmentType::Vpc then "vpc"
      else
        raise Exception.new("unknown enum value for 'VerifiedAccessEndpointAttachmentType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VerifiedAccessEndpointAttachmentType?
      case key
      when "vpc" then AEC::VerifiedAccessEndpointAttachmentType::Vpc
      else
        nil
      end
    end
  end
end
