private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FlexibleEnaQueuesSupport
    Unsupported
    Supported

    def self.to_json(e : FlexibleEnaQueuesSupport, json : JSON::Builder) : Nil
      value = case e
              when AEC::FlexibleEnaQueuesSupport::Unsupported then "unsupported"
              when AEC::FlexibleEnaQueuesSupport::Supported   then "supported"
              else
                raise Exception.new("unknown enum value for 'FlexibleEnaQueuesSupport' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FlexibleEnaQueuesSupport
      value = pull.read_string
      case value
      when "unsupported" then AEC::FlexibleEnaQueuesSupport::Unsupported
      when "supported"   then AEC::FlexibleEnaQueuesSupport::Supported
      else
        raise Exception.new("unknown enum value for 'FlexibleEnaQueuesSupport' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FlexibleEnaQueuesSupport::Unsupported then "unsupported"
      when AEC::FlexibleEnaQueuesSupport::Supported   then "supported"
      else
        raise Exception.new("unknown enum value for 'FlexibleEnaQueuesSupport' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FlexibleEnaQueuesSupport?
      case key
      when "unsupported" then AEC::FlexibleEnaQueuesSupport::Unsupported
      when "supported"   then AEC::FlexibleEnaQueuesSupport::Supported
      else
        nil
      end
    end
  end
end
