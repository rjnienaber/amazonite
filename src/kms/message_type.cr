private alias AK = Amazonite::Kms

module Amazonite::Kms
  enum MessageType
    Raw
    Digest
    ExternalMu

    def self.to_json(e : MessageType, json : JSON::Builder) : Nil
      value = case e
              when AK::MessageType::Raw        then "RAW"
              when AK::MessageType::Digest     then "DIGEST"
              when AK::MessageType::ExternalMu then "EXTERNAL_MU"
              else
                raise Exception.new("unknown enum value for 'MessageType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::MessageType
      value = pull.read_string
      case value
      when "RAW"         then AK::MessageType::Raw
      when "DIGEST"      then AK::MessageType::Digest
      when "EXTERNAL_MU" then AK::MessageType::ExternalMu
      else
        raise Exception.new("unknown enum value for 'MessageType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::MessageType::Raw        then "RAW"
      when AK::MessageType::Digest     then "DIGEST"
      when AK::MessageType::ExternalMu then "EXTERNAL_MU"
      else
        raise Exception.new("unknown enum value for 'MessageType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::MessageType?
      case key
      when "RAW"         then AK::MessageType::Raw
      when "DIGEST"      then AK::MessageType::Digest
      when "EXTERNAL_MU" then AK::MessageType::ExternalMu
      else
        nil
      end
    end
  end
end
