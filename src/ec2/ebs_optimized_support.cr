private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum EbsOptimizedSupport
    Unsupported
    Supported
    Default

    def self.to_json(e : EbsOptimizedSupport, json : JSON::Builder) : Nil
      value = case e
              when AEC::EbsOptimizedSupport::Unsupported then "unsupported"
              when AEC::EbsOptimizedSupport::Supported   then "supported"
              when AEC::EbsOptimizedSupport::Default     then "default"
              else
                raise Exception.new("unknown enum value for 'EbsOptimizedSupport' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::EbsOptimizedSupport
      value = pull.read_string
      case value
      when "unsupported" then AEC::EbsOptimizedSupport::Unsupported
      when "supported"   then AEC::EbsOptimizedSupport::Supported
      when "default"     then AEC::EbsOptimizedSupport::Default
      else
        raise Exception.new("unknown enum value for 'EbsOptimizedSupport' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::EbsOptimizedSupport::Unsupported then "unsupported"
      when AEC::EbsOptimizedSupport::Supported   then "supported"
      when AEC::EbsOptimizedSupport::Default     then "default"
      else
        raise Exception.new("unknown enum value for 'EbsOptimizedSupport' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::EbsOptimizedSupport?
      case key
      when "unsupported" then AEC::EbsOptimizedSupport::Unsupported
      when "supported"   then AEC::EbsOptimizedSupport::Supported
      when "default"     then AEC::EbsOptimizedSupport::Default
      else
        nil
      end
    end
  end
end
