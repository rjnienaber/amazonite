private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum EbsNvmeSupport
    Unsupported
    Supported
    Required

    def self.to_json(e : EbsNvmeSupport, json : JSON::Builder) : Nil
      value = case e
              when AEC::EbsNvmeSupport::Unsupported then "unsupported"
              when AEC::EbsNvmeSupport::Supported   then "supported"
              when AEC::EbsNvmeSupport::Required    then "required"
              else
                raise Exception.new("unknown enum value for 'EbsNvmeSupport' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::EbsNvmeSupport
      value = pull.read_string
      case value
      when "unsupported" then AEC::EbsNvmeSupport::Unsupported
      when "supported"   then AEC::EbsNvmeSupport::Supported
      when "required"    then AEC::EbsNvmeSupport::Required
      else
        raise Exception.new("unknown enum value for 'EbsNvmeSupport' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::EbsNvmeSupport::Unsupported then "unsupported"
      when AEC::EbsNvmeSupport::Supported   then "supported"
      when AEC::EbsNvmeSupport::Required    then "required"
      else
        raise Exception.new("unknown enum value for 'EbsNvmeSupport' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::EbsNvmeSupport?
      case key
      when "unsupported" then AEC::EbsNvmeSupport::Unsupported
      when "supported"   then AEC::EbsNvmeSupport::Supported
      when "required"    then AEC::EbsNvmeSupport::Required
      else
        nil
      end
    end
  end
end
