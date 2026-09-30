private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum EbsEncryptionSupport
    Unsupported
    Supported

    def self.to_json(e : EbsEncryptionSupport, json : JSON::Builder) : Nil
      value = case e
              when AEC::EbsEncryptionSupport::Unsupported then "unsupported"
              when AEC::EbsEncryptionSupport::Supported   then "supported"
              else
                raise Exception.new("unknown enum value for 'EbsEncryptionSupport' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::EbsEncryptionSupport
      value = pull.read_string
      case value
      when "unsupported" then AEC::EbsEncryptionSupport::Unsupported
      when "supported"   then AEC::EbsEncryptionSupport::Supported
      else
        raise Exception.new("unknown enum value for 'EbsEncryptionSupport' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::EbsEncryptionSupport::Unsupported then "unsupported"
      when AEC::EbsEncryptionSupport::Supported   then "supported"
      else
        raise Exception.new("unknown enum value for 'EbsEncryptionSupport' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::EbsEncryptionSupport?
      case key
      when "unsupported" then AEC::EbsEncryptionSupport::Unsupported
      when "supported"   then AEC::EbsEncryptionSupport::Supported
      else
        nil
      end
    end
  end
end
