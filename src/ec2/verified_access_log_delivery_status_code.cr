private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VerifiedAccessLogDeliveryStatusCode
    Success
    Failed

    def self.to_json(e : VerifiedAccessLogDeliveryStatusCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::VerifiedAccessLogDeliveryStatusCode::Success then "success"
              when AEC::VerifiedAccessLogDeliveryStatusCode::Failed  then "failed"
              else
                raise Exception.new("unknown enum value for 'VerifiedAccessLogDeliveryStatusCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VerifiedAccessLogDeliveryStatusCode
      value = pull.read_string
      case value
      when "success" then AEC::VerifiedAccessLogDeliveryStatusCode::Success
      when "failed"  then AEC::VerifiedAccessLogDeliveryStatusCode::Failed
      else
        raise Exception.new("unknown enum value for 'VerifiedAccessLogDeliveryStatusCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VerifiedAccessLogDeliveryStatusCode::Success then "success"
      when AEC::VerifiedAccessLogDeliveryStatusCode::Failed  then "failed"
      else
        raise Exception.new("unknown enum value for 'VerifiedAccessLogDeliveryStatusCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VerifiedAccessLogDeliveryStatusCode?
      case key
      when "success" then AEC::VerifiedAccessLogDeliveryStatusCode::Success
      when "failed"  then AEC::VerifiedAccessLogDeliveryStatusCode::Failed
      else
        nil
      end
    end
  end
end
